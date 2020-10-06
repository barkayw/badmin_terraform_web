
###This chunk of template can also be put inside outputs.tf for better segregation

output "VPC-ID-US-EAST-1" {
  value = aws_vpc.vpc_master.id
}

//output "VPC-ID-US-WEST-2" {
//  value = aws_vpc.vpc_worker_oregon.id
//}

//output "PEERING-CONNECTION-ID" {
//  value = aws_vpc_peering_connection.useast1-uswest2
//}
output "Jenkins-Main-Node-Public-IP" {
  value = aws_instance.jenkins-master.public_ip
}

//output "Jenkins-Worker-Public-IPs" {
//  value = {
//    for instance in aws_instance.jenkins-worker-oregon :
//    instance.id => instance.public_ip
//  }
//}


#Add LB DNS name to outputs.tf
output "LB-DNS-NAME" {
  value = aws_lb.application-lb.dns_name
}

#Add to outputs.tf for better segregation

output "url" {
  value = aws_route53_record.jenkins.fqdn
}

