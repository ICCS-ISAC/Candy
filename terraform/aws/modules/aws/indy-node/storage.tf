# Provision and attach an explicit data volume
# This will be mounted for use as the node's data volume
resource "aws_ebs_volume" "data_volume" {
  availability_zone = var.zone
  size              = var.data_volume_size
  encrypted         = var.ebs_encrypted
  type              = var.ebs_volume_type

  tags = {
    Name     = "${var.instance_name} - Data Volume"
    Instance = var.instance_name
  }
}

resource "aws_volume_attachment" "data_volume_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.data_volume.id
  instance_id = aws_instance.indy_node.id
}