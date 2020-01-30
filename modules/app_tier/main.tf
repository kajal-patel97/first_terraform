# Main for app tier
#Place all that concerns the app in here

# Creating a Subnet
resource "aws_subnet" "app_subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.0.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = var.app_name
  }
}

# Creating a Security Group
resource "aws_security_group" "app_security_kp" {
  tags = {
    name = var.app_name
    }
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port =  80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    to_port =  3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port =  22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 27017
    to_port =  27017
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



}

# Route Table
resource "aws_route_table" "app_route" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.ig_id
  }

  tags = {
    Name = var.app_name
  }
}

# Route Table Association
resource "aws_route_table_association" "app_assoc" {
  subnet_id = aws_subnet.app_subnet.id
  route_table_id = aws_route_table.app_route.id
}

# Launch an Instance
resource "aws_instance" "app_instance" {
  ami = var.ami_id_app
  subnet_id = aws_subnet.app_subnet.id
  vpc_security_group_ids = [aws_security_group.app_security_kp.id]
  instance_type = "t2.micro"
  key_name = "kajal-eng-48-first-key"
  associate_public_ip_address = true
  user_data = data.template_file.app_init.rendered
  tags = {
    Name = var.app_name
  }
}


#send template sh file to instance
data "template_file" "app_init" {
  template = "${file("./scripts/init_script.sh.tpl")}"
}
