# Build the container
build:
	docker build -t server .

# Run container
up:
	docker run --name server --network client_grpc-network server;

# Stop and remove a running container
stop:
	docker stop server; docker rm server

create_network:
	docker network create grpc-network