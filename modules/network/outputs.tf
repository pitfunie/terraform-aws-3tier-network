output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [for subnet in aws_subnet.tier_subnets : subnet.id]
}

output "igw_id" {
  value = aws_internet_gateway.gw.id
}

