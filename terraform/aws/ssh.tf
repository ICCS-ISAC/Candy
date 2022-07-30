resource "aws_key_pair" "ansible" {
  key_name   = "ansible-key"
  public_key = var.candy_public_ssh_key
}
