data "aws_vpc" "selected" {
  # Allows dynamic lookup of information about the selected VPC.
  # Specifically it's ID
  tags = {
    Name = "Perimeter_vpc" //TODO change to variable
  }
}

data "aws_subnet" "selected" {
  # Allows dynamic lookup of information about the given selected subnet.
  # Specifically it's ID
  tags = { 
    Name = "Public_Perimeter_aza_net" //TODO change to variable
    }
}
