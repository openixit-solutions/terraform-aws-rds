# RDS Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| <a name="input_region"></a> [region](#input\_region) | Region of the Resources | `string` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | The name of the RDS instance | `string` | n/a | yes |
| <a name="input_use_identifier_prefix"></a> [use_identifier_prefix](#input\_use_identifier_prefix) | Determines whether to use `identifier` as is or create a unique identifier beginning with `identifier` as the specified prefix | `bool` | `false` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to use | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine_version](#input\_engine_version) | The engine version to use | `string` | `null` | no |
| <a name="input_instance_class"></a> [instance_class](#input\_instance_class) | The instance type of the RDS instance | `string` | `null` | no |
| <a name="input_allocated_storage"></a> [allocated_storage](#input\_allocated_storage) | The allocated storage in gigabytes | `string` | `null` | no |
| <a name="input_storage_type"></a> [storage_type](#input\_storage_type) | One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (new generation of general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not. If you specify 'io1' or 'gp3' , you must also include a value for the 'iops' parameter | `string` | `null` | no |
| <a name="input_storage_encrypted"></a> [storage_encrypted](#input\_storage_encrypted) | Specifies whether the DB instance is encrypted | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms_key_id](#input\_kms_key_id) | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used | `string` | `null` | no |
| <a name="input_db_name"></a> [db_name](#input\_db_name) | The DB name to create. If omitted, no database is created initially | `string` | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | Username for the master DB user | `string` | `null` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections | `string` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter_group_name](#input\_parameter_group_name) | Name of the DB parameter group to associate | `string` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly_accessible](#input\_publicly_accessible) | Bool to control if instance is publicly accessible | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply_immediately](#input\_apply_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| <a name="input_maintenance_window"></a> [maintenance_window](#input\_maintenance_window) | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | `string` | `null` | no |
| <a name="input_snapshot_identifier"></a> [snapshot_identifier](#input\_snapshot_identifier) | Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05 | `string` | `null` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy_tags_to_snapshot](#input\_copy_tags_to_snapshot) | On delete, copy all Instance tags to the final snapshot | `bool` | `false` | no |
| <a name="input_skip_final_snapshot"></a> [skip_final_snapshot](#input\_skip_final_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted | `bool` | `false` | no |
| <a name="input_final_snapshot_identifier_prefix"></a> [final_snapshot_identifier_prefix](#input\_final_snapshot_identifier_prefix) | The name which is prefixed to the final snapshot on cluster destroy | `string` | `"final"` | no |
| <a name="input_performance_insights_enabled"></a> [performance_insights_enabled](#input\_performance_insights_enabled) | Specifies whether Performance Insights are enabled. Defaults to false | `bool` | `false` | no |
| <a name="input_performance_insights_retention_period"></a> [performance_insights_retention_period](#input\_performance_insights_retention_period) | Amount of time in days to retain Performance Insights data. Valid values are 7, 731 (2 years) or a multiple of 31 | `number` | `7` | no |
| <a name="input_skip_performance_insights_kms_key_id"></a> [performance_insights_kms_key_id](#input\_performance_insights_kms_key_id) | The ARN for the KMS key to encrypt Performance Insights data | `string` | `null` | no |
| <a name="input_backup_retention_period"></a> [backup_retention_period](#input\_backup_retention_period) | The days to retain backups for | `number` | `null` | no |
| <a name="input_backup_window"></a> [backup_window](#input\_backup_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window | `string` | `null` | no |
| <a name="input_max_allocated_storage"></a> [max_allocated_storage](#input\_max_allocated_storage) | Specifies the value for Storage Autoscaling | `number` | `0` | no |
| <a name="input_deletion_protection"></a> [deletion_protection](#input\_deletion_protection) | The database can't be deleted when this value is set to true | `bool` | `false` | no |
| <a name="input_delete_automated_backups"></a> [delete_automated_backups](#input\_delete_automated_backups) | Specifies whether to remove automated backups immediately after the DB instance is deleted | `bool` | `true` | no |
| <a name="input_restore_to_point_in_time"></a> [restore_to_point_in_time](#input\_restore_to_point_in_time) | Restore to a point in time (MySQL is NOT supported) | `map(string)` | `null` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc_id](#input\_vpc_id) | VPC ID | `string` | n/a | yes |
| <a name="input_cidr_blocks"></a> [cidr_blocks](#input\_cidr_blocks) | List of CIDR blocks. Cannot be specified with source_security_group_id or self | `list(string)` | `[]` | no |
| <a name="input_security_group_blocks"></a> [security_group_blocks](#input\_security_group_blocks) | Security group id to allow access to/from, depending on the type | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the bucket | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="db_endpoint"></a> [db\_endpoint](#output\_db\_endpoint) | Endpoint to connect to database __domain:port__. |
| <a name="db_arn"></a> [db\_arn](#output\_db\_arn) | The ARN of the RDS instance __domain:port__. |
<!-- END_TF_DOCS -->
