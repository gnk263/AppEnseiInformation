#!/usr/bin/env bash
 
set -xeuo pipefail
 
aws_sts_credentials="$(aws sts assume-role \
  --role-arn "$AWS_DEPLOY_IAM_ROLE_ARN" \
  --role-session-name "$ROLE_SESSION_NAME" \
  --external-id "$AWS_DEPLOY_IAM_ROLE_EXTERNAL_ID" \
  --duration-seconds 900 \
  --query "Credentials" \
  --output "json")"
 
cat <<EOT > "aws-env.sh"
export AWS_ACCESS_KEY_ID="$(echo $aws_sts_credentials | jq -r '.AccessKeyId')"
export AWS_SECRET_ACCESS_KEY="$(echo $aws_sts_credentials | jq -r '.SecretAccessKey')"
export AWS_SESSION_TOKEN="$(echo $aws_sts_credentials | jq -r '.SessionToken')"
EOT
