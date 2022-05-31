data "aws_iam_policy_document" "argocd_repo_server_policy" {
  count = length(var.argocd_repo_server_kms_key_arns) > 0 ? 1 : 0

  statement {
    sid       = ""
    effect    = "Allow"
    resources = var.argocd_repo_server_kms_key_arns
    actions = [
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey",
      "kms:GenerateDataKeyWithoutPlaintext"
    ]
  }
}
