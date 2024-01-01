# Use the official PostgreSQL base image
FROM postgres:latest

# Set the environment variables for the PostgreSQL container
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD admin
ENV POSTGRES_DB webdb

# Copy the SQL initialization script to the container
COPY webdb.sql /docker-entrypoint-initdb.d/

# Expose the default PostgreSQL port
EXPOSE 5432
