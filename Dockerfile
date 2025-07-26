FROM timescale/timescaledb:latest-pg17

LABEL maintainer="ja7ad@live.com"

# Download and extract pg_idkit
RUN wget -c https://github.com/VADOSWARE/pg_idkit/releases/download/v0.3.1/pg_idkit-0.3.1-pg17-musl.tar.gz && \
    tar -xf pg_idkit-0.3.1-pg17-musl.tar.gz

# Move .so file and extension SQL files
RUN mv pg_idkit-0.3.1/lib/postgresql/pg_idkit.so /usr/local/lib/postgresql/pg_idkit.so && \
    mv pg_idkit-0.3.1/share/postgresql/extension/* /usr/local/share/postgresql/extension/

# Clean up
RUN rm -rf pg_idkit-0.3.1*

# Copy initialization scripts
COPY init-pg_idkit.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/

# Ensure the shell script is executable
RUN chmod +x /docker-entrypoint-initdb.d/init-pg_idkit.sh

