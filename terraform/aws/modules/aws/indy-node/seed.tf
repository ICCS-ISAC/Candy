# Generate random seed to use during node initialization.
resource "random_id" "node_seed" {
  keepers = {
    # Generate a new seed for each new instance.
    instance_id = aws_instance.indy_node.id
  }
   byte_length = 24
}