#pythonイメージを指定
FROM python:3.8
#nodeイメージをpullする
FROM node:10.15.3-alpine

# 環境変数を設定　バッファーを無効にする
ENV PYTHONUNBUFFERED 1

# コンテナ内にcodeディレクトリ作成　作業ディレクトリに割り当てる
RUN mkdir /code
WORKDIR /code

# ホストPCにあるrequirements.txtをコンテナ内のcodeディレクトリにコピー
# requirements.txtを使ってパッケージをインストール
ADD requirements.txt /code/
RUN pip install -r requirements.txt

# ホストPC各種ファイルをcodeディレクトリにコピー
ADD . /code/
