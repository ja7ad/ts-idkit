# tsdb-idkit: TimescaleDB with pg_idkit Extension

[![Docker Pulls](https://img.shields.io/docker/pulls/ja7adr/tsdb-idkit)](https://hub.docker.com/r/ja7adr/tsdb-idkit)

A ready-to-use Docker image for TimescaleDB (PostgreSQL) with the [pg_idkit](https://github.com/VADOSWARE/pg_idkit) extension pre-installed and initialized. Ideal for projects requiring scalable time-series data and unique ID generation.

## Features
- Based on the official TimescaleDB image (`timescale/timescaledb:latest-pg17`)
- Installs and configures the `pg_idkit` extension
- Automatic initialization of the extension on first container startup
- Suitable for development, testing, and production

## Usage

### Pull the Image
```sh
docker pull ja7adr/tsdb-idkit
```

### Run with Docker
```sh
docker run -d \
  --name tsdb-idkit \
  -e POSTGRES_PASSWORD=yourpassword \
  -p 5432:5432 \
  ja7adr/tsdb-idkit
```

### Docker Compose Example
```yaml
version: '3.8'
services:
  db:
    image: ja7adr/tsdb-idkit
    environment:
      POSTGRES_PASSWORD: yourpassword
    ports:
      - "5432:5432"
    volumes:
      - db_data:/var/lib/postgresql/data
volumes:
  db_data:
```

## Extension Details
- The `pg_idkit` extension is installed and available for use.
- On first startup, the container runs initialization scripts to enable the extension.
- Custom scripts (`init-pg_idkit.sh`, `init.sql`) are included for automatic setup.

## Customization
To add your own initialization scripts, place them in the `/docker-entrypoint-initdb.d/` directory in a derived image.

## Source & Documentation
- Docker Hub: [ja7adr/tsdb-idkit](https://hub.docker.com/r/ja7adr/tsdb-idkit)
- TimescaleDB: https://www.timescale.com/
- pg_idkit: https://github.com/VADOSWARE/pg_idkit

## License
This project is provided under the same license as the upstream TimescaleDB and pg_idkit projects. See their respective repositories for details.
