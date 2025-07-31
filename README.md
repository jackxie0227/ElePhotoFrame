## ElePhotoFrame/ 项目主文件夹
- src/ 源文件
- sim/ Modelsim仿真文件

## 环境配置
```bash
conda create -n elephotoframe python=3.10
conda activate elephotoframe
cd BackendPy/
pip install -r requirements.txt
```

## BackendPy/ui.py 图片上传
- 生成可执行文件
```bash
cd BackendPy/
pyinstaller --onefile --windowed ui.py 
BackendPy/dist/ui.exe
```