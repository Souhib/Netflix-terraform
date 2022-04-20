resource "aws_route53_zone" "primary_zone" {
  name = "souhib-trabelsi.com"
}

resource "aws_route53_record" "www" {
  count   = length(var.services_name)
  name    = var.services_name[count.index]
  zone_id = aws_route53_zone.primary_zone.zone_id
  type    = "CNAME"
  ttl     = "300"
  records = var.records_name
}
