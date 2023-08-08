resource "random_id" "snapshot_identifier" {
  count = !var.skip_final_snapshot ? 1 : 0

  keepers = {
    id = var.identifier
  }

  byte_length = 16
}

resource "aws_db_instance" "this" {
  identifier        = local.identifier
  identifier_prefix = local.identifier_prefix

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id

  db_name  = var.db_name
  username = var.username
  password = var.password
  port     = var.port

  vpc_security_group_ids = [aws_security_group.this.id]
  parameter_group_name   = var.parameter_group_name

  publicly_accessible = var.publicly_accessible
  apply_immediately   = var.apply_immediately
  maintenance_window  = var.maintenance_window

  snapshot_identifier       = var.snapshot_identifier
  copy_tags_to_snapshot     = var.copy_tags_to_snapshot
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.final_snapshot_identifier_prefix

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null
  performance_insights_kms_key_id       = var.performance_insights_enabled ? var.performance_insights_kms_key_id : null

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  max_allocated_storage   = var.max_allocated_storage

  deletion_protection      = var.deletion_protection
  delete_automated_backups = var.delete_automated_backups

  dynamic "restore_to_point_in_time" {
    for_each = var.restore_to_point_in_time != null ? [var.restore_to_point_in_time] : []

    content {
      restore_time                  = lookup(restore_to_point_in_time.value, "restore_time", null)
      source_db_instance_identifier = lookup(restore_to_point_in_time.value, "source_db_instance_identifier", null)
      source_dbi_resource_id        = lookup(restore_to_point_in_time.value, "source_dbi_resource_id", null)
      use_latest_restorable_time    = lookup(restore_to_point_in_time.value, "use_latest_restorable_time", null)
    }
  }

  timeouts {
    create = lookup(var.timeouts, "create", null)
    delete = lookup(var.timeouts, "delete", null)
    update = lookup(var.timeouts, "update", null)
  }

  tags = merge(var.tags, { Terraform = "true" })
}
