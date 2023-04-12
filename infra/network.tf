data "aws_vpc" "infra" {
  # Specify the ID of the existing VPC you want to import
  id = "vpc-02d328c27e55c91d5"
}

data "aws_subnet" "infra_subnet_1" {
  vpc_id = data.aws_vpc.infra.id
}