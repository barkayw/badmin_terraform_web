#ACM CONFIGURATION
#Creates ACM certificate and requests validation via DNS(Route53)
resource "aws_acm_certificate" "lb-https" {
  provider    = aws.region-master
  domain_name = join(".", [var.dns-01, data.aws_route53_zone.dns.name])
  subject_alternative_names = [
    join(".", [var.dns-02, data.aws_route53_zone.dns.name]),
    join(".", [var.dns-03, data.aws_route53_zone.dns.name]),
    join(".", [var.dns-04, data.aws_route53_zone.dns.name])
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
resource "aws_acm_certificate_validation" "cert" {
  provider = aws.region-master

  certificate_arn = aws_acm_certificate.lb-https.arn
  # for_each        = aws_route53_record.cert_validation
  #  validation_record_fqdns = [aws_route53_record.cert_validation[each.key].fqdn]
}
