# `docker run -it [コンテナ名] mitmproxy` でproxyを通るデータを確認するためのコンテナ
# 日本語を表示したいので、sshでログインする前提のコンテナ。windowsなら rloginを利用するのがおすすめ

#Ubuntu14.04をベースにする
FROM ubuntu:14.04

MAINTAINER kyanro

# packageのupgrade と、日本語環境、sshd、mitmproxyに必要なpackageをインストール
RUN apt-get update && apt-get -y upgrade && \
  apt-get -y install \
    language-pack-ja-base language-pack-ja \
    openssh-server \
    curl

ENV HOME /root
WORKDIR /root

RUN curl -L git.io/nodebrew | perl - setup
ENV PATH $HOME/.nodebrew/current/bin:$PATH
RUN echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.bashrc
# nodebrew install-binary latest 
RUN nodebrew install-binary v5.5.0
RUN nodebrew use v5.5.0

#ssh の設定. user:root, pass:root でアクセスできるようにする
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# sshd の起動とポート設定
EXPOSE 22
CMD /usr/sbin/sshd -D

#日本語環境設定
RUN update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:ja

#環境変数設定
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8