バックエンドチーム
開発するときは

1.必ずブランチを切る
2.テストは正常だけでもしっかり書く
3.動作確認するときはDockerを立ち上げる(コードを変更した際は再度立ち上げる必要があることが判明)
4.flack8 isort . black .でフォーマットを整える


--環境構築について--
Docker関連
1.Dockerをダウンロードしていない場合は公式からダウンロードする

2.apiディレクトリの中に.envファイルを作成する
書く内容

# PostgreSQLの環境変数
DATABASE_URL=postgres://user:password@db:5432/db_name
DB_USER=user
DB_PASSWORD=password
DB_NAME=db_name

3.Docker Desktopを起動後ターミナルで
docker-compose up --build -d

4.マイグレーション
docker-compose exec web python manage.py migrate

5.テスト
docker-compose exec web python manage.py test

6.管理サイト
docker-compose exec web python manage.py createsuperuser

