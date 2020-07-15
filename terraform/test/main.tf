resource "aws_s3_bucket" "a" {
  bucket = "gruppe-3-bucket"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "a" {
  bucket = "${aws_s3_bucket.a.id}"
  policy = templatefile("policy/public_bucket.json.tpl", {bucket_arn = aws_s3_bucket.a.arn})
}


resource "aws_s3_bucket" "b" {
  bucket = "gruppe-3-bucket2"
  
  tags = {
    Name        = "My bucket 2"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "b" {
  bucket = "${aws_s3_bucket.b.id}"
  policy = templatefile("policy/public_bucket.json.tpl", {bucket_arn = aws_s3_bucket.b.arn})
}



