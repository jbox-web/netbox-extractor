class NetboxClient::VirtualMachineWithConfigContext
  include NetboxExtractor::Patches::NetboxClient

  def netbox_hosting_node
    device.try &.name
  end

  def netbox_host_type
    "virtual"
  end

  def netbox_vendor_name
    nil
  end

  def netbox_vendor_model
    nil
  end

  def netbox_icinga_filename
    File.join("#{netbox_role}-#{netbox_os_family}", "#{name}.conf")
  end
end
