// SES Configuration
resource "aws_ses_configuration_set" "totira_ses_conf" {
  name = "configuration-set-totira-ses"

  delivery_options {
    tls_policy = "Require"
  }
}

// SES Domain identity
resource "aws_ses_domain_identity" "totira_ses_domain_identity" {
  domain = "totira.com"
}

resource "aws_route53_record" "totira_ses_verification_record" {
  zone_id = "ABCDEFGHIJ123"
  name    = "_amazonses.totira.com"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.totira_ses_domain_identity.verification_token]
}

// SES Email identity
resource "aws_ses_email_identity" "totira_email" {
  email = "email@totira.com"
}

// SES identity policy
// Note: SES domain identity should be in place

data "aws_iam_policy_document" "totira_iam" {
  statement {
    actions   = ["SES:SendEmail", "SES:SendRawEmail"]
    resources = [aws_ses_domain_identity.totira_iam.arn]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}

resource "aws_ses_identity_policy" "totira_ses_id" {
  identity = aws_ses_domain_identity.totira_ses_id.arn
  name     = "Totita SES identity Policy"
  policy   = data.aws_iam_policy_document.totira_ses_id.json
}

// SES Template

resource "aws_ses_template" "MyTemplate" {
  name    = "MyTemplate"
  subject = "Greetings"
  html    = "<h1>Hello </h1>"
  text    = "Hello "
}
