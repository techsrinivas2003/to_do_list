provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow HTTP and SSH traffic"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_vm" {
  ami           = "ami-0c55b159cbfafe1f0"  # Ubuntu 20.04 LTS AMI ID (make sure to use the latest in your region)
  instance_type = "t2.micro"  # You can adjust the instance type based on your needs

  security_groups = [aws_security_group.allow_http_ssh.name]

  key_name = "your-key-name"  # Replace with the name of your existing SSH key in AWS

  tags = {
    Name = "MyTerraformVM"
  }

  # User data to install Docker and pull/run the container on startup
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y docker.io
              sudo systemctl enable docker
              sudo systemctl start docker
              docker pull your-docker-username/tdlist:latest  # Replace with your Docker image
              docker run -d -p 80:80 --name tdlist your-docker-username/tdlist:latest  # Replace with your Docker image
            EOF
}
