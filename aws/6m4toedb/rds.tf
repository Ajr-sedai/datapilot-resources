resource "aws_rds_cluster" "schedule_shutdown_test_aurora" {
  provider = aws.us_west_1

  cluster_identifier              = "schedule-shutdown-test-aurora"
  engine                          = "aurora-postgresql"
  engine_version                  = "17.7"
  engine_mode                     = "provisioned"
  storage_type                    = "aurora"
  port                            = 5432
  db_cluster_parameter_group_name = "default.aurora-postgresql17"
  backup_retention_period         = 7
  preferred_maintenance_window    = "sat:08:32-sat:09:02"
  master_username                 = "postgres"
  manage_master_user_password     = true
  skip_final_snapshot             = true
}

resource "aws_rds_cluster_instance" "schedule_shutdown_test_aurora_instance_1" {
  provider = aws.us_west_1

  identifier         = "schedule-shutdown-test-aurora-instance-1"
  cluster_identifier = aws_rds_cluster.schedule_shutdown_test_aurora.id
  engine             = aws_rds_cluster.schedule_shutdown_test_aurora.engine
  engine_version     = aws_rds_cluster.schedule_shutdown_test_aurora.engine_version
  instance_class     = "db.t3.medium"
}

resource "aws_rds_cluster" "rds_aurora_postgres_sim" {
  provider = aws.us_west_1

  cluster_identifier              = "rds-aurora-postgres-sim"
  engine                          = "aurora-postgresql"
  engine_version                  = "17.7"
  engine_mode                     = "provisioned"
  storage_type                    = "aurora-iopt1"
  port                            = 5432
  db_cluster_parameter_group_name = "default.aurora-postgresql17"
  backup_retention_period         = 7
  preferred_maintenance_window    = "mon:08:00-mon:13:30"
  master_username                 = "postgres"
  manage_master_user_password     = true
  skip_final_snapshot             = true
}

resource "aws_rds_cluster_instance" "rds_aurora_postgres_sim_instance_1" {
  provider = aws.us_west_1

  identifier         = "rds-aurora-postgres-sim-instance-1"
  cluster_identifier = aws_rds_cluster.rds_aurora_postgres_sim.id
  engine             = aws_rds_cluster.rds_aurora_postgres_sim.engine
  engine_version     = aws_rds_cluster.rds_aurora_postgres_sim.engine_version
  instance_class     = "db.t3.large"
}
