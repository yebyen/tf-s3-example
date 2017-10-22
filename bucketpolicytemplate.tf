resource "aws_s3_bucket_policy" "database_policy" {
  bucket = "${aws_s3_bucket.d.id}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Id": "PutObjPolicy",
  "Statement": [
    {
      "Sid": "DenyIncorrectEncryptionHeader",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:PutObject",
      "Resource": "${aws_s3_bucket.d.arn}/*",
      "Condition": {
        "StringNotEquals": {
           "s3:x-amz-server-side-encryption": "AES256"
         }
      }
    },
    {
      "Sid": "DenyUnEncryptedObjectUploads",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:PutObject",
      "Resource": "${aws_s3_bucket.d.arn}/*",
      "Condition": {
        "Null": {
          "s3:x-amz-server-side-encryption": true
        }
     }
    }
  ]
}
POLICY
}
