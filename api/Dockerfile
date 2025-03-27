# ベースイメージ
FROM python:3.11

# 作業ディレクトリ
WORKDIR /app

# 依存関係のインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 必要なパッケージをインストールし、不要なキャッシュを削除
RUN apt-get update && apt-get install -y \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# アプリケーションのコピー
COPY . .

# ポート指定（Cloud Run は 8080 を使用する）
EXPOSE 8080

# Gunicorn でサーバー起動（PORT 環境変数を使用）
CMD exec gunicorn --bind 0.0.0.0:$PORT config.wsgi:application
