provider "helm" {
  kubernetes {
    load_config_file       = false
    host                   = azurerm_kubernetes_cluster.cluster.kube_config.0.host
    username               = azurerm_kubernetes_cluster.cluster.kube_config.0.username
    password               = azurerm_kubernetes_cluster.cluster.kube_config.0.password
    client_certificate     = base64decode(azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)
  }
}

resource "helm_release" "datadog_agent" {
  name       = "datadog-agent"
  repository = "https://helm.datadoghq.com"
  chart      = "datadog"
  version    = "2.4.30"

  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set_sensitive {
    name  = "datadog.appKey"
    value = var.datadog_app_key
  }

  set {
    name  = "datadog.logs.enabled"
    value = true
  }

  set {
    name  = "datadog.logs.containerCollectAll"
    value = true
  }

  set {
    name  = "clusterAgent.enabled"
    value = true
  }

  set {
    name  = "clusterAgent.metricsProvider.enabled"
    value = true
  }

  set {
    name  = "datadog.processAgent.enabled"
    value = true
  }

  set {
    name  = "datadog.processAgent.processCollection"
    value = true
  }
  set {
    name  = "datadog.leaderElection"
    value = true
  }

  set {
    name  = "rbac.create"
    value = true
  }

  set {
    name  = "datadog.collectEvents"
    value = true
  }
}
