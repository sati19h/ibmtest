locals {
  zones = [1, 2, 3]

  # combine cp_hosts and addl_hosts into a map so we can use for_each later
  # support backwards compatibility with providing var.instance_type, satellite_host_count, and addl_host_count
  hosts = (var.satellite_host_count != null && var.addl_host_count != null && var.instance_type != null) ? {
    0 = {
      instance_type     = var.instance_type
      count             = var.satellite_host_count
      for_control_plane = true
    }
    1 = {
      instance_type     = var.instance_type
      count             = var.addl_host_count
      for_control_plane = false
    }
    } : merge({
      for i, host in var.cp_hosts :
      i => {
        instance_type     = host.instance_type
        count             = host.count
        for_control_plane = true
        data_disk        = 500
      }
      }, {
      for i, host in var.addl_hosts :
      sum([i, length(var.cp_hosts)]) => {
        instance_type     = host.instance_type
        count             = host.count
        for_control_plane = false
        data_disk        = 500
      }
  })
  // convert hosts to be a flat object with one key per desired host
  hosts_flattened = { for index, item in flatten([
    for host_index, host in local.hosts : [
      for count_index in range(0, host.count) : {
        instance_type     = host.instance_type
        for_control_plane = host.for_control_plane
        zone              = element(local.zones, count_index)
        data_disk         = host.data_disk
      }
    ]
  ]) : index => item }
}
