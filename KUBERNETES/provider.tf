
provider "kubernetes" {
config_path = "~/.kube/config"

}

resource "kubernetes_pod" "mon_pod1" {
metadata {
name = "cherif-pod1"
labels = {
 type = "backend"
 "owner" = "cherif"
 "app" = "cherif"
}
}
spec {
container {
image = "cherif1/cherif_worketyamo"
name = "ct1"
}
}
}

resource "kubernetes_pod" "mon_pod2"{
metadata {
name = "cherif-pod2"
labels = {
   type = "backend"
   "owner" = "cherif"
   "app" = "cherif"
}
}
spec {
container {
image = "cherif1/cherif_worketyamo"
name = "ct2"
}
}
}

resource "kubernetes_pod" "mon_pod3" {
metadata {
name = "cherif-pod3"
labels = {
  type = "backend"
  "owner" = "cherif"
  "app" = "cherif"
}
}
spec {
 container {
 image = "cherif1/cherif_worketyamo"
  name = "ct3"
}
}
}

