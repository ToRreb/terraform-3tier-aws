# Output values

# Once your Terraform applies successfully, you can output the endpoint by defining an output variable in your Terraform file
output "aurora_writer_endpoint" {
  value = aws_rds_cluster.aurora_cluster.endpoint
}


output "app_instance_id" {
  value = aws_instance.app_instance.id
}

output "connect_instance_console_url" {
  value = "https://console.aws.amazon.com/ec2/home?region=${var.aws_region}#ConnectToInstance:instanceId=${aws_instance.app_instance.id}"
}
