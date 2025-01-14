DO $do$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'tsoha') THEN
          CREATE ROLE tsoha;
        END IF;
        ALTER ROLE tsoha WITH LOGIN PASSWORD 'password' NOSUPERUSER CREATEDB NOCREATEROLE;
    END
$do$;

DROP DATABASE IF EXISTS gradesa;
CREATE DATABASE gradesa OWNER tsoha;
GRANT ALL ON DATABASE gradesa TO tsoha;
