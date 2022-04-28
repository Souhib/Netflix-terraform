module "vpc" {
    source = "./vpc"
}

module "network" {
    source = "./network"
    vpc_info = module.vpc.common_vpc
}

module "route53" {
    source = "./route53"
}

module "ec2" {
    source = "./ec2"
    network_interface_info = module.network.common_web_server_network_interface
}
