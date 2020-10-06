variable "profile" {
  type    = string
  default = "default"
}

variable "region-master" {
  type    = string
  default = "us-east-1"
}


variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}


variable "instance-type" {
  type    = string
  default = "t3.micro"
}

variable "webserver-port" {
  type    = number
  default = 80
}


#DNS Configuration
variable "dns-name" {
  type    = string
  default = "barkaywolfsohn.com."
}

#DNS Configuration
variable "dns-01" {
  type    = string
  default = "traiana"
}
#DNS alternative_names
variable "dns-02" {
  type    = string
  default = "citi"
}
variable "dns-03" {
  type    = string
  default = "jp"
}
variable "dns-04" {
  type    = string
  default = "bofa"
}
variable "dns-05" {
  type    = string
  default = "dns-05"
}
variable "dns-06" {
  type    = string
  default = "dns-06"
}
variable "dns-07" {
  type    = string
  default = "dns-07"
}
variable "dns-08" {
  type    = string
  default = "dns-08"
}
variable "dns-09" {
  type    = string
  default = "dns-09"
}
variable "dns-10" {
  type    = string
  default = "dns-10"
}
variable "dns-11" {
  type    = string
  default = "dns-11"
}
variable "dns-12" {
  type    = string
  default = "dns-12"
}
