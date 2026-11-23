# SRE-kind-lab

Лаборатория для экспериментов с Kubernetes и хаос-инжинирингом на локальном кластере kind.

## Быстрый старт

```bash
# 1. Создать кластер
kind create cluster --name chaos-lab --config kind-config.yaml

# 2. Проверить узлы
kubectl get nodes

# 3. Развернуть демо-приложение
kubectl apply -f deployments/nginx-demo.yaml

# 4. Посмотреть поды и на каких нодах они живут
kubectl get pods -o wide

# 5. Удалить кластер, когда закончишь
kind delete cluster --name chaos-lab
```

## Структура репозитория

- `kind-config.yaml` — конфигурация кластера (1 control-plane + 2 worker)
- `deployments/` — манифесты приложений
- `services/` — манифесты Service (доступ к приложениям)
- `chaos/` — эксперименты с хаос-инжинирингом (Chaos Mesh и ручные сбои)
- `monitoring/` — Prometheus + Grafana (позже)
- `scripts/` — вспомогательные скрипты для экспериментов
- `notes/` — заметки и результаты наблюдений

## Порядок экспериментов

1. Деплой приложения и проверка самовосстановления (kubectl delete pod).
2. «Убийство» воркера: docker kill chaos-lab-worker — наблюдать миграцию подов.
3. Подключение мониторинга и снятие метрик.
4. Хаос-эксперименты через Chaos Mesh.
