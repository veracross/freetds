# FreeTDS Lambda Layer

Build and publish FreeTDS as an AWS Lambda layer.

In order to use the TinyTDS gem with ruby AWS Lambda Functions, we need to have access to FreeTDS binaries that AWS does not provide with its execution environment.

The solution is to use AWS Lambda Layers.

The provided deploy script builds FreeTDS on the same architecture that runs in AWS Lambda and, using the AWS CLI, publishes the artifact as an AWS Lambda layer for functions to use.

> A Lambda deployment package is a .zip file that contains your code and any dependencies. The Lambda execution environment is based on a specific Amazon Linux AMI and kernel version. Any native binaries that are used in a Lambda deployment package must be compiled in this environment, and only 64-bit binaries are supported.
> 
> https://aws.amazon.com/premiumsupport/knowledge-center/lambda-linux-binary-package/

## Requirements

- Ruby 2.5
- Docker
- AWS CLI

## Usage

- Run `rake deploy`
- Add the `LayerArn` as a layer property in your AWS SAM `template.yaml` file.

## SAM CLI example

```
#  template.yaml
#  SAM Template Specification
#  - https://github.com/awslabs/serverless-application-model/blob/master/versions/2016-10-31.md
Resources:
  CoolFunction:
    Type: AWS::Serverless::Function
    Properties:
      FunctionName: cool-function
      Layers:
        - "arn string goes here"
```

## Additional Resources

- https://aws.amazon.com/cli/
- https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html
