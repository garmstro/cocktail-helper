# Sample AWS Lambda function for Alexa using CloudFormation
A simple [AWS Lambda](http://aws.amazon.com/lambda) function that demonstrates how to write a skill for the Amazon Echo using the Alexa SDK.

This project was adapted from the [A Cloud Guru Alexa Course](https://acloud.guru/course/intro-alexa-free/dashboard) to include CloudFormation creation of a simple Alexa Skill stack.

## Concepts
This sample shows how to create a Lambda function for handling Alexa Skill requests that:

- Custom slot type: demonstrates using custom slot types to handle a finite set of known values

## Setup
To run this example skill you need to do two things. The first is to deploy the example code in lambda, and the second is to configure the Alexa skill to use Lambda.

### AWS Lambda Setup Using CloudFormation
1. Edit the `create_stack.sh` script to point to an S3 bucket that you have in the US-East-1 (N. Virginia) region
2. Edit the path to the repository in the `create_stack.sh` script
3. Run the command `./create_stack.sh` from a Bash shell
4. Go to AWS CloudFormation in the AWS Console and check the output of the stack creation
5. Copy the ARN from the output to be used later in the Alexa Skill Setup

### Alexa Skill Setup
1. Go to the [Alexa Console](https://developer.amazon.com/edw/home.html) and click Add a New Skill.
2. Set "CocktailHelper" as the skill name and "cocktail helper" as the invocation name, this is what is used to activate your skill. For example you would say: "Alexa, Ask Cocktail helper how to make a martini."
3. Select the Lambda ARN for the skill Endpoint and paste the ARN copied from above. Click Next.
4. Copy the custom slot types from the customSlotTypes folder. Each file in the folder represents a new custom slot type. The name of the file is the name of the custom slot type, and the values in the file are the values for the custom slot.
5. Copy the Intent Schema from `speechAssets/IntentSchema.json`.
6. Copy the Sample Utterances from `speechAssets/SampleUtterances.txt`. Click Next.
7. [optional] go back to the skill Information tab and copy the appId. Paste the appId into the index.js file for the variable APP_ID,
   then update the lambda source zip file with this change and upload to lambda again, this step makes sure the lambda function only serves request from authorized source.
8. You are now able to start testing your sample skill! You should be able to go to the [Echo webpage](http://echo.amazon.com/#skills) and see your skill enabled.
9. In order to test it, try to say some of the Sample Utterances from the Examples section below.
10. Your skill is now saved and once you are finished testing you can continue to publish your skill.

## Examples
### One-shot model:
    User: "Alexa, ask my Cocktail Helper how to make a martini."
    Alexa: "(reads back recipe for martini)"
