#Creating the VPC
resource "aws_vpc" "my-vpc-p" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc-p"
  }
}

#Creating the private Subnet
resource "aws_subnet" "private-subnet-p" {
  vpc_id = aws_vpc.my-vpc-p.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "private-subnet-p"
  }
}

#Creating the public subnet
resource "aws_subnet" "public-subnet-p" {
  vpc_id = aws_vpc.my-vpc-p.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "public-subnet-p"
  }
}

#Creating the Internet Gateway
resource "aws_internet_gateway" "My-aws_internet_gateway-p" {
  vpc_id = aws_vpc.my-vpc-p.id
  tags = {
    Name = "My-aws_internet_gateway-p"
  }
}

#Creating the Route Table
resource "aws_route_table" "my-route-table-p" {
  vpc_id = aws_vpc.my-vpc-p.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.My-aws_internet_gateway-p.id
  }
}

resource "aws_route_table_association" "public-subnet-association-p" {
  route_table_id = aws_route_table.my-route-table-p.id
  subnet_id = aws_subnet.public-subnet-p.id
}
