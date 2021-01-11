provider "aws" {
  region = "ap-southeast-2"
}

locals {
  user_data = <<-EOF
<powershell>
Invoke-WebRequest -Uri "https://repo.saltstack.com/windows/Salt-Minion-3002.2-Py3-AMD64.msi" -OutFile "c:\windows\temp\Salt-Minion-3002.2-Py3-AMD64.msi" 
msiexec /i c:\windows\temp\Salt-Minion-3002.2-Py3-AMD64.msi /quiet /norestart MASTER=projectrock-saltmaster.vmware.education MINION_ID=${var.hostname}
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
  vpc_security_group_ids      = ["sg-0da46168d14f05715"]
  root_block_device {
      volume_size = "80"
  }
  tags = {
    Name = "SaltStack Testing"
  }
}