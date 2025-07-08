from PyQt5.QtWidgets import QApplication, QMainWindow, QPushButton, QWidget, QVBoxLayout
from PyQt5.QtCore import Qt
import sys
import subprocess
import os
import importlib.util
from argparse import Namespace

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("FPGA控制器")
        self.setGeometry(100, 100, 200, 200)
        self.setMinimumSize(200, 200)
        self.setMaximumSize(400, 400)
        
        # 主部件和布局
        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        layout = QVBoxLayout(central_widget)
        
        # 上传图像按钮
        self.upload_btn = QPushButton("上传图像")
        self.upload_btn.clicked.connect(self.upload_image)
        layout.addWidget(self.upload_btn)
        
        # 状态跳转按钮
        self.state_btn = QPushButton("状态跳转")
        self.state_btn.clicked.connect(self.change_state)
        layout.addWidget(self.state_btn)
        
        # 添加底部间距
        layout.addStretch()
        
    def upload_image(self):
        """执行send_image.py中的run()函数"""
        try:
            # 动态导入send_image模块
            spec = importlib.util.spec_from_file_location("send_image", "send_image.py")
            send_image = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(send_image)
            
            # 创建必要的args参数
            args = Namespace()
            args.ip = '0.0.0.0'
            args.port = 5130
            args.STATECHANGE_BYTE = bytes([0x5A])
            args.chunk_size = 1024
            args.img = os.path.join(os.path.dirname(__file__), 'images', 'usahana.jpg')
            
            # 执行图像发送
            send_image.send_bytes(args)
            
        except Exception as e:
            print(f"图像上传失败: {e}")
    
    def change_state(self):
        """执行send_state.py中的run_as_server()函数"""
        try:
            # 动态导入send_state模块
            spec = importlib.util.spec_from_file_location("send_state", "send_state.py")
            send_state = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(send_state)
            
            # 执行状态跳转
            send_state.run_as_server()
            
        except Exception as e:
            print(f"状态跳转失败: {e}")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())