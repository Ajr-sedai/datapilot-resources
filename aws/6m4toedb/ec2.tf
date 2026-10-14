# Orphaned (untagged) instances — import with `terraform import aws_instance.<name> <instance-id>`.
resource "aws_instance" "i_078db1a1682517a15" {
  ami           = var.ec2_ami_id
  instance_type = "t3.large"
}

resource "aws_instance" "i_04fad9d56594b7232" {
  ami           = var.ec2_ami_id
  instance_type = "t3.large"
}
