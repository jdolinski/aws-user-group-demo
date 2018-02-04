#!/usr/bin/env bash

IFS= read -r -p "Enter S3Bucket to use: " S3Bucket
IFS= read -r -p "Enter CodeCommit Repository to use: " CodeCommit

cp 00-pipeline-to-service-catalog.yaml scripts/00-pipeline-to-service-catalog.yaml
cd scripts
pip install -r requirements.txt -t "$PWD" --upgrade
aws cloudformation package --template-file 00-pipeline-to-service-catalog.yaml \
--s3-bucket "$S3Bucket" --s3-prefix cfn-packages --output-template-file transformed-00-pipeline-to-service-catalog.yaml
rm 00-pipeline-to-service-catalog.yaml
aws cloudformation deploy --template-file transformed-00-pipeline-to-service-catalog.yaml --capabilities CAPABILITY_NAMED_IAM \
--parameter-overrides S3Bucket="$S3Bucket" CodeCommit="$CodeCommit" --stack-name blog-sc-pipeline
cd ..