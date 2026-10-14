# datapilot-test-iac

IaC for the Datapilot export test resources. Names and values mirror the live resources, so each root
can be `terraform import`ed and Sedai's resource mapping should bind them as-is.

| Account | Resource | Type | File | Export support |
|---|---|---|---|---|
| pn9ve1xz | dynamodb-test (+ gsi, lsi, autoscaling) | AWS_DYNAMODB | `aws/pn9ve1xz/dynamodb.tf` | Yes |
| pn9ve1xz | grizzly-ec2-no-cp-svc | AWS_ECS | `aws/pn9ve1xz/ecs.tf` | Yes |
| pn9ve1xz | grizzly-ec2-mixed-svc | AWS_ECS | `aws/pn9ve1xz/ecs.tf` | Yes |
| 6m4toedb | schedule-shutdown-test-aurora | AWS_RDS (Aurora) | `aws/6m4toedb/rds.tf` | Yes |
| 6m4toedb | rds-aurora-postgres-sim | AWS_RDS (Aurora) | `aws/6m4toedb/rds.tf` | Yes |
| 6m4toedb | i-078db1a1682517a15 | AWS_EC2 | `aws/6m4toedb/ec2.tf` | Yes (resize only) |
| 6m4toedb | i-04fad9d56594b7232 | AWS_EC2 | `aws/6m4toedb/ec2.tf` | Yes (resize only) |
| 0zs0qhox | cost_billing_reports, dataflowout | GCP_BUCKET | `gcp/0zs0qhox/storage.tf` | **No** |
| 0zs0qhox | pvc-4809312b-…, pvc-f45c1dc0-… | GCP_DISK | `gcp/0zs0qhox/disks.tf` | **No** |
| qkcyoqz6 | sample-streaming-pubsub-to-gcs | GCP_DATAFLOW_STREAMING_JOB | `gcp/qkcyoqz6/dataflow.tf` | **No** |

The unsupported rows are kept as negative cases: they should show as not exportable, never as a PR.

## Placeholders

- `dynamodb-test` key schema (`pk`/`sk`/`gsi_pk`/`lsi_sk`) — not in the resource details; fix before import.
- `ec2_ami_id`, `input_topic`, `output_directory` — supply via tfvars.

Terraform only — the IaC engine supports one tool per repo, so Kubernetes resources need their own repo.
