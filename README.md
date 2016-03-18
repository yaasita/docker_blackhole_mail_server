# ブラックホールメールサーバ

どんなメールも吸い込みます
メール確認のWebUI(squirrelmail)もついてます

# 使い方

    # 実行
    docker run -P -v /tmp:/tmp black

    # apache
    # 80番ポートで squirrelmail
    ID / Password = mailuser / mailuser

    # postfix 
    # 25番ポート
    # localhost, 32782ポートに転送していた場合
    # 送信側postfix(/etc/postfix/main.cf)に以下追記
    relayhost = localhost:32782

    # ssh
    # 22番ポート
    ID / Password = root / root 

