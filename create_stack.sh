#!/bin/bash
aws cloudformation package \
  --template-file template.yaml \
  --s3-bucket <YOUR-US-EAST-1-S3-BUCKET-NAME> \
  --output-template-file output-template.yaml \

aws cloudformation create-stack \
  --template-body file:///path/to/repository/cocktail-helper/output-template.yaml \
  --stack-name AlexaSkillStack \
  --parameters \
    ParameterKey=AppName,ParameterValue=cocktail-helper \
  --capabilities CAPABILITY_NAMED_IAM \
  --region us-east-1
