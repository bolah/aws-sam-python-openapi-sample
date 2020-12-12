#!/usr/bin/env bash

set -e
set -x

S3_BUCKET=
OUTPUT_FILE=template-output.yaml
STAGE_NAME=dev
STACK_NAME=hello-world-app-$STAGE_NAME

# Copy Swagger file to S3 to be able to transform its content for "deploying" it to API Gateway
aws s3 cp swagger.yaml s3://$S3_BUCKET/swagger.yaml


sam package               --output-template-file $OUTPUT_FILE \
                          --s3-bucket $S3_BUCKET

sam deploy                --stack-name $STACK_NAME \
                          --s3-bucket $S3_BUCKET \
                          --parameter-overrides StageName=$STAGE_NAME S3BucketName=$S3_BUCKET \
                          --capabilities CAPABILITY_IAM

export API_GATEWAY_URL=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[0].OutputValue' --output text)

echo "API Gateway URL: $API_GATEWAY_URL"
