
resource "google_compute_firewall" "default" {

    name    = "firewall-nodejs"
    network = "default"

    allow {
      protocol = "tcp"
      ports    = ["8080","8443","80","443"]
    }
}
