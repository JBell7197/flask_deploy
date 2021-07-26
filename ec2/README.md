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

Get Flaskr box IP from flaskr-deploy-1 outputs
```zsh
aws cloudformation describe-stacks --stack-name flaskr-deploy-1
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