# Watchtower ECR

This repo is inspired by [heyarny/watchtower-ecr](https://github.com/heyarny/watchtower-ecr).

This docker image is based on [containrrr/watchtower](https://github.com/containrrr/watchtower) for use with AWS ECR.

## Usage

Run the container with the following command:

```bash
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /path/to/docker-config.json:/config.json \
  -e "AWS_ACCESS_KEY_ID=<ACCESS_KEY_ID>" \
  -e "AWS_SECRET_ACCESS_KEY=<SECRET_ACCESS_KEY>" \
  cbwchuck/watchtower-ecr:latest --interval 30 --cleanup
```

If you prefer, you can use the docker-compose.yml, an example looks like this

```bash
services:
  my-service:
    image: <id>.dkr.ecr.<region>.amazonaws.com/my-image:latest
  watchtower:
    image: cbwchuck/watchtower-ecr:latest
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /path/to/docker-config.json:/config.json
    environment:
      AWS_ACCESS_KEY_ID: <ACCESS_KEY_ID>
      AWS_SECRET_ACCESS_KEY: <SECRET_ACCESS_KEY>
    command: --interval 30 --cleanup
```
