locals {
  environment_variables = [
    {
      name : "TF_IN_AUTOMATION",
      type : "PLAINTEXT",
      value : "true"
    },
    {
      name : "TF_STATE_REGION"
      type : "PLAINTEXT",
      value : "ca-central-1"
    },
    {
      name : "TF_STATE_BUCKET",
      type : "PLAINTEXT",
      value : var.artifacts_store
    },
    {
      name : "TF_ENVIRONMENT",
      type : "PLAINTEXT",
      value : true
    },
  ]
}