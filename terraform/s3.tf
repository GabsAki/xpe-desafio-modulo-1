resource "aws_s3_bucket" "s3_bucket" {
  bucket = "desafio-modulo-1-850900288339"
  tags = {
    IES = "IGTE"
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
