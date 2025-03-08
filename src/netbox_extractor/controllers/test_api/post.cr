module NetboxExtractor
  module Controllers
    module TestApi
      module POST
        Log = ::Log.for("netbox-extractor.test_api.post")

        def self.create_vms
          virtualization_api = NetboxClient::VirtualizationApi.new
          dcim_api = NetboxClient::DcimApi.new

          vms = virtualization_api.virtualization_virtual_machines_list
          vms.results.each do |vm|
            Log.info { "Found vm: #{vm.name}" }
            # puts vm.local_context_data
          end

          Log.info { "Finding a random cluster" }
          clusters = virtualization_api.virtualization_clusters_list
          cluster = clusters.results.first

          Log.info { "loading request data:" }

          r = Random.new
          random = r.next_int

          vm1 = {"name" => "foo#{random}", "cluster" => {"value" => cluster.to_h}}.to_any_h
          vm2 = {"name" => "bar#{random}", "cluster" => {"value" => cluster.to_h}}.to_any_h
          data = [vm1, vm2]

          Log.info { "building requests:" }

          request_vm1 = NetboxClient::VirtualizationVirtualMachinesCreateRequest.build(vm1)
          request_vm2 = NetboxClient::VirtualizationVirtualMachinesCreateRequest.build(vm2)
          request_multi = NetboxClient::VirtualizationVirtualMachinesCreateRequest.build(data)

          # puts "create_vms: INSPECT"
          # puts request_vm1.inspect
          # puts request_vm2.inspect
          # puts request_multi.inspect

          # puts "create_vms: JSON"
          # puts request_vm1.to_json
          # puts request_vm2.to_json
          # puts request_multi.to_json

          # puts "create_vms: YAML"
          # puts request_vm1.to_yaml
          # puts request_vm2.to_yaml
          # puts request_multi.to_yaml

          if request_vm1
            Log.info { "creating vm: #{request_vm1}" }

            vm = virtualization_api.virtualization_virtual_machines_create(request_vm1)
            create_bookmark(vm)
          end
        end

        def self.create_bookmark(vm)
          user = NetboxClient::BookmarkRequestUser.build({"username" => "user713604"}.to_any_h)

          if user
            bk1 = {"object_type" => "virtualization.virtualmachine", "object_id" => vm.id.to_i64, "user" => user.to_any_h}.to_any_h
            request_bk1 = NetboxClient::ExtrasBookmarksCreateRequest.build(bk1)

            if request_bk1
              Log.info { "creating bookmark: #{request_bk1}" }
              extras_api = NetboxClient::ExtrasApi.new
              extras_api.extras_bookmarks_create(request_bk1)
            end
          end
        end
      end
    end
  end
end
