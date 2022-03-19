output "vm_instance_host" {
  value       = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
  description = "VM Instance external IP"
}
