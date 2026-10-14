# Key schema isn't in the Sedai resource details; pk/sk/attribute names are placeholders.
resource "aws_dynamodb_table" "dynamodb_test" {
  name           = "dynamodb-test"
  billing_mode   = "PROVISIONED"
  table_class    = "STANDARD"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "pk"
  range_key      = "sk"

  attribute {
    name = "pk"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "S"
  }

  attribute {
    name = "gsi_pk"
    type = "S"
  }

  attribute {
    name = "lsi_sk"
    type = "S"
  }

  global_secondary_index {
    name            = "gsi"
    hash_key        = "gsi_pk"
    projection_type = "ALL"
    read_capacity   = 10
    write_capacity  = 10
  }

  local_secondary_index {
    name            = "lsi"
    range_key       = "lsi_sk"
    projection_type = "ALL"
  }
}

resource "aws_appautoscaling_target" "table_read" {
  service_namespace  = "dynamodb"
  resource_id        = "table/${aws_dynamodb_table.dynamodb_test.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  min_capacity       = 10
  max_capacity       = 50
}

resource "aws_appautoscaling_policy" "table_read" {
  name               = "DynamoDBReadCapacityUtilization:table/dynamodb-test"
  policy_type        = "TargetTrackingScaling"
  service_namespace  = aws_appautoscaling_target.table_read.service_namespace
  resource_id        = aws_appautoscaling_target.table_read.resource_id
  scalable_dimension = aws_appautoscaling_target.table_read.scalable_dimension

  target_tracking_scaling_policy_configuration {
    target_value = 70
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
  }
}

resource "aws_appautoscaling_target" "table_write" {
  service_namespace  = "dynamodb"
  resource_id        = "table/${aws_dynamodb_table.dynamodb_test.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  min_capacity       = 10
  max_capacity       = 50
}

resource "aws_appautoscaling_policy" "table_write" {
  name               = "DynamoDBWriteCapacityUtilization:table/dynamodb-test"
  policy_type        = "TargetTrackingScaling"
  service_namespace  = aws_appautoscaling_target.table_write.service_namespace
  resource_id        = aws_appautoscaling_target.table_write.resource_id
  scalable_dimension = aws_appautoscaling_target.table_write.scalable_dimension

  target_tracking_scaling_policy_configuration {
    target_value = 70
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
  }
}

resource "aws_appautoscaling_target" "gsi_read" {
  service_namespace  = "dynamodb"
  resource_id        = "table/${aws_dynamodb_table.dynamodb_test.name}/index/gsi"
  scalable_dimension = "dynamodb:index:ReadCapacityUnits"
  min_capacity       = 10
  max_capacity       = 50
}

resource "aws_appautoscaling_policy" "gsi_read" {
  name               = "DynamoDBReadCapacityUtilization:table/dynamodb-test/index/gsi"
  policy_type        = "TargetTrackingScaling"
  service_namespace  = aws_appautoscaling_target.gsi_read.service_namespace
  resource_id        = aws_appautoscaling_target.gsi_read.resource_id
  scalable_dimension = aws_appautoscaling_target.gsi_read.scalable_dimension

  target_tracking_scaling_policy_configuration {
    target_value = 70
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
  }
}

resource "aws_appautoscaling_target" "gsi_write" {
  service_namespace  = "dynamodb"
  resource_id        = "table/${aws_dynamodb_table.dynamodb_test.name}/index/gsi"
  scalable_dimension = "dynamodb:index:WriteCapacityUnits"
  min_capacity       = 10
  max_capacity       = 50
}

resource "aws_appautoscaling_policy" "gsi_write" {
  name               = "DynamoDBWriteCapacityUtilization:table/dynamodb-test/index/gsi"
  policy_type        = "TargetTrackingScaling"
  service_namespace  = aws_appautoscaling_target.gsi_write.service_namespace
  resource_id        = aws_appautoscaling_target.gsi_write.resource_id
  scalable_dimension = aws_appautoscaling_target.gsi_write.scalable_dimension

  target_tracking_scaling_policy_configuration {
    target_value = 70
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
  }
}
