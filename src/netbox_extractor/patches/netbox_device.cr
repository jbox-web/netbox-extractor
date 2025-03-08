class NetboxClient::DeviceWithConfigContext
  include NetboxExtractor::Patches::NetboxClient

  # ameba:disable Documentation/DocumentationAdmonition
  # TODO: make this configurable?
  def netbox_check_by_snmp?
    super || netbox_role.starts_with?("storage-") || netbox_role.starts_with?("network-")
  end

  def netbox_hosting_node
    nil
  end

  def netbox_host_type
    "physical"
  end

  def netbox_os_family
    return "linux" if netbox_os_name.includes?("linux") || netbox_os_name.includes?("debian") || netbox_os_name.includes?("vmware")
    return "windows" if netbox_os_name.includes?("microsoft-windows")

    netbox_os_name
  end

  def netbox_vendor_name
    device_type.try &.manufacturer.try &.name
  end

  def netbox_vendor_model
    device_type.try &.model
  end

  def netbox_icinga_filename
    File.join(netbox_role, "#{name}.conf")
  end
end
