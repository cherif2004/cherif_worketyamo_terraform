resource "kubernetes_service" "cherif-service" {
metadata {
name = "service-of-cherif"
labels = {
type = "backend"
}
}
spec {
selector = {
type = "backend"
}
port {
port = 22
target_port = 22
node_port = 8070
}
type = "NodePort"
}
}