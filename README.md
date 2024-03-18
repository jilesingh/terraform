# terraform

## Modules: make it very easy and reduces the code
    https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest

## VPC module for aws 
    https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest


# Deploying resources on GCP
## choose according to your opeating system
    https://developer.hashicorp.com/terraform/install
## for MAC
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform

## install Terrafon on your local system - optional

## install google sdk
    brew install --cask google-cloud-sdk
## check if SDK is installed properly or not
    gcloud --version
## authenticate Google Cloud CLI
    gcloud auth application-default login 

## Set the project 
    gcloud config set project ProjectID

## Enable APIs
gcloud services enable iam.googleapis.com

gcloud services enable cloudresourcemanager.googleapis.com

## Add gitignire before any terrafrom deployment 
    [gitignore](./deploying_gcp_resources/gcp_commands.md)

