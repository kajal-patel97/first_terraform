# secuirty group
resource "aws_security_group" "db_security_kp" {
  name = var.db_name
  description = "allow traffic from app"
  vpc_id = var.vpc_id

  ingress {
    from_port = 27017
    to_port =  27017
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

  tags = {
    Name = var.db_name
  }
}


# Creating a Subnet
resource "aws_subnet" "db_subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = var.db_name
  }
}

#Route table
resource "aws_route_table" "db_route" {
vpc_id = var.vpc_id
route {
  cidr_block = "0.0.0.0/0"
  gateway_id = var.ig_id
  }
  tags = {
  Name = var.db_name
  }
}
# Route table associations
resource "aws_route_table_association" "db_assoc" {
subnet_id = aws_subnet.db_subnet.id
route_table_id = aws_route_table.db_route.id
}


# Launch an Instance
resource "aws_instance" "db_instance" {
  ami = var.ami_mongo_id
  subnet_id = aws_subnet.db_subnet.id
  key_name = "kajal-eng-48-first-key"
  vpc_security_group_ids = [aws_security_group.db_security_kp.id]
  instance_type = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = var.db_name
  }

provisioner "local-exec" {
  command = "echo ${aws_instance.db_instance.public_ip} > ip_address.txt"
  }
}
