# Build the container
build:
	docker build -t sender-service .

# Run container
up:
	docker run --name sender-service sender-service;

# Stop and remove a running container
stop:
	docker stop sender-service; docker rm sender-service