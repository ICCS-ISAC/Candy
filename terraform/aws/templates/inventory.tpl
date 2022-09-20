nodes:
  hosts:
  %{ for item in node_info ~}
  ${item[0]}:
      data_volume_id: ${item[1]}
      node_seed: ${item[2]}
  %{ endfor ~}