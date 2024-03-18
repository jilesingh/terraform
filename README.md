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
[gitignore](./deploying_gcp_resources/.gitignore)

## Open the Terminal in your working directory and initialize terraform
    terraform init
    a .terraform directory will be created 

## create a plan 

## we are going to output the plan to a file 
    terraform plan -out s1.tfplan

## dependency graph can be seen using the command
    terraform graph

## output will look like this: 
 digraph G {
  rankdir = "RL";
  node [shape = rect, fontname = "sans-serif"];
  "data.google_compute_network.default" [label="data.google_compute_network.default"];
  "google_compute_firewall.default" [label="google_compute_firewall.default"];
  "google_compute_instance.mysqldb" [label="google_compute_instance.mysqldb"];
  "google_compute_instance.nginx_instance" [label="google_compute_instance.nginx_instance"];
  "google_compute_instance.web1" [label="google_compute_instance.web1"];
  "google_compute_instance.web2" [label="google_compute_instance.web2"];
  "google_compute_instance.web3" [label="google_compute_instance.web3"];
  "google_compute_subnetwork.subnet-1" [label="google_compute_subnetwork.subnet-1"];
  "google_compute_firewall.default" -> "data.google_compute_network.default";
  "google_compute_instance.mysqldb" -> "google_compute_subnetwork.subnet-1";
  "google_compute_instance.nginx_instance" -> "google_compute_subnetwork.subnet-1";
  "google_compute_instance.web1" -> "google_compute_subnetwork.subnet-1";
  "google_compute_instance.web2" -> "google_compute_subnetwork.subnet-1";
  "google_compute_instance.web3" -> "google_compute_subnetwork.subnet-1";
  "google_compute_subnetwork.subnet-1" -> "data.google_compute_network.default";
}

## you can generate visualize form using:
[visualize](http://webgraphviz.com/)

## terrafrom plan is a binary file you can show it using
    terraform show "plan file name"

## machine readable JSON can also be generated
    terraform show -json "plan file name"

## apply the using your plan file
    terrafom apply "paln file name"