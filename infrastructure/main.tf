module "s3" {
  source = "./modules/s3"

  api_staging_bucket  = var.api_staging_bucket
  api_terraform_state = var.api_staging_bucket

  tags = var.tags

}

module "k8s" {
  source = "./modules/eks"

  python_webserver_image = var.python_webserver_image
  python_webserver_deployment_labels_run = module.k8s.kubernetes_deployment_python_webserver_metadata_name
  s3_policy_arn   = module.s3.s3_upload_policy_arn

}
