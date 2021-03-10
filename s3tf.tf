provider "aws" {
	profile = "default"
	region = "us-east-1"
	}
	
resource "aws_s3_bucket" "mybuckettf" {
  bucket = "mytfbucket-280221"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_object" "my-test-object" {
  bucket = "${aws_s3_bucket.mybuckettf.id}"
  key    = "new_object_key"
  source = "../tests3/tests3bucket.txt"
  etag = "${md5(file("../tests3/tests3bucket.txt"))}"
  }
  