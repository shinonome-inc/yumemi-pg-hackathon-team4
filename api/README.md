バックエンドチーム
開発するときは
1.Dockerを動かして仮想環境に入る
2.必ずブランチを切る
3.テストは正常だけでもしっかり書く
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

