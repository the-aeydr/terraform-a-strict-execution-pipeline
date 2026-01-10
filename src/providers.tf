provider "aws" {
  region = "ca-central-1"

  default_tags {
    tags = {
      "acme-service" = "Terraform Pipelines"
      "acme-vendor"  = "jrbeverly"
      "acme-url"     = "https://github.com/jrbeverly/terraform-aws-codepipeline-terraform-runner"
    }
  }
}