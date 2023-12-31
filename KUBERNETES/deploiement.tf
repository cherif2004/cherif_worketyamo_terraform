resource "kubernetes_deployment" "cherif-deployment1" {
  metadata {
    name = "cherif-deployment1"
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "cherif-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "cherif-app"
        }
      }
      spec {
        container {
          name = "ct-cherif"
          image = "cherif1/cherif_worketyamo"
        }
        node_selector = {
            node_role = "master"
        }
      }
    }
    strategy {
      type = "RollingUpdate"
    }
  }
}

resource "kubernetes_service" "cherif-deployment1" {
    metadata {
      name = "cherif-deployment2"
      labels = {
        app = "cherif-app"
      }
    }

    spec {
      selector = {
        app = "cherif-app"
      }
      type = "NodePort"
      port {
        port = 80
        target_port = 80
        node_port = 30000
      }
    }
  
}

#Il est préférable d'utiliser un déploiement Kubernetes pour créer des pods car cela permet de contrôler le déploiement et la mise à jour des pods. Par exemple, 
#si des pods doivent être mises à jour, un déploiement peut être utilisé pour gérer le processus de mise à jour en utilisant des stratégies de mise à jour telles que RollingUpdate ou Recreate. 
#Il est également possible de contrôler le nombre de pods,
# la configuration des pods, l'image du conteneur, etc. en utilisant un déploiement.