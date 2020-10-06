
###This chunk of template can also be put inside outputs.tf for better segregation

output "VPC-ID-US-EAST-1" {
  value = aws_vpc.vpc_master.id
}


output "Jenkins-Main-Node-Public-IP" {
  value = aws_instance.httpd-server.public_ip
}

#Add LB DNS name to outputs.tf
output "LB-DNS-NAME" {
  value = aws_lb.application-lb.dns_name
}

#Add to outputs.tf for better segregation

output "url-jenkins" {
  value = aws_route53_record.jenkins.fqdn
}

output "url-citi" {
  value = aws_route53_record.citi.fqdn
}

output "url-jp" {
  value = aws_route53_record.jp.fqdn
}