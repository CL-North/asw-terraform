
// CloudSearch domain

resource "aws_cloudsearch_domain" "example" {
  name = "example-domain"

  scaling_parameters {
    desired_instance_type = "search.medium"
  }

  index_field {
    name            = "headline"
    type            = "text"
    search          = true
    return          = true
    sort            = true
    highlight       = false
    analysis_scheme = "_en_default_"
  }

  index_field {
    name   = "price"
    type   = "double"
    search = true
    facet  = true
    return = true
    sort   = true
  }
}



// CloudSearch domain service access policy


resource "aws_cloudsearch_domain_service_access_policy" "example" {
  domain_name = aws_cloudsearch_domain.example.id

  access_policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"search_only",
    "Effect":"Allow",
    "Principal":"*",
    "Action":[
      "cloudsearch:search",
      "cloudsearch:document"
    ],
    "Condition":{"IpAddress":{"aws:SourceIp":"192.0.2.0/32"}}
  }]
}
POLICY
}
