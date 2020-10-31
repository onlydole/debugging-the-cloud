provider "helm" {
  kubernetes {
    load_config_file = false

    host = module.aks.host

    client_certificate     = base64decode(module.aks.client_certificate)
    client_key             = base64decode(module.aks.client_key)
    cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  }
}

resource "helm_release" "datadog_agent" {
  name       = "datadog-agent"
  repository = "https://helm.datadoghq.com"
  chart      = "datadog"
  version    = "2.4.31"

  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set_sensitive {
    name  = "datadog.appKey"
    value = var.datadog_app_key
  }

  values = [
    file("datadog.yaml")
  ]
}
