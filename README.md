# docker-1.12-trial

## node確認
```
docker node ls
```

## serviceデプロイと確認
```
docker service create --name nginx --replicas 1 -p 80:80/tcp nginx
docker service ls
docker service tasks nginx
```

## WEBサーバ動作確認
```
curl http://manager
curl http://node01
curl http://node02
```




docker swarm init --advertise-addr eth1

docker swarm join \
  --token SWMTKN-1-44lbxizvvl04cw8lmgaz3cznwfv9ksvyy0uwzcthcgo5w9nwfv-aj7ekr3ojj6o7mrfs2nmrwqbw \
  192.168.33.10:2377

docker node ls


docker service create --name nginx --replicas 1 -p 80:80 nginx
docker service ls

docker service ps nginx

docker service rm nginx

docker service scale nginx=3
docker service update --replicas=3 nginx


docker service create --name redis --replicas=5 --network ingress redis:3.0.6

docker exec -it nginx.2.dl7mdhwrlqfd0krz5h9fdkjn5 ping redis


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
docker service create --network ingress --name nginx4 --replicas 1 -p 80 nginx

# publish portを取得
docker service inspect nginx4 --format='{{range .Endpoint.Ports}}{{println .PublishedPort}}{{end}}'



