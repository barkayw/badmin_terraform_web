#ACM CONFIGURATION
#Creates ACM certificate and requests validation via DNS(Route53)
resource "aws_acm_certificate" "cert" {
  provider    = aws.region-master
  domain_name = join(".", ["traiana", data.aws_route53_zone.dns.name])
  subject_alternative_names = [
    join(".", [var.subdomains[1], data.aws_route53_zone.dns.name])
  ]
  validation_method = "DNS"


  lifecycle {
    create_before_destroy = true
    #    ignore_changes        = ["subject_alternative_names"]
  }


  tags = {
    Name = "httpd-ACM"
  }
}
#Validates ACM issued certificate via Route53
resource "aws_acm_certificate_validation" "cert_validation" {
  provider                = aws.region-master
  certificate_arn         = aws_acm_certificate.cert.arn
  for_each                = aws_route53_record.cname_record_dns
  validation_record_fqdns = [aws_route53_record.cname_record_dns[each.key].fqdn]


}
