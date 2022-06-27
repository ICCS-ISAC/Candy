nodes:
  hosts:
  %{ for address in node_addresses ~}
  ${address}:
  %{ endfor ~}