
provider "google" {
    credentials = "${file("../../gcp_creds/credential_1.json")}"
    project     = "${var.project_name}"
    region      = "${var.project_region}"
}
