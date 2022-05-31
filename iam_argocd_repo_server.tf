module "argocd_repo_server_iam_role" {
  source = "git@github.com:greenfield-labs/terraform-module-aws-iam-role-irsa.git"
  count  = length(var.argocd_repo_server_kms_key_arns) > 0 ? 1 : 0

  cluster   = var.cluster
  role_name = "${var.cluster}-irsa-argocd-repo-server"

  service_account_subjects = [
    var.argocd_repo_server_oidc_subject
  ]

  inline_policy_json = data.aws_iam_policy_document.argocd_repo_server_policy[0].json
}
