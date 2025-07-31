import sys
import os
import socket
import time
from PIL import Image
import numpy as np
from PyQt5.QtWidgets import QApplication, QMainWindow, QPushButton, QWidget, QVBoxLayout, QFileDialog, QStatusBar, QProgressBar
from PyQt5.QtCore import QThread, pyqtSignal
#!---------------------------环境配置---------------------------*#
# conda create 
#*-------------------------------------------------------------*#
#!-------------------------exe文件生成-------------------------*#
# cd <path_to_project>/Elephotoframe/BackendPy/
# pipinstaller --onefile --windowed ui.py        
# 生产exe <path_to_project>/Elephotoframe/BackendPy/dist/ui.exe
#*------------------------------------------------------------*#

# --- 常量定义 ---
HOST_IP = '0.0.0.0'  # 监听所有网络接口
PORT = 5130          # 通信端口
MAX_WIDTH = 200      # 图像最大宽度
MAX_HEIGHT = 185     # 图像最大高度
CHUNK_SIZE = 256     # 数据块大小
DELAY = 0.5          # 发送延迟
STATE_BYTE = bytes([0x5A]) # 状态/特殊指令字节

# ======================================================================
#  网络通信工作线程 (Worker Thread)
# ======================================================================
class SendWorker(QThread):
    # 定义信号：
    # 1. 更新状态栏信息 (字符串)
    # 2. 更新进度条 (整数 0-100)
    update_status = pyqtSignal(str)
    update_progress = pyqtSignal(int) # 新增信号，用于更新进度条

    def __init__(self, task, image_path=None):
        super().__init__()
        self.task = task
        self.image_path = image_path
        self.server_socket = None
        self.conn = None

    def connect_to_client(self):
        """建立服务器并等待客户端连接"""
        try:
            self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            self.server_socket.bind((HOST_IP, PORT))
            self.server_socket.listen(1)
            self.update_status.emit(f"等待设备连接 {HOST_IP}:{PORT}...")
            self.conn, addr = self.server_socket.accept()
            self.update_status.emit(f"设备连接成功: {addr}")
            return True
        except Exception as e:
            # 修改：错误信息直接发送到状态栏
            self.update_status.emit(f"连接错误: {e}")
            return False

    def process_and_send_image(self):
        """处理图像并按协议发送"""
        try:
            self.update_status.emit("正在处理图片...")
            img = Image.open(self.image_path)
            img.thumbnail((MAX_WIDTH, MAX_HEIGHT), Image.LANCZOS)
            if img.mode != 'RGB':
                img = img.convert('RGB')
            
            img_array = np.array(img)
            new_width, new_height = img.width, img.height
            self.update_status.emit(f"图片缩放至: {new_width}x{new_height}，准备传输...")

            image_bytes = bytearray()
            for r, g, b in img_array.reshape(-1, 3):
                r4, g4, b4 = (r >> 4) & 0xF, (g >> 4) & 0xF, (b >> 4) & 0xF
                byte1, byte2 = (b4 << 4) | g4, (r4 << 4)
                image_bytes.append(byte1)
                image_bytes.append(byte2)
        except Exception as e:
            self.update_status.emit(f"图像处理失败: {e}")
            return

        if not self.connect_to_client():
            return
            
        try:
            # --- 新增：用于计算速度 ---
            start_time = time.time()
            total_sent = 0
            # ---
            
            self.conn.send(STATE_BYTE)
            self.conn.send(bytes([new_width]))
            self.conn.send(bytes([new_height]))
            
            total_size = len(image_bytes)
            for i in range(0, total_size, CHUNK_SIZE):
                chunk = image_bytes[i:i+CHUNK_SIZE]
                self.conn.send(chunk)
                
                # --- 速度与进度计算和信号发射 ---
                total_sent += len(chunk)
                elapsed_time = time.time() - start_time
                speed = (total_sent / 1024) / elapsed_time if elapsed_time > 0 else 0
                progress = (total_sent / total_size) * 100

                # 发射信号更新UI
                self.update_status.emit(f"正在发送: {progress:.1f}% | {speed:.2f} KB/s")
                self.update_progress.emit(int(progress))
                # ---
                
                time.sleep(DELAY)
            
            self.conn.send(STATE_BYTE)
            self.update_status.emit("传输完成！")

        except Exception as e:
            self.update_status.emit(f"传输失败: {e}")
        finally:
            self.cleanup()

    def send_clear_command(self):
        """发送清除指令"""
        if not self.connect_to_client():
            return
            
        try:
            self.update_status.emit("正在发送清除指令...")
            self.conn.send(STATE_BYTE)
            self.update_status.emit("清除指令已发送。")
        except Exception as e:
            self.update_status.emit(f"发送清除指令失败: {e}")
        finally:
            self.cleanup()
            
    def run(self):
        """线程入口函数"""
        if self.task == 'upload':
            self.process_and_send_image()
        elif self.task == 'clear':
            self.send_clear_command()

    def cleanup(self):
        """关闭连接和套接字"""
        if self.conn:
            self.conn.close()
        if self.server_socket:
            self.server_socket.close()

