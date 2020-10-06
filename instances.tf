#Get Linux AMI ID using SSM Parameter endpoint in us-east-1
data "aws_ssm_parameter" "linuxAmi" {
  provider = aws.region-master
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#Create key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "master-key" {
  provider   = aws.region-master
  key_name   = "httpd_key_pub"
  public_key = file("~/.ssh/id_rsa.pub")
}


#Create and bootstrap EC2 in us-east-1
resource "aws_instance" "httpd-server" {
  provider                    = aws.region-master
  ami                         = data.aws_ssm_parameter.linuxAmi.value
  instance_type               = var.instance-type
  key_name                    = aws_key_pair.master-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.httpd-sg.id]
  subnet_id                   = aws_subnet.subnet_1.id

  tags = {
    Name = "httpd_server_tf"
  }

  depends_on = [aws_main_route_table_association.set-master-default-rt-assoc]

  #The code below is ONLY the provisioner block which needs to be
  #inserted inside the resource block for Jenkins EC2 master Terraform
  #Jenkins Master Provisioner:

  provisioner "local-exec" {
    command = <<EOF
aws --profile ${var.profile} ec2 wait instance-status-ok --region ${var.region-master} --instance-ids ${self.id}
ansible-playbook --extra-vars 'passed_in_hosts=tag_Name_${self.tags.Name}' ansible_templates/httpd-server-sample.yml
EOF
  }
}