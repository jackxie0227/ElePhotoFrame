import socket 
import numpy as np
from PIL import Image
import time
import sys
import os
from argparse import ArgumentParser

def parse_args():
    parser = ArgumentParser()
    parser.add_argument('--img',
                        type=str,
                        help='image file path [str]')
    parser.add_argument('--ip',
                        type=str, default='0.0.0.0',
                        help='your host ip [str]')
    parser.add_argument('--port',
                        type=int, default=5130,
                        help='your host port [int]')
    parser.add_argument('--START_MARKER',
                        type=bytes, default=bytes([0xA5]),
                        help='start signal to inform fpga')
    parser.add_argument('--END_MARKER',
                        type=bytes, default=bytes([0x5A]),
                        help='end signal to inform fpga')
    parser.add_argument('--chunk_size',
                        type=int, default=1024,
                        help='numbers of kbytes send each time')
    return parser.parse_args()

# img => bytes
def image2bytes(image_path):
    # resize
    img = Image.open(image_path)
    img = img.resize((1024, 768), Image.LANCZOS)
    if img.mode != 'RGB':
        img = img.convert('RGB')
    
    # img -> numpy -> bytes
    img_array = np.array(img)
    img_bytes = bytearray()
    
    # RGB565 压缩
    for y in range(img_array.shape[0]): # 
        for x in range(img_array.shape[1]):
            r, g, b = img_array[y, x]
            rgb565 = ((r & 0xF8)<<8)|((g & 0xFC)<<3)|(b>>3)
            img_bytes.append((rgb565 >> 8) & 0xFF)
            img_bytes.append(rgb565 & 0xFF)
            
    return img_bytes

def connet_init(host_ip, host_port):
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((host_ip, host_port))
    print(f"等待连接 {args.ip}:{args.port}...")
  
    conn, addr = server.accept()  
    print(f"连接成功: {addr}")
    
    return server, conn

def send_bytes(args):
    # img -> bytes
    try:
        img_bytes = image2bytes(args.img)
    except Exception as e:
        print(f"图片处理失败: {e}")
        sys.exit(1)
    
    # server init (hostmode connection initialize)
    try:
        server, conn = connet_init(args)
    except Exception as e:
        print(f"连接失败: {e}")
        sys.exit(1)
    
    try:
        total_sent = 0
        total_size = len(img_bytes)
        
        conn.send(args.START_MARKER) # send start bytes
        time.sleep(0.1)
        
        start_time = time.time()
        chunk_size = args.chunk_size
        for i in range(0, total_size, chunk_size):
            # send chunk bytes data
            chunk = img_bytes[i:i+chunk_size] 
            conn.send(chunk) 
            total_sent += len(chunk)
            
            # show progress
            percent = (total_sent * 100) / total_size
            elapsed_time = time.time() - start_time
            speed = total_sent / (elapsed_time * 1024) if elapsed_time > 0 else 0
            estimated_total = (elapsed_time / percent) * 100 if percent > 0 else 0
            remaining = estimated_total - elapsed_time if estimated_total > 0 else 0
            
            sys.stdout.write(f"\r发送进度: {percent:.2f}% | "
                            f"{total_sent/(1024*1024):.2f}/{total_size/(1024*1024):.2f} MB | "
                            f"{speed:.2f} KB/s | "
                            f"剩余: {remaining:.1f}秒")
            sys.stdout.flush()
            
            time.sleep(0.01)
            
        print('\n图片字节流发送完成')
        conn.send(args.END_MARKER)
        return True
    except Exception as e:
        print(f"图片字节流数据发送失败：{e}")
        sys.exit(1)
        
    
    
if __name__ == '__main__':
    base_dir = os.path.dirname(os.path.abspath(__file__))
    imagefoler_dir = os.path.join(base_dir, 'images')
    image_path = os.path.join(imagefoler_dir, 'sunset.png')
    
    args = parse_args()
    args.img = image_path
    
    if(send_bytes(args)):
        print('\ncomplete!')
