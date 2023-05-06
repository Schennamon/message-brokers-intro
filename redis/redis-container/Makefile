# Run container
up:
	docker run --name redis-container -d -p 6379:6379 redis

# Stop and remove a running container
stop:
	docker stop redis-container; docker rm redis-container

create_network:
	docker network create network