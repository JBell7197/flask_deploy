# Deploying Flaskr in AWS EC2

Prerequisites
1. Install AWS CLI
1. Configure AWS Access and Secret Keys

Create EC2 instance
```zsh
aws cloudformation create-stack --stack-name flaskr-deploy-1 --template-url file://flaskr.template.yaml --parameters file://flaskr_template_parameters.json
```

Delete EC2 instance (if necessary)
```zsh
aws cloudformation delete-stack --stack-name flaskr-deploy-1
```