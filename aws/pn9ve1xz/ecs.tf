data "aws_ecs_cluster" "morpheus_02" {
  cluster_name = "sedai-labs-ecs-morpheus-02"
}

resource "aws_ecs_task_definition" "grizzly_ec2" {
  family                   = "sedai-labs-ecs-morpheus-02-grizzly-ec2"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"

  container_definitions = jsonencode([
    {
      name      = "grizzly-one"
      image     = "762849587550.dkr.ecr.us-east-1.amazonaws.com/sedai-labs/grizzly-one-ecs:latest"
      essential = true
      cpu       = 0
      memory    = 351
      memoryReservation = 351
    }
  ])
}

resource "aws_ecs_service" "grizzly_ec2_no_cp_svc" {
  name                               = "grizzly-ec2-no-cp-svc"
  cluster                            = data.aws_ecs_cluster.morpheus_02.arn
  task_definition                    = aws_ecs_task_definition.grizzly_ec2.arn
  launch_type                        = "EC2"
  desired_count                      = 1
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:pool == no-cp"
  }
}

resource "aws_ecs_service" "grizzly_ec2_mixed_svc" {
  name                               = "grizzly-ec2-mixed-svc"
  cluster                            = data.aws_ecs_cluster.morpheus_02.arn
  task_definition                    = aws_ecs_task_definition.grizzly_ec2.arn
  desired_count                      = 3
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  capacity_provider_strategy {
    capacity_provider = "sedai-labs-ecs-morpheus-02-spot"
    weight            = 1
    base              = 0
  }

  capacity_provider_strategy {
    capacity_provider = "sedai-labs-ecs-morpheus-02-ondemand"
    weight            = 1
    base              = 1
  }
}
