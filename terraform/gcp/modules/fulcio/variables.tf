/**
 * Copyright 2022 The Sigstore Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  type    = string
  default = ""
  validation {
    condition     = length(var.project_id) > 0
    error_message = "Must specify project_id variable."
  }
}

variable "enable_google_domain" {
  type = bool
  description = "Wheter or not to use google domains for fulcio"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "cluster_name" {
  description = "The name to give the new Kubernetes cluster."
  type        = string
}

// Certificate authority
variable "ca_pool_name" {
  description = "Certificate authority pool name"
  type        = string
}

variable "ca_name" {
  description = "Certificate authority name"
  type        = string
  default     = "sigstore-authority"
}

variable "enable_ca" {
  description = "Enable a certificate authority via GCP CA Service"
  type        = bool
  default     = true
}

// KMS
variable "fulcio_keyring_name" {
  type        = string
  description = "Name of KMS keyring for Fulcio"
  default     = "fulcio-keyring"
}

variable "fulcio_key_name" {
  type        = string
  description = "Name of KMS key for Fulcio"
  default     = "fulcio-intermediate-key"
}

variable "kms_location" {
  type        = string
  description = "Location of KMS keyring"
  default     = "global"
}

variable "dns_zone_name" {
  description = "Name of DNS Zone object in Google Cloud DNS"
  type        = string
}

variable "dns_domain_name" {
  description = "Name of DNS domain name in Google Cloud DNS"
  type        = string
}

variable "load_balancer_ipv4" {
  description = "IPv4 adddress of external load balancer"
  type        = string
}

// temporary variables to facilitate traffic shift
variable "nginx_traffic_weight" {
  description = "weight for DNS weighted round robin for NGINX-based ingress"
  type        = number
  default     = 1
}

variable "gcp_lb_traffic_weight" {
  description = "weight for DNS weighted round robin for GCP-based load balancer"
  type        = number
  default     = 0
}
