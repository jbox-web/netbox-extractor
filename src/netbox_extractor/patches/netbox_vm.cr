# Extends the generated virtual machine type with VM-specific `netbox_*`
# helpers, mixing in the shared `NetboxExtractor::Patches::NetboxClient` module
# and overriding host-type and vendor accessors for virtual machines.
class NetboxClient::VirtualMachineWithConfigContext
  include NetboxExtractor::Patches::NetboxClient

  # Name of the hypervisor device hosting this VM, or `nil` when not assigned.
  def netbox_hosting_node
    device.try &.name
  end

  # Virtual machines are always `"virtual"`.
  def netbox_host_type
    "virtual"
  end

  # VMs have no hardware vendor; always `nil`.
  def netbox_vendor_name
    nil
  end

  # VMs have no hardware model; always `nil`.
  def netbox_vendor_model
    nil
  end

  # Default Icinga output subdirectory for a VM: `<role>-<os_family>`.
  # Overridden by the role's `filename` when the config sets one.
  def netbox_icinga_subdir
    "#{netbox_role}-#{netbox_os_family}"
  end
end