# ======================================================================
#  主窗口 UI
# ======================================================================
class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.worker = None
        self.initUI()

    def initUI(self):
        self.setWindowTitle("图像上传")
        self.setGeometry(100, 100, 350, 200)

        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        layout = QVBoxLayout(central_widget)

        self.upload_btn = QPushButton("上传图片")
        self.upload_btn.clicked.connect(self.select_and_upload_image)
        layout.addWidget(self.upload_btn)

        self.clear_btn = QPushButton("清除图片")
        self.clear_btn.clicked.connect(self.clear_image)
        layout.addWidget(self.clear_btn)

        # --- 新增：进度条 ---
        self.progress_bar = QProgressBar(self)
        self.progress_bar.setVisible(False) # 初始时隐藏
        self.progress_bar.setTextVisible(True)
        self.progress_bar.setRange(0, 100)
        layout.addWidget(self.progress_bar)
        # ---
        
        self.statusBar = QStatusBar()
        self.setStatusBar(self.statusBar)
        self.statusBar.showMessage("准备就绪")

    def select_and_upload_image(self):
        """打开文件对话框选择图片并启动上传线程"""
        file_filter = "图片文件 (*.jpg *.jpeg *.png *.bmp)"
        image_path, _ = QFileDialog.getOpenFileName(self, "请选择一张图片", "", file_filter)

        if image_path:
            self.start_worker('upload', image_path)

    def clear_image(self):
        """启动清除任务线程"""
        self.start_worker('clear')

    def start_worker(self, task, image_path=None):
        """创建并启动工作线程"""
        if self.worker is not None and self.worker.isRunning():
            self.statusBar.showMessage("错误: 当前有任务正在进行中，请等待其完成。")
            return
            
        self.worker = SendWorker(task, image_path)
        
        # 连接通用信号
        self.worker.update_status.connect(self.statusBar.showMessage)
        self.worker.finished.connect(self.on_worker_finished)
        
        # --- 修改：根据任务类型进行不同的UI设置 ---
        if task == 'upload':
            # 如果是上传任务，连接进度条信号并显示进度条
            self.progress_bar.setValue(0)
            self.progress_bar.setVisible(True)
            self.worker.update_progress.connect(self.progress_bar.setValue)
        else:
            # 其他任务（如清除），隐藏进度条
            self.progress_bar.setVisible(False)
        # ---

        self.worker.start()
        self.upload_btn.setEnabled(False)
        self.clear_btn.setEnabled(False)
        
    def on_worker_finished(self):
        """线程完成后的收尾工作"""
        # 任务完成后，让状态栏的消息停留一会儿后再恢复默认
        # 这里简单地在下一次任务开始时覆盖，或保持最后的状态
        self.upload_btn.setEnabled(True)
        self.clear_btn.setEnabled(True)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())