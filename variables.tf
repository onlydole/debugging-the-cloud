variable "project_name" {
  type        = string
  description = "Globally used project name"
  default     = "debugging-the-cloud"
}

variable "region" {
  type        = string
  description = "Azure Region that will be used"
  default     = "West US"
}

variable "cluster_version" {
  type        = string
  description = "The Kubernetes version for our clusters"
  default     = "1.18"
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog App Key"
}

variable "services" {
  type = map(object({
    pd_service_key            = string,
    environment               = string,
    framework                 = string,
    high_error_rate_warning   = number,
    high_error_rate_critical  = number,
    high_avg_latency_warning  = number,
    high_avg_latency_critical = number,
    high_p90_latency_warning  = number,
    high_p90_latency_critical = number,
  }))
  description = "Services and query alert thresholds"
}
