BASE_STACK_NAME := App-Ensei-Information

prepare:
	aws cloudformation deploy \
		--template-file template/prepare.yaml \
		--stack-name $(BASE_STACK_NAME)-Prepare-${ENV} \
		--capabilities CAPABILITY_NAMED_IAM \
		--parameter-overrides Env=${ENV}

describe-prepare:
	aws cloudformation describe-stacks \
		--stack-name $(BASE_STACK_NAME)-Prepare-${ENV} \
		--query 'Stacks[].Outputs'

test-json:
	python -m pytest test/

create-access-key:
	aws iam create-access-key \
		--user-name app-ensei-information-deploy-user-${ENV}

deploy:
	aws s3api put-object \
		--bucket app-ensei-information-${ENV} \
		--key information.json \
		--body json/information.json \
		--content-type application/json \
		--acl public-read
