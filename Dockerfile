FROM alpine:latest AS build

RUN apk add --no-cache libc6-compat gcc g++ git go && go install github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login@latest

FROM alpine:latest
COPY --from=containrrr/watchtower:latest / /
COPY --from=build /root/go/bin/docker-credential-ecr-login /bin/docker-credential-ecr-login

ENTRYPOINT ["/watchtower"]
