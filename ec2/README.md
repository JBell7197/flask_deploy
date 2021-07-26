# Deploying Flaskr in AWS EC2

Prerequisites
1. Install AWS CLI
1. Configure AWS Access and Secret Keys

Create S3 Bucket
```zsh
aws s3api create-bucket --bucket [BUCKET NAME]
```

Upload Flaskr Cloudformation template to S3 bucket
```zsh
aws s3 cp flaskr.template.yaml s3://[BUCKET-NAME]
```

Create Flaskr stack
```zsh
aws cloudformation create-stack --stack-name flaskr-deploy-1 https://[BUCKET-NAME].s3.[REGION].amazonaws.com/flaskr.template.yaml --parameters file://flaskr_template_parameters.json
```

Watch Flaskr stack creation progress
```zsh
watch aws cloudformation describe-stack-events --stack-name flaskr-deploy-1
```

Get Flaskr box IP
```zsh
aws cloudformation describe-stacks --stack-name flaskr-deploy-1 | grep -A1 PublicIP
```

Upload Flaskr install script to Flaskr box
```zsh
scp -i [PATH TO KEY] install_flaskr.sh ec2-user@[FLASKR BOX IP]:~
install_flaskr.sh
```

SSH into Flaskr box
```zsh
ssh -i [PATH TO KEY] ec2-user@[FLASKR BOX IP]
```

Install Flaskr
```zsh
chmod +x install_flaskr.sh
./install_flaskr.sh
```

Access Flaskr in browser
```
[FLASKR BOX IP]:5000
```

Destroy Flaskr Stack
```zsh
aws cloudformation delete-stack --stack-name flaskr-deploy-1
```