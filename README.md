
# 起動
```
vagrant up
```

# ログイン
```
vagrant ssh manager
```

# ノードの確認
```
docker node ls
```

# サービスの作成
```
docker service create --name nginx --replicas 1 -p 80:80 nginx
```

# サービス一覧
```
docker service ls
```

# サービスの詳細
```
docker service ps nginx
```

## WEBサーバ動作確認
```
curl http://192.168.33.10
```

# ログの確認(experimental modeのみ)
```
docker service logs -f nginx
```

# リバランス
```
docker service update --force nginx
```

# サービスの削除
```
docker service rm nginx
```

# コンテナの数増加
```
docker service scale nginx=3
```

# コンテナの数増加
```
docker service update --replicas=3 nginx
```

# インスタンスを跨いだコンテナ間の名前解決の確認
```
docker network create -d overray test
docker service create --name nginx1 --network test nginx
docker service create --name nginx2 --network test nginx
docker service ls
docker service ps nginx1
docker service ps nginx2
docker exec -it nginx.2.dl7mdhwrlqfd0krz5h9fdkjn5 ping tasks.nginx1
```

# コンテナ間通信はtasks.<service>で可能
```
[root@manager ~]# docker exec -it 4663128864f4 dig tasks.nginx3

; <<>> DiG 9.9.5-9+deb8u6-Debian <<>> tasks.nginx3
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 65001
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;tasks.nginx3.      IN      A

;; ANSWER SECTION:
tasks.nginx3.     600     IN      A       10.255.0.15
tasks.nginx3.     600     IN      A       10.255.0.13
tasks.nginx3.     600     IN      A       10.255.0.14

;; Query time: 0 msec
;; SERVER: 127.0.0.11#53(127.0.0.11)
;; WHEN: Fri Sep 23 15:57:41 UTC 2016
;; MSG SIZE  rcvd: 114
```

# -pにコンテナ側のポートだけ書くとpublish portが自動で割り当てられる(30000-32767)
```
docker service create --network ingress --name nginx4 --replicas 1 -p 80 nginx
```

# publish portを取得
```
docker service inspect nginx4 --format='{{range .Endpoint.Ports}}{{println .PublishedPort}}{{end}}'
```

