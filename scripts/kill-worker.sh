#!/usr/bin/env bash
# «Убить» и оживить воркер для эксперимента с отказом ноды
set -euo pipefail

NODE="${1:-chaos-lab-worker}"

echo ">>> Убиваю ноду: $NODE"
docker kill "$NODE"

echo ">>> Проверь состояние: kubectl get nodes"
echo ">>> Через 30-60 сек оживляем..."

sleep 30
docker start "$NODE"

echo ">>> Смотрим, как поды возвращаются:"
kubectl get pods -o wide -w
