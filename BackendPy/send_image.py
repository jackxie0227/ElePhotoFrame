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
    parser.add_argument('--STATECHANGE_BYTE',
                        type=bytes, default=bytes([0x5A]),
                        help='end signal to inform fpga')
    parser.add_argument('--chunk_size',
                        type=int, default=1024,
                        help='numbers of kbytes send each time')
    return parser.parse_args()

# img => bytes
def image2bytes(args):
    # resize
    img = Image.open(args.img)
    img = img.resize((50, 40), Image.LANCZOS)
    if img.mode != 'RGB':
        img = img.convert('RGB')
    
    # img -> numpy -> bytes
    img_array = np.array(img)
    img_bytes = bytearray()
    check_bytes = bytearray()
    
    # RGB444 压缩（12位色彩深度，每个颜色分量4位）
    for y in range(img_array.shape[0]):
        for x in range(img_array.shape[1]):
            r, g, b = img_array[y, x]
            # 转换为RGB444格式：每个颜色分量取高4位
            r4 = (r >> 4) & 0xF  # 取高4位
            g4 = (g >> 4) & 0xF
            b4 = (b >> 4) & 0xF
            
            # 组合为12位RGB444，打包成两个字节发送
            byte1 = (b4 << 4) | g4
            byte2 = (r4 << 4)  # 低4位为0
            
            img_bytes.append(byte1)
            img_bytes.append(byte2)
            
            check_byte = ((byte1 & 0x80) >> 0) | ((byte1 & 0x10) >> 0) | ((byte1 & 0x08) >> 0) | ((byte1 & 0x01) << 4) | \
                         ((byte2 & 0x80) >> 4) | ((byte2 & 0x10) >> 4) | ((byte2 & 0x08) >> 4) | ((byte2 & 0x01) >> 0)
            check_bytes.append(check_byte)
            
    return img_bytes, check_bytes

def connet_init(args):
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((args.ip, args.port))
    server.listen(1)
    print(f"等待连接 {args.ip}:{args.port}...")
  
    conn, addr = server.accept()  
    print(f"连接成功: {addr}")
    
    return server, conn

def send_bytes(args):
    # img -> bytes
    try:
        img_bytes, check_bytes = image2bytes(args)
    except Exception as e:
        print(f"图片处理失败: {e}")
        sys.exit(1)
    
    # server init (hostmode connection initialize)
    
    server, conn = connet_init(args)
    
    check_idx = 0
    
    try:
        total_sent = 0
        total_size = len(img_bytes)
        
        # conn.send(args.START_MARKER) # send start bytes
        # time.sleep(0.1)
        
        start_time = time.time()
        chunk_size = args.chunk_size
        for i in range(0, total_size, chunk_size):
            # send chunk bytes data
            chunk = img_bytes[i:i+chunk_size] 
            conn.send(chunk) 
            # if i % 2 == 1:
            #     rcv = conn.recv(1)
            #     if rcv.hex() != check_bytes[check_idx]:
            #         print(f"\nexpect:{check_bytes[check_idx]} received:{rcv.hex()}")
            #     else:
            #         print(f"\nexpect:{check_bytes[check_idx]} received:{rcv.hex()}")
            #     check_idx += 1
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
        conn.send(args.STATECHANGE_BYTE) # 跳转至 state=3 显示图片
        return True
    except Exception as e:
        print(f"图片字节流数据发送失败：{e}")
        sys.exit(1)
    finally:
        conn.close()
        server.close()

def run():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    imagefoler_dir = os.path.join(base_dir, 'images')
    image_path = os.path.join(imagefoler_dir, 'usahana.jpg')
    
    args = parse_args()
    args.img = image_path
    
    if(send_bytes(args)):
        print('\ncomplete!')
        
    
if __name__ == '__main__':
    run()
