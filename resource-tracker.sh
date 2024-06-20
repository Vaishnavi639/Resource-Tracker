#######################################################################################################################################################################################
#Author: Vaishnavi
#Date: 11th June 2024
#version: v1
#This script will display all the S3 buckets,EC2 insatances, Lambda functions and IAM users accordingly can also track other services and their usage
#######################################################################################################################################################################################

set -x

#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users

date >> resources2

#List S3 buckets
echo "List of S3 buckets: " >> resources2
aws s3 ls >> resources2

#List EC2 instances
echo "List of EC2 instances" >> resources2
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resources2

#List of Lambda function
echo "List of Lambda functions" >> resources2
aws lambda list-functions | jq '.functions[].FunctionName' >> resources2
aws lambda list-functions | jq '.functions[].FunctionARN' >> resources2

#List of IAM Users
echo "List of IAM Users :" >> resources2
aws iam list-users >> resources2

