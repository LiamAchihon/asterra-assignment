output "ec2_eip" {
  value = aws_eip.ec2_eip.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.address
}

output "s3_bucket_name" {
  value = aws_s3_bucket.geojson_bucket.bucket
}

output "vpc_id" {
  value = aws_vpc.main.id
}
