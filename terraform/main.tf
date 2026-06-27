resource "oci_core_instance" "generated_oci_core_instance" {
	
  agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		
    plugins_config {
			desired_state = "DISABLED"
			name = "WebLogic Management Service"
		}
		
    plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		
    plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		
    plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Hub Agent"
		}
		
    plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		
    plugins_config {
			desired_state = "DISABLED"
			name = "Fleet Application Management Service"
		}
		
    plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		
    plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		
    plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		
    plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		
    plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		
    plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		
    plugins_config {
			desired_state = "ENABLED"
			name = "Cloud Guard Workload Protection"
		}
		
    plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
	
    plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	
  availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	
  availability_domain = "ctEl:US-CHICAGO-1-AD-1"
	
  compartment_id = var.compartment_id
  
  create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		display_name = "struitdev-vnic"
		subnet_id = var.subnet_id
	}

	display_name = "oci_server"
	instance_options {
		are_legacy_imds_endpoints_disabled = "true"
	}
	
  is_pv_encryption_in_transit_enabled = "true"

	metadata = {
    "ssh_authorized_keys" = file("/home/github/.ssh/oci_instance_key.pub")
    "user_data"           = "IyF1c3IvYmluL2VudiBiYXNoCgojVXBkYXRlIEltYWdlIC0gQ2hlY2sgUHl0aG9uCiNWZXJpZnkgU1NIIENvbmZpZwoKZG5mIGNoZWNrLXVwZGF0ZQoKaWYgISBjb21tYW5kIC12IHB5dGhvbjMgJj4gL2Rldi9udWxsOyB0aGVuCiAgICBkbmYgaW5zdGFsbCAteSBweXRob24zCmZpCgojIyMjIwoKc3lzdGVtY3RsIGVuYWJsZSAtLW5vdyBzc2hkCmZpcmV3YWxsLWNtZCAtcGVybWFuZW50IC0tYWRkLXNlcnZpY2U9c3NoCmZpcmV3YWxsLWNtZCAtLXJlbG9hZAo="
  }	

	shape = "VM.Standard.E5.Flex"
	shape_config {
		memory_in_gbs = "12"
		ocpus = "1"
	}
	
  source_details {
		source_id = "ocid1.image.oc1.us-chicago-1.aaaaaaaafzzghkretxzpc3taybrtbakmgzbrxsiggcrjictbxr7zgjwjxd6a"
		source_type = "image"
	}
}

  resource "local_file" "ansible_inventory" {
        content = templatefile("${path.module}/hosts.tpl", {
          instance_ip = oci_core_instance.generated_oci_core_instance.public_ip
        })

    filename = "/home/github/ansible/hosts"
}
