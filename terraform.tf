terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.13"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.33"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.3"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 1.4"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 1.3"
    }
    datadog = {
      source  = "datadog/datadog"
      version = "~> 2.16"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.0"
    }
  }

  required_version = "~> 0.13"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "onlydole"

    workspaces {
      name = "debugging-the-cloud"
    }
  }
}

