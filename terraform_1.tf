provider "aws" {
  region = "ap-south-1"
  #access_key = " "
  #secret_key = " " 
}

resource "aws_instance" "intro" {
  ami                    = "ami-0f58b397bc5c1f2e8"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  key_name               = "dove_key"
  vpc_security_group_ids = ["sg-0491958282729300d"]
  tags = {
    Name = "Dove-Instance"
  }
}


#er5ytg4erwd


