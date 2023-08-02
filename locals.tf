locals {
  identifier                = var.use_identifier_prefix ? null : var.identifier
  identifier_prefix         = var.use_identifier_prefix ? "${var.identifier}-" : null
  final_snapshot_identifier = !var.skip_final_snapshot ? "${var.final_snapshot_identifier_prefix}-${var.identifier}-${try(random_id.snapshot_identifier[0].hex, "")}" : null
}
