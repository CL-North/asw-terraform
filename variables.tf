variable "aws_region" {
  description = "The AWS region to use to create resources."
  default     = "ca-central-1"
}

variable "bucket_prefix" {
    type        = string
    description = "Creates a unique bucket name beginning with the specified prefix."
    default     = "totira-s3bucket-"
}

variable "s3tags" {
    type        = map
    description = "mapping of tags to assign to the bucket."
    default     = {
        environment = "DEV"
        terraform   = "true"
    }
}

variable "versioning" {
    type        = bool
    description = "state of versioning."
    default     = true
}

variable "acl" {
    type        = string
    description = " Defaults to private "
    default     = "private"
}
