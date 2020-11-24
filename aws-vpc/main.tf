provider "aws" {
    region = "ap-southeast-2"
}

resource “aws_vpc” “prod-vpc” {
    cidr_block = var.cidr
    enable_dns_support = “true” #gives you an internal domain name
    enable_dns_hostnames = “true” #gives you an internal host name
    enable_classiclink = “false”
    instance_tenancy = “default”    
    
    tags {
        Name = var.tag
    }
}

resource “aws_subnet” “PublicSubnet1” {
    vpc_id = “${aws_vpc.prod-vpc.id}”
    cidr_block = var.pubsubnet1
    map_public_ip_on_launch = “true” //it makes this a public subnet
    availability_zone = “ap-southeast-2a”
    tags {
        Name = “Public Subnet 1”
    }
}

resource “aws_subnet” “PublicSubnet2” {
    vpc_id = “${aws_vpc.prod-vpc.id}”
    cidr_block = var.pubsubnet2
    map_public_ip_on_launch = “true” //it makes this a public subnet
    availability_zone = “ap-southeast-2b”
    tags {
        Name = “Public Subnet 2”
    }
}

resource “aws_subnet” “PrivateSubnet1” {
    vpc_id = “${aws_vpc.prod-vpc.id}”
    cidr_block = var.privsubnet1
    map_public_ip_on_launch = “false” //it makes this a public subnet
    availability_zone = “ap-southeast-2a”
    tags {
        Name = “Private Subnet 1”
    }
}

resource “aws_subnet” “PrivateSubnet2” {
    vpc_id = “${aws_vpc.prod-vpc.id}”
    cidr_block = var.privsubnet2
    map_public_ip_on_launch = “false” //it makes this a public subnet
    availability_zone = “ap-southeast-2b”
    tags {
        Name = “Private Subnet 2”
    }
}

resource "aws_internet_gateway" "prod-igw" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    tags {
        Name = "prod-igw"
    }
}

resource "aws_route_table" "PublicRouteTable" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.prod-igw.id}" 
    }
    
    tags {
        Name = "Public Route Table"
    }
}

resource "aws_route_table_association" "PublicSubnet1"{
    subnet_id = "${aws_subnet.PublicSubnet1.id}"
    route_table_id = "${aws_route_table.PublicRouteTable.id}"
}

resource "aws_route_table_association" "PublicSubnet2"{
    subnet_id = "${aws_subnet.PublicSubnet2.id}"
    route_table_id = "${aws_route_table.PublicRouteTable.id}"
}

identity {
    type = "SystemAssigned"
  }