#!/bin/bash
DATE=$(date +%H-%M-%S)
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
PASSWORD=$4

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME --column-statistics=0 >/tmp/db-$DATE.sql
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=$PASSWORD
echo "Uploading the backup on S3"
aws s3 cp /tmp/db-$DATE.sql s3://jenkins-mysql/db-$DATE.sql

