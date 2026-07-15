# Extends the generated device type with device-specific `netbox_*` helpers,
# mixing in the shared `NetboxExtractor::Patches::NetboxClient` module and
# overriding host-type and vendor accessors for physical devices.
class NetboxClient::DeviceWithConfigContext
  include NetboxExtractor::Patches::NetboxClient

  # True when SNMP monitoring applies: the shared tag-based check, or a
  # storage/network device role which always forces SNMP.
  # ameba:disable Documentation/DocumentationAdmonition
  # TODO: make this configurable?
  def netbox_check_by_snmp?
    super || netbox_role.starts_with?("storage-") || netbox_role.starts_with?("network-")
  end

  # Physical devices have no hosting node; always `nil`.
  def netbox_hosting_node
    nil
  end

  # Devices are always `"physical"`.
  def netbox_host_type
    "physical"
  end

  # Manufacturer name from the device type, or `nil` when unavailable.
  def netbox_vendor_name
    device_type.try &.manufacturer.try &.name
  end

  # Model name from the device type, or `nil` when unavailable.
  def netbox_vendor_model
    device_type.try &.model
  end

  # Relative Icinga config file path for this device: `<role>/<name>.conf`.
  def netbox_icinga_filename
    File.join(netbox_role, "#{name}.conf")
  end
end
