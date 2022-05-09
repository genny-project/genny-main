FROM debian
RUN apt-get update && \
    apt-get install -y mariadb-client
RUN mkdir /updater
WORKDIR /updater
RUN mkdir bin
RUN mkdir update_sqls
COPY bin bin/
COPY files_to_be_run.txt .
COPY update_sqls update_sqls/
ENTRYPOINT ["bash", "/updater/bin/entrypoint.sh"]
