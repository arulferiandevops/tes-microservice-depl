resource "google_compute_instance" "vm_instance" {
  count        = 3
  name         = "vm-tlab-${count.index + 1}"
  machine_type = "n1-standard-1"
  zone = asia-southeast2-a

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
  }
}

# Allow SSH access to the instances
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}