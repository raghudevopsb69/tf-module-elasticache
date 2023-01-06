resource "aws_elasticache_subnet_group" "elasticache" {
  name       = "${var.env}-elasticache"
  subnet_ids = local.app_subnets_ids

  tags = {
    Name = "${var.env}-elasticache"
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id      = "${var.env}-elasticache"
  engine          = var.engine
  node_type       = var.node_type
  num_cache_nodes = var.num_cache_nodes
  engine_version  = var.engine_version
  port            = 6379
  az_mode         = var.az_mode
}



