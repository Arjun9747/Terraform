provider "google" {
  version = "3.5.0"

  credentials = file("key.json")

  project = var.project
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "appserver" {
  name = "secondary-application-server"
  machine_type = "f1-micro"

  boot_disk {
   initialize_params {
     image = var.image
   }
}
 network_interface {
   network = "default"
}
}