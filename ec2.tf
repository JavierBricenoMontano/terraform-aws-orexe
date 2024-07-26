resource "aws_instance" "public_instance" {
  ami                    = "ami-0427090fd1714168b"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    Name = "virginia_ipc_igw"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_crt"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance Security Group"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
