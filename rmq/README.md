# RabbitMQ Intro

## Desrciption

A simple test microservice application using RabbitMQ. The first service generates a random number, the second receives it and writes it to the database.

## Getting Started

To run the app, check out the Makefiles for each service.

To run rebbit use the following commands:
```
docker pull rabbitmq:3-management
```

```
docker run --rm -it --hostname my-rabbit -p 15672:15672 -p 5672:5672 rabbitmq:3-management
```