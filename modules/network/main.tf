resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = var.tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags   = var.tags
}

# Iterate over tiers (e.g., web/app/db)
resource "aws_subnet" "tier_subnets" {
  count             = length(var.tiers)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index % var.az_count]
  tags = merge(
    var.tags,
    { "Tier" = var.tiers[count.index] }
  )
}

# Example conditional IPv6 block
resource "aws_vpc_ipv6_cidr_block_association" "ipv6" {
  count     = var.enable_ipv6 ? 1 : 0
  vpc_id    = aws_vpc.main.id
  ipv6_ipam_pool_id = data.aws_ipam_pool.default.id
}

