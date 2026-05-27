FROM debian:trixie-slim AS etapa1

RUN apt-get update && apt-get install -y curl unzip 

WORKDIR /descargas

RUN curl -L -o world-1.0 https://ftp.postgresql.org/pub/projects/pgFoundry/dbsamples/world/world-1.0/world-1.0.tar.gz && tar -x world-1.0 

FROM postgres:14.23-alpine3.23

COPY --from=etapa1 /descargas/dbsamples-0.1/world/world.sql /docker-entrypoint-initdb.d/01-world.sql