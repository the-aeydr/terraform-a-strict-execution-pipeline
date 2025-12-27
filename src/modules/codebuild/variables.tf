variable "name" {
  type        = string
  description = "The name of the CodeBuild executor"
}

variable "build_timeout" {
  type        = string
  description = "How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out any related build that does not get marked as completed. The default is 30 minutes."
  default     = "30"
}

variable "artifacts_store" {
  type        = string
  description = "The S3 bucket where AWS CodePipeline stores artifacts for the pipeline."
}

variable "image" {
  type    = string
  default = "ubuntu:latest"
}

variable "compute_type" {
  type        = string
  description = "Information about the compute resources the build project will use."
  default     = "BUILD_GENERAL1_SMALL"
}

variable "buildspec" {
  type = string
}