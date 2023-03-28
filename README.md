# docker_ros2_foxy_on_windows
ターミナルだけだが，RvizなどのGUIも動く．

## GUIを使うための設定
X-serverを使えるようにする

1. X-serverをインストール
```
winget install marha.VcXsrv
```
1. X-serverを立ち上げる
    - アプリXLAUNCHをスタートメニューなどから起動
    - 設定は気にせず，nextを押していく

- 参考
https://zenn.dev/dozo/articles/3ef1565b2b069e

## makeコマンド
コンテナのイメージファイル作成
```
make build
```

コンテナ生成+起動
```
make run
```

コンテナ起動（コンテナ停止しているものを起動）
```
make start
```
※make runではすでにあるコンテナは起動できない

コンテナに入る（インタラクティブシェル）
```
make shell
```

コンテナ停止（停止しないと削除できない）
```
make stop
```

コンテナ削除
```
make rm
```

githubへプッシュ
```
make git
```