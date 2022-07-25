// Route53 Public Zone

resource "aws_route53_zone" "primary" {
  name = "totira.com"
}

// Route53 Public Subdomain Zone

resource "aws_route53_zone" "main" {
  name = "totira.com"
}

resource "aws_route53_zone" "dev" {
  name = "dev.totira.com"

  tags = {
    Environment = "dev"
  }
}

resource "aws_route53_record" "dev-ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "dev.totira.com"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.dev.name_servers
}

// Route53 Private Zone

resource "aws_route53_zone" "private" {
  name = "totira.com"

  vpc {
    vpc_id = aws_vpc.example.id
  }
}

// Route53 Record

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.totira.com"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.lb.public_ip]
}

output "name_server" {
    value = aws_route53_zone.totira.name_servers
}
