# Aurora cluster (writer + reader)
resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "my-aurora-cluster"
  engine                  = "aurora-mysql"
  engine_mode             = "provisioned"
  engine_version          = "5.7.mysql_aurora.2.10.0"  # or latest compatible version
  database_name           = "mydb"
  master_username         = "yourusername"           # set your DB username here
  master_password         = "yourpassword"           # store securely in real world, e.g., via secrets manager
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.db_instance_sg.id]
  availability_zones      = data.aws_availability_zones.available.names
  backup_retention_period = 5
  skip_final_snapshot     = true

  tags = {
    Name = "MyAuroraCluster"
  }
}


# writer instance
resource "aws_rds_cluster_instance" "writer" {
  identifier              = "aurora-cluster-writer"
  cluster_identifier      = aws_rds_cluster.aurora_cluster.id
  instance_class          = "db.t3.medium"  # for dev/test, choose a cost-effective instance
  engine                  = aws_rds_cluster.aurora_cluster.engine
  engine_version          = aws_rds_cluster.aurora_cluster.engine_version
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
  monitoring_interval     = 30

  tags = {
    Name = "Aurora-Writer-Instance"
  }
}


# reader (Aurora Replica)
resource "aws_rds_cluster_instance" "reader" {
  identifier              = "aurora-cluster-reader"
  cluster_identifier      = aws_rds_cluster.aurora_cluster.id
  instance_class          = "db.t3.medium"
  engine                  = aws_rds_cluster.aurora_cluster.engine
  engine_version          = aws_rds_cluster.aurora_cluster.engine_version
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
  monitoring_interval     = 30

  tags = {
    Name = "Aurora-Reader-Instance"
  }
}
