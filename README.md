# Your City & County on the AWS Cloud
February 5, 2018
- [Omaha AWS Meetup](https://www.meetup.com/Omaha-Amazon-Web-Services-Meetup/events/246454308/)
- [Presentation Slides]()

This repository is a collection of AWS CloudFormation demo examples to help manage your environment in a [DevSecOps](http://www.devsecops.org/) 
approach. Using the fictitious business case "Your Company’s AWS Footprint and Usage is Growing Beyond a Single Business 
Unit Account that was Easily Managed by a Small Team of Two", the scripts show the ease at which AWS can help you automate.

Some examples are not region agnostic and will need to be modified to run in all regions supporting the services. Execution should use "us-east-1".

**Important: Some services used in this project are excluded from the free tier. You will be charged for provisioning
resources.**

## References

- [AWS Pipeline to Service Catalog](https://github.com/awslabs/aws-pipeline-to-service-catalog)
- [AWS Organizations](https://aws.amazon.com/organizations/)
- [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/)
- [Deep Dive on AWS CloudFormation](https://www.youtube.com/watch?v=01hy48R9Kr8)

## AWS Services Used

- AutoScaling
- CodeBuild
- CodeCommit
- CodeDeploy
- CodePipeline
- CloudFormation
- CloudWatch
- Config
- DynamoDB
- EC2
- EFS
- GuardDuty
- IAM
- Inspector
- Lambda
- RDS
- Route 53
- S3
- Shield
- Systems Manager
- Trusted Advisor
- VPC

## Prerequisites

- AWS Account
- AWS CLI
- AWS CodeCommit Access
- GIT Client
- [PyCharm (optional)](https://www.jetbrains.com/pycharm/)      


## Getting Started
First clone this repo: `git clone https://github.com/jdolinski/aws-user-group-demo`

## Initial Setup

Open CloudFormation on your AWS account and create a stack from template `00-pipeline-to-service-catalog.yaml`

This will create your AWS CodeCommit Repository.

You will need to Setup your [repository authentication](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up.html?icmpid=docs_acc_console) 
and [clone your new AWS Repository](https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-connect.html?icmpid=docs_acc_console) and push this project into it.

When you push your code to AWS Repo it will invoke the pipeline to sync your [service catalog](https://aws.amazon.com/servicecatalog/). 

Next browse to service catalog and find the `product-10-shared-storage.yaml` Launch this product and it will create
two buckets for source code. Code deployments to these buckets are usually done via a CI tool such as Jenkins. However 
we will need to manually upload two zip packages.

1. In the Lambda code bucket, upload `"your-project-location"/scripts/autosubnet/autosubnet.zip`  

2. In the Application code bucket, upload `"your-project-location"/cms/Joomla_3.8.4-Stable-Full_Package.zip`  
<h2>Run Templates</h2>
The templates will create stacks and provision additional resources (not all free). You can run the templates
in the numerical product order. Some templates will use cross stack references for input into the next template.

## Final Steps
Remember to tear down all your stacks to avoid unnecessary costs in your AWS account.