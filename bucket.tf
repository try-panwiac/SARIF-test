resource "aws_s3_bucket" "foo-bucket" {
  region        = "us-east-1"
  bucket        = "my-bucket"
  acl           = "public-read"
}


resource "aws_s3_bucket_acl" "fail_2" {
  bucket = "name"
  access_control_policy {

    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
      }
      permission = "READ_ACP"
    }
    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}

