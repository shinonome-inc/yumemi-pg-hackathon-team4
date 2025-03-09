# ベースイメージ
FROM python:3.11

# 作業ディレクトリ
WORKDIR /app

# 依存関係のインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションのコピー
COPY . .

# ポート指定
EXPOSE 8000

# サーバー起動
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"]
