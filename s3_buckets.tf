resource "aws_s3_bucket" "b" {
  bucket = "tsureshbab-098765"
  acl    = "private"

  tags = {
    Name = "tsureshbab-098765"
  }
}


resource "aws_s3_bucket_object" "object1" {
  bucket = "tsureshbab-098765"
  key    = "policies/dev/assume_role_policy.json"
  source = "policies/assume_role_policy.json"
  etag   = "${filemd5("policies/assume_role_policy.json")}"
}

resource "aws_s3_bucket_object" "object2" {
  bucket = "tsureshbab-098765"
  key    = "policies/dev/instance_policy.json"
  source = "policies/instance_policy.json"
  etag   = "${filemd5("policies/instance_policy.json")}"
}
