resource "aws_instance" "nginx-server" {
  ami = "ami-00bb6a80f01f03502"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public-subnet-p.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true
  
  user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo systemctl start nginx
                EOF

  tags = {
    Name = "nginx-server"
  }
}