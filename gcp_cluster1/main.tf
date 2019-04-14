
resource "google_compute_instance" "nodejs-1" {

    name         = "nodejs-1"
    machine_type = "f1-micro"

    zone         = "${var.project_zone}"

    tags = ["firewall-nodejs"]

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-9"
      }
    }

    metadata_startup_script = "sudo apt update; sudo apt install nodejs"

    network_interface {
      network = "default"

      access_config {
      }
    }

    metadata {
      sshKeys = "guerzonix:${file("~/.ssh/id_rsa.pub")}"
    }

}

resource "google_compute_instance" "nodejs-2" {

    name         = "nodejs-2"
    machine_type = "f1-micro"
    
    zone         = "${var.project_zone}"

    tags = ["firewall-nodejs"]

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-9"
      }
    }

    metadata_startup_script = "sudo apt update; sudo apt install nodejs"

    network_interface {
      network = "default"

      access_config {
      }
    }

    metadata {
      sshKeys = "guerzonix:${file("~/.ssh/id_rsa.pub")}"
    }

}

output "ip-nodejs-1" {
    value = "${google_compute_instance.nodejs-1.network_interface.0.access_config.0.nat_ip}"
}

output "ip-nodejs-2" {
    value = "${google_compute_instance.nodejs-2.network_interface.0.access_config.0.nat_ip}"
}
