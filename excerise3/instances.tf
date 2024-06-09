resource "aws_key_pair" "excerise3-key" {
  key_name   = "excerise3-key"
  public_key = file("dovekey.pub")
}

resource "aws_instance" "excerise3-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.excerise3-key.key_name
  vpc_security_group_ids = ["sg-02a108efb4a34e9fc"]
  tags = {
    Name    = "excerise3-Instance"
    Project = "Dove"
  }

  provisioner "file" {
    source = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo yum install wget unzip httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip",
      "unzip -o 2117_infinite_loop.zip",
      "sudo cp -r 2117_infinite_loop/* /var/www/html/",
      "sudo systemctl restart httpd"
    ]
  }
  connection {
    user        = var.USER
    private_key = file("dovekey")
    host        = self.public_ip
  }
} 

