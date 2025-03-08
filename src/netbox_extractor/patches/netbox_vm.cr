class NetboxClient::VirtualMachineWithConfigContext
  include NetboxExtractor::Patches::NetboxClient

  def hosting_node
    device.try &.name
  end

  def netbox_host_type
    "virtual"
  end

  def netbox_os_family
    return "linux" if linux?
    return "windows" if windows?

    netbox_os_name
  end

  def netbox_vendor_name
    nil
  end

  def netbox_vendor_model
    nil
  end

  def icinga_dest_file(site)
    site.icinga_dest_path.join("#{netbox_role}-#{netbox_os_family}", "#{name}.conf")
  end
end
