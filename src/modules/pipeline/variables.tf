variable "name" {
  type        = string
  description = "The name of the CodePipeline executor"
}

variable "artifacts_store" {
  type        = string
  description = "The S3 bucket where AWS CodePipeline stores artifacts for the pipeline."
}

variable "source_bucket" {
  type        = string
  description = "The S3 bucket where AWS CodePipeline stores artifacts for the pipeline."
}

variable "codebuild" {
  type = object({
    plan = object({
      arn  = string
      logs = string
    })
    apply = object({
      arn  = string
      logs = string
    })
  })
  description = "CodeBuild executors for the Terraform components"
}
