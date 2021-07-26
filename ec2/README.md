# Deploying Flaskr in AWS EC2

Create EC2 instance
```zsh
aws cloudformation create-stack --stack-name flaskr-deploy-1 --template-url file://ec2_flask_tutorial.yaml --parameters file://parameters.json
```

Delete EC2 instance (if necessary)
```zsh
aws cloudformation delete-stack --stack-name flaskr-deploy-1
```