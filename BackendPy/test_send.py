import socket
def run_as_server():
    HOST = '0.0.0.0'  # 本机IP
    PORT = 5130       # 服务端口

    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((HOST, PORT))
    server.listen(1)
    print(f"等待ESP连接 {HOST}:{PORT}...")
  
    conn, addr = server.accept()  # 阻塞直到ESP连接
    print(f"ESP连接成功: {addr}")
  
    # 发送数据到ESP
    data = bytes([0x5A])
    conn.send(data)
    ack = conn.recv(1)
    if ack:
        print(f"收到回复：{ack.hex()}")
    conn.close()
  
if __name__ == '__main__':
    run_as_server()