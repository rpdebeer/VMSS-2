variable "project_name" {
  default = "VMSS-demo"
}

variable "location" {
  default = "northeurope"
}

# template code requires /16 and subnets will get /24
variable "north_cidr" {
  default = "10.1.0.0/16"
}

# template code requires /16 and subnets will get /24
variable "south_cidr" {
  default = "10.2.0.0/16"
}

# template code requires /16 and subnets will get /24
variable "west_cidr" {
  default = "10.40.0.0/16"
}

# template code requires /16 and subnets will get /24
variable "east_cidr" {
  default = "10.50.0.0/16"
}

# must match what was used in autoprov-cfg config
variable "management" {
  default = "management"
}

# must match what was used in autoprov-cfg config
variable "template" {
  default = "VMSStemplate"
}

# must match what was used in autoprov-cfg config
variable "sickey" {
  default = "vpn12345"
}

variable "admin_password" {
  default = "Qwerty01!:-)"
}

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAv/m/wvvzL2nPa3RBvDcuXMVGghL4RQs/x1+XVUQo+YYWh2OGwQseqmxX7CTpA9l29rMsIN26WkJdfQs57B/haF/CDO6baHxPGxnHcYd74BrB3qY9RTgwM9tGKWk6EWbJSQpWpbIuphvMHRxB8FHsrfsXlaKde3cm/k77OmcOM/6JPfwbp5VtTbIIeR8iobDYTjamavtJ65uDgRKg2RFftNISfB8Ounk6u7fDRXtuFYBOyCLgkBX+oKDnmffe74eFHx/QB3t2vCLkrN3zcL92swnu83umo3SDwO92QAMt5Pif7AUZdAcpzYuBc5O3P9mPglefb9H3beoWyHCKAChFMw== rsa-key-20190611"
}

variable "envtags" {
 description = "A map of the tags to use for other resources that are deployed"
 type        = "map"

 default = {
   environment = "vmss"
 }
}

variable "servertags" {
 description = "A map of the tags to use for server resources that are deployed"
 type        = "map"

 default = {
   environment = "vmss"
   access = "internet"
 }
}

variable "vm_mgmt" {
  default = "Jumphost"
}

variable "vm_name1" {
  default = "Web-West01"
}

variable "vm_name2" {
  default = "Web-West02"
}

variable "ubuntu_user_data" {
  default = <<-EOF
                    #!/bin/bash
                    until sudo apt-get update && sudo apt-get -y install apache2;do
                      sleep 1
                    done
                    until curl \
                      --output /var/www/html/Atos.png \
                      --url https://atos.net/wp-content/uploads/2019/01/atos-logo-blue.png ; do
                       sleep 1
                    done
                    sudo chmod a+w /var/www/html/index.html 
                    echo "<html><head><meta http-equiv=refresh content="5" /> </head><body><center><H1>" > /var/www/html/index.html
                    echo $HOSTNAME >> /var/www/html/index.html
                    echo "<BR><BR>Check Point CloudGuard VMSS Demo <BR><BR>R.P. de Beer<BR><BR>rutger-paul.debeer@atos.net<BR><BR>" >> /var/www/html/index.html
                    echo "<img src=\"/Atos.png \" height=\"25%\">" >> /var/www/html/index.html
                    EOF
}