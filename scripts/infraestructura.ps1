docker pull redis:7-alpine
docker pull postgres:16-alpine
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}"
docker volume ls
cd ..\infra
docker compose down
docker compose up -d
docker compose exec db-service psql -U usuario_uleam -d bd_integracion -c "SELECT version()"
docker compose exec cache-service redis-cli ping
docker compose ps