#!/usr/bin/env bash

echo "Run DB Migrations on:"
echo "url:       $DB_URL"
echo "port:      $DB_PORT"
echo "name:      $DB_NAME"
echo "user name: $DB_USERNAME"
echo "password:  $DB_PASSWORD"

lpm update && lpm add -g postgresql

liquibase update \
--changelog-file=migrations/changelog.yaml \
--url=jdbc:postgresql://$DB_URL:$DB_PORT/$DB_NAME \
--username=$DB_USERNAME \
--password=$DB_PASSWORD