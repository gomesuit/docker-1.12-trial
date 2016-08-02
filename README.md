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
