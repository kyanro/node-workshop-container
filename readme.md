# node school のワークショップ用で利用できるコンテナ
注意点: 基本的に立ち上げ直したら状態が元に戻るので注意

## 使い方
`docker build -t node_workshop .`

### windows
1. sshを利用できるようにクライアント[rlogin](http://nanno.dip.jp/softlib/man/rlogin/)等をダウンロードしておく
2. workshopのコードを置く場所を準備する(c:/Users/myuser/workshop)
3. 立ち上げる docker コンテナを立ち上げる(2022番ポートでssh, 2で作成したユーザを共有)
	+ `docker run -d -p 2022:22 -v "//c/Users/myuser/workshop:/usr/src/app" --name nodeschool node_workshop`
4. ssh を利用してコンテナにログインする
	+ host: `192.168.99.100`, port: `2022`, user: `root`, pass: `root`
5. 利用したいワークショップを npm installする。下記は `learnyounode`の場合
	`npm install -g learnyounode`
6. 必要なら choose language から日本語を選択する

+ もしグローバルに入れたくない場合は `npm install learnyounode --no-bin-links`

### mac(未確認)
### windows
1. workshopのコードを置くフォルダを準備する
2. 立ち上げる docker コンテナを立ち上げる(2022番ポートでssh, 2で作成したユーザを共有)
	+ `docker run -d -p 2022:22 -v "`workshopのコードを置くフォルダ`:/usr/src/app" --name nodeschool node_workshop`
3. ssh を利用してコンテナにログインする
	+ host: `192.168.99.100`, port: `2022`, user: `root`, pass: `root`
4. 利用したいワークショップを npm installする。下記は `learnyounode`の場合
	`npm install -g learnyounode`
5. 必要なら choose language から日本語を選択する
