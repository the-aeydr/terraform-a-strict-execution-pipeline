# Terraform AWS CodePipline Terraform Executor

Terraform executor leveraging the CodePipeline functionality in AWS, for a fully serverless model of executing terraform in AWS.

## Getting Started

The primary environment is configured in `env/`, with a single main file. This provisions the CodePipeline, CodeBuild components, as well as some stub S3 buckets that represent both incoming sources, artifacts. The artifacts bucket is treated as a stand-in for the Terraform state environment variable, but the pipeline itself does not attempt to configure the backend for S3.

## Notes

This likely is only really suited to simple pipelines, as it seems clunky to work with. Although the AWS built-in option can be beneficial, this doesn't really make Terraform an appealing option, and instead makes more sense to leverage something like CloudFormation. Cases where this might need more strict access controls, or the ability to have appropriate guardrails seems like it wouldn't work out long term.

Notes:

- Simple triggers work off the arrival of notifications in Cloudwatch for S3 publishes
- Can have a single file act as the sort of "GitOps" authoritative state for the infrastructure
- Multi-component terraform deploys (e.g. terragrunt) are possilbe, but feel like they wouldn't fit well with the system
- Terraform for configuring the build pipeline doesn't feel ideal, as opposed to a more "configuration" based management option like GitHub Actions / Gitlab CI
- S3 Storage (& dynamodb locking table) should be provisioned externally from the primary provision terraform

Not really sure about this one, as I feel CloudFormation is a better option for that "AWS built-in" approach, or using an external service responsible for the terraform executor.

