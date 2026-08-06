require "../../spec_helper"

Spectator.describe NetboxExtractor::Config::Base do
  describe "#validate!" do
    it "passes on the shipped example config" do
      path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
      config = NetboxExtractor::Config::Base.from_yaml(File.read(path))

      expect { config.validate! }.to_not raise_error
    end

    it "rejects duplicate site ids (they resolve to the same output directory)" do
      path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
      config = NetboxExtractor::Config::Base.from_yaml(File.read(path))
      config.sites << config.sites.first

      expect { config.validate! }.to raise_error(NetboxExtractor::Config::ValidationError)
    end

    it "rejects duplicate Ansible inventory filenames within a site (they overwrite each other)" do
      path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
      config = NetboxExtractor::Config::Base.from_yaml(File.read(path))
      role = NetboxExtractor::Config::Ansible::SiteDeviceRole.from_yaml("name: dup\nfilename: physical-linux")
      config.sites.first.ansible.include_device_roles << role

      expect { config.validate! }.to raise_error(NetboxExtractor::Config::ValidationError)
    end

    # An Icinga role's `filename` now names the output subdirectory, so it is
    # concatenated into a path. A traversal segment there would write outside
    # the site's zone directory, which the host-name filter already prevents for
    # Netbox-sourced names.
    it "rejects an Icinga role filename that would escape the zone directory" do
      path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
      config = NetboxExtractor::Config::Base.from_yaml(File.read(path))
      role = NetboxExtractor::Config::Icinga::SiteDeviceRole.from_yaml("name: evil\nfilename: ../../etc")
      config.sites.first.icinga.include_device_roles << role

      expect { config.validate! }.to raise_error(NetboxExtractor::Config::ValidationError)
    end
  end
end
