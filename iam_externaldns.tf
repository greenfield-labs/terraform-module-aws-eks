module "externaldns_iam_role" {
  source = "git@github.com:greenfield-labs/terraform-module-aws-iam-role-irsa.git"
  count  = var.externaldns_enabled ? 1 : 0

  cluster   = var.cluster
  role_name = "${var.cluster}-irsa-exteraldns"

  service_account_subjects = [
    var.externaldns_oidc_subject
  ]

  inline_policy_json = data.aws_iam_policy_document.externaldns_policy.json
}
