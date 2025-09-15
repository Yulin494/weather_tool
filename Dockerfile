# 使用輕量的 Python 基礎映像檔
FROM python:3.11-slim

# 設定工作目錄
WORKDIR /app

# 複製 mcp.yaml 到根目錄，因為程式碼會從根目錄讀取它
COPY mcp.yaml .

# 複製 Python 應用程式碼
COPY ./app .

# 安裝依賴項
RUN pip install --no-cache-dir -r requirements.txt

# 開放 80 port
EXPOSE 80

# 容器啟動時執行的命令
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]