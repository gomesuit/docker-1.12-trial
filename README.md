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

## WEBサーバ動作確認（上手くいかない）
```
curl http://manager
curl http://node01
curl http://node02
```
