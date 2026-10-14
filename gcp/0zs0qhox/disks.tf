# GKE PVC disks (sedai-kubeflow-alpha-cluster); goog-* labels are GKE-reserved so they're left off.
resource "google_compute_disk" "pvc_4809312b" {
  name = "pvc-4809312b-f422-4de1-907f-683a36763714"
  zone = "southamerica-west1-c"
  type = "pd-balanced"
  size = 20
}

resource "google_compute_disk" "pvc_f45c1dc0" {
  name = "pvc-f45c1dc0-6692-4f1a-b0aa-21cd5309ff39"
  zone = "southamerica-west1-c"
  type = "pd-balanced"
  size = 20
}
