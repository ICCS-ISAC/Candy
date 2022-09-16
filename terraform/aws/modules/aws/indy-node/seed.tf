# Generate a random value to be used as a seed to use during node initialization.
# Generate it longer than it needs to be so it can be formatted into a
# 32 character seed without any special characters.
resource "random_id" "node_seed" {
  keepers = {
    # Generate a new seed for each new instance.
    instance_id = aws_instance.indy_node.id
  }
   byte_length = 48
}