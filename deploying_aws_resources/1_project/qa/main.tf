module "qa" {
# update the source file path ti "../deploying_aws_resources/modules/blog"before you plan a run
    source = "../modules/blog"

    environment {
        name             = "qa"
        network_prefix   = "10.1"
    }

    asg_min_size = 1
    asg_max_size = 1
}