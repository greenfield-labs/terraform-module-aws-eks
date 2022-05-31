variable "cluster" {
  description = "Name of EKS cluster"
}

variable "argocd_repo_server_oidc_subject" {
  description = "ArgoCD Repo Server OIDC subject"
  default     = "system:serviceaccount:argocd:argocd-repo-server"
}

variable "argocd_repo_server_kms_key_arns" {
  type        = list(string)
  description = "A list of KMS key arns ArgoCD needs to decrypt secrets"
  default     = []
}

variable "externaldns_enabled" {
  default = true
}

variable "externaldns_oidc_subject" {
  default = "system:serviceaccount:ops:external-dns"
}

variable "externaldns_zones" {
  description = "A list of zone hostnames that external-dns should be allowed to manage"
  type        = list(string)
  default     = []
}
