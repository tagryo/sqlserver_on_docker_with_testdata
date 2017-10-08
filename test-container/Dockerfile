FROM microsoft/mssql-server-linux:latest

# コンテナのロケールを日本に変更
RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

RUN mkdir -p /data
# SQL Server 起動の環境変数を設定
ENV MSSQL_DATA_DIR /data
ENV ACCEPT_EULA Y
ENV SA_PASSWORD P@55w0rd
ENV MSSQL_LCID 1041
ENV MSSQL_COLLATION Japanese_90_CS_AS_KS_WS_SC

EXPOSE 1433

# 初期実行データをコンテナ内へコピーする
RUN mkdir -p /usr/src/app/setup-data
WORKDIR /usr/src/app/setup-data
COPY setup-data /usr/src/app/setup-data

# コンテナビルドのスクリプトをコンテナ内へコピーする
WORKDIR /usr/src/app
COPY entrypoint.sh /usr/src/app/
COPY import-data.sh /usr/src/app/

RUN chmod +x /usr/src/app/import-data.sh

RUN /bin/bash /usr/src/app/entrypoint.sh
