data "aws_route53_zone" "externaldns" {
  for_each = toset(var.externaldns_enabled ? var.externaldns_zones : [])

  name = each.key
}

data "aws_iam_policy_document" "externaldns_policy" {
  statement {
    sid       = ""
    effect    = "Allow"
    resources = [for key in var.externaldns_zones : data.aws_route53_zone.externaldns[key].arn]
    actions = [
      "route53:ChangeResourceRecordSets",
      "route53:GetChange",

    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "route53:ListHostedZones",
      "route53:ListResourceRecordSets",
    ]
  }
}
