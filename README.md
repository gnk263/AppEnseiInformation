# AppEnseiInformation

## Python

```bash
pipenv install
```

## Create S3 Bucket & IAM User & IAM Role

```bash
ENV=dev make prepare
```

## Get IAM Role ARN

```bash
ENV=dev make describe-prepare
```

## Create Access Key

```bash
ENV=dev make create-access-key
```

## CircleCI Environment

* AWS_ACCESS_KEY_ID_DEV
* AWS_ACCESS_KEY_ID_PROD
* AWS_SECRET_ACCESS_KEY_DEV
* AWS_SECRET_ACCESS_KEY_PROD
* AWS_DEPLOY_IAM_ROLE_ARN_DEV
* AWS_DEPLOY_IAM_ROLE_ARN_PROD
* AWS_DEPLOY_IAM_ROLE_EXTERNAL_ID_DEV
* AWS_DEPLOY_IAM_ROLE_EXTERNAL_ID_PROD
* AWS_DEFAULT_REGION
* AWS_DEFAULT_OUTPUT

