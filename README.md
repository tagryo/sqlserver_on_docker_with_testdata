# テストデータ投入済みの SQL Server の Docker イメージを作る

## 概要
データ投入済みの RDB の Docker イメージを作成する Dockerfile と、 Docker の実行環境となる Vagrantfile を提供する。
単体テストやE2Eテストの実行前にコンテナを起動し、テストの実行後にコンテナを落とせば、更新処理を伴う互いのテスト結果に依存せずに、DBを使用したテストを実行できるようになる。

## 使い方
### 投入データの準備
実行するDDLとSQLは、 `test-container/setup-data/1` フォルダへ格納する。
DDLやSQLの実行順序を考慮しなければならない場合、 `test-container/setup-data/2` `test-container/setup-data/3` フォルダを作成し、そこにDDLやSQLファイルを配置する。

同じフォルダに `*.ddl` と `*.sql` がある場合、 `*.ddl` を実行後に `*.sql` を実行する。

### Docker コンテナの起動
#### ホストマシンに Docker の実行環境がある場合
Docker の実行環境が既にある場合、 `test-container` フォルダへ移動し、 Docker イメージを作成すればすぐに使用できる。

1. Docker イメージをビルドする
```
docker build -t api-test-mssql-ready .
```

2. Docker コンテナを起動する
```
docker run -d -p 1433:1433 --name api-test-mssql api-test-mssql-ready
```

#### Vagrant の実行環境が整っている場合
Vagrant の実行環境が整っていれば、ホストマシンに Docker をインストールしていなくてもコンテナの実行環境を簡単に作成できる。

1. Docker の実行環境を構築する。
```
vagrant up
```

2. 仮想環境へログインし、該当フォルダへ移動
```
vagrant ssh
cd /vagrant/test-container
```

3. 上記の「ホストマシンに Docker の実行環境がある場合」と同様に、Docker イメージをビルドして、コンテナを起動する


