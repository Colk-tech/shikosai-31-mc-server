# shikosai-31-mc-server
A constructing files for Minecraft Servers of 31th Shikosai at NITIC

# Quick Start
## 1. ポートの開放
外部からのアクセスを受け付けるために、UFW などを用いて以下の「露出ポート番号」を開放してください。

## 2. サーバーの起動
```docker-compose up -d``` ですべてのサーバーが起動します。

# Containers
- arch_server (建築サーバー)
  - 露出ポート番号 (MineCraft) </br>
    ***`10065`***
  - 露出ポート番号 (RCON) </br>
    ***`10075`***
- prgs_server (進捗サーバー)
  - 露出ポート番号 (MineCraft) </br>
    ***`20065`***
  - 露出ポート番号 (RCON) </br>
    ***`20075`***

# Volumes
今回、全てのデータは `Docker Volume` と呼ばれる領域に保存されます。

# <font colot="yellow">Security Notice</font>
今回のインスタンスには、**遠隔操作ができる** RCON という機能が備わっています。

そのため、本番環境へのデプロイ時には **環境変数 `RCON_PASSWORD` を必ず変更して下さい。***

# How to...
## `whitelist.json` などの設定ファイルを読み込みたい
`init_data` の各サーバー名に対応するディレクトリにて、配置したいファイルを全ておいて下さい。

それらすべてが、サーバー自体が起動する前に `.jar` と同階層にコピーされます。

もちろんディレクトリを用いた再帰的なファイル配置も可能です。

## プラグインを追加したい
対応する `Dockerfile` を編集して、`wget` コマンドを用いて、`data/plugins/` に対象の `jar` ファイルを入れて下さい。

## サーバーコマンドを発行したい。
`RCON` を用いて遠隔でサーバーを制御することができます。

詳細は以下を確認して下さい。

**なお、セキュリティ上のリスクのため SSH でサーバーに実際にログインしているとき以外は操作しないで下さい。**

[SpigotサーバをRCONで遠隔操作してみる - 石橋を叩いて壊すブログ](https://www.jias.jp/blog/?86)

# Reference
## 環境変数について
[コンテナ版マインクラフトサーバを構築してhttps化したDynmapを使う - Qiita](https://qiita.com/pitekusu/items/cdc67afe4d908cb1c77c)
## docker-minecraft-server のドキュメント
[docker-minecraft-server/README.md at master · itzg/docker-minecraft-server · GitHub](https://github.com/itzg/docker-minecraft-server/blob/master/README.md)
## docker-mc-backup のドキュメント
[docker-mc-backup/README.md at master · itzg/docker-mc-backup · GitHub](https://github.com/itzg/docker-mc-backup/blob/master/README.md)
