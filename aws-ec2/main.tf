provider "aws" {
  region = "ap-southeast-2"
}

locals {
  user_data = <<EOF
<powershell>
Invoke-WebRequest -Uri "https://repo.saltstack.com/windows/Salt-Minion-Latest-Py3-x86-Setup.exe" -OutFile "c:\windows\temp\Salt-Minion-Latest-Py3-x86-Setup.exe"
& "c:\windows\temp\Salt-Minion-Latest-Py3-x86-Setup.exe" "/S /minion-name=projectrock-web01.vmware.education /master=projectrock-saltmaster.vmware.education /start-service=1" 
</powershell>
EOF
}

resource "aws_instance" "web" {
  ami           = "ami-0f783075765a8d1c5"
  instance_type = var.instance_type
  subnet_id     = "subnet-071604caaea13cf0c"
  key_name      = var.keyname 
  associate_public_ip_address = true
  user_data_base64            = base64encode(local.user_data)
  vpc_security_group_ids      = ["sg-0268bc4e33ad729c2"]
  root_block_device {
      volume_size = "80"
  }
  tags = {
    Name = "SaltStack Testing"
  }
}