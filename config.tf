provider "aws" {
    access_key = "AKIAX56MV46RTQ7PW643"
    secret_key = "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"
    region = "eu-central-1"
}

resource "aws_instance" "my_ubuntu" {
    ami = "ami-06148e0e81e5187c8"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.web_security_group.id]
    key_name = "my_key"
    user_data = file("script.sh")
    tags = {
        Name = "My Server"
        Owner = "laska"
        Project = "LabOS-4"
    }
}

resource "aws_key_pair" "keys"{
    key_name = "my_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcGc4MSVXbLQw8ns9qBqwloa+BemWL2GaStTmeWUsqCQjz8vYt8Hcaxbv3xANrJCxIWdW7/bapW1ChDdrqMkG0jENJj7WL9WGL5VjSFYO2lgc83VxxyX6cymtmnO2pXCSoqzhzqA67LlV/diDYEtUfHPf28h2oNvUT+wbpC5N1E5J+KhZIvJ57MnuKxL0ubJNAHR3exnG2sHWSEERN8uiCnc0/VV5LOnHxCRoHLbVE5H+vHRsiLShjzdpFXwxs1n6rdH1pWtGPiIo2W81uagwww1g5ik9xhWYerBFCGi4aB8iKd3kmg6s7OYHY6yhIPyqNE6lYV1sYDCbCZlway1KUWwAu4SKFBTSxo9yfghd8n9aj22fG86JXg7RVM320deVi/dAADKIU+Ht6TOzeuCmRkYDbD+ekwHyo6CSaHNpRJUBK+k2u5bvR15oqov7+uEaJxYA5QjzHkovMlpHYY/gyRnmkTZqLid3GpZw4Ucey5Rs4JToafXtidejM+aafjcE= Denys@DESKTOP-V8N20V2"
}

resource "aws_security_group" "web_security_group" {
    name = "Web Security Group"
    description = "allow http/https traffic"

    #http
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #https
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
     ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
