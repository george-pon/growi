# growi

growi用のhelm chart

* https://hub.docker.com/r/weseek/growi  growi docker hub


### 使い方

ingress指定で、ホスト名を「growi.minikube.local」にする場合の設定。

```

# template作成で一度確認
helm template --name growi growi \
    --values - << "EOF"
settings:
  appsiteurl: http://growi.minikube.local
ingress:
  enabled: true
  hosts:
    - growi.minikube.local
  paths:
    - /
EOF


helm install --name growi growi \
    --values - << "EOF"
settings:
  appsiteurl: http://growi.minikube.local
ingress:
  enabled: true
  hosts:
    - growi.minikube.local
  paths:
    - /
EOF

```
