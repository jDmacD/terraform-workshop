resource "aws_vpc" "main_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    LabName  = "5.TerraformDataSources"
    Name     = "Main"
    Location = "London"
  }
}
resource "aws_subnet" "vpc_subnets" {
  count             = length(var.vpc_subnet_cidr)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = element(var.vpc_subnet_cidr, count.index)
  availability_zone = element(data.aws_availability_zones.aaz.names, count.index)
  tags = {
    LabName = "5.TerraformDataSources"
    Name    = "subnet-${count.index + 1}"
  }
}