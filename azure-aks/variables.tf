variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "clustername" {
  description = "Azure Kubernetes Cluster Name"
}

variable "nodecount" {
  description = "AKS Number of Nodes"
}

variable "vmsize" {
  description = "AKS Node VMSize"
}

variable "environment" {
  description = "Tag for Environment"
}