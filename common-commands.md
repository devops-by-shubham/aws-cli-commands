# Common AWS CLI Commands

This guide covers the most frequently used AWS CLI commands across different services. Perfect for beginners and as a quick reference.

## 📋 Table of Contents
- [General Commands](#general-commands)
- [S3 Commands](#s3-commands)
- [EC2 Commands](#ec2-commands)
- [IAM Commands](#iam-commands)
- [Lambda Commands](#lambda-commands)
- [CloudFormation Commands](#cloudformation-commands)
- [RDS Commands](#rds-commands)
- [CloudWatch Commands](#cloudwatch-commands)
- [Output Formatting](#output-formatting)

## 🌐 General Commands

### Check AWS CLI Version
```bash
aws --version
```

### Get Current AWS Identity
```bash
aws sts get-caller-identity
```

### List Available Profiles
```bash
aws configure list-profiles
```

### Switch Profiles
```bash
aws configure --profile myprofile
export AWS_PROFILE=myprofile
```

### Get Help
```bash
aws help                    # General help
aws s3 help                 # Service help  
aws s3 cp help             # Command help
```

## 🪣 S3 Commands

### List Buckets
```bash
aws s3 ls
```

### List Objects in Bucket
```bash
aws s3 ls s3://bucket-name/
aws s3 ls s3://bucket-name/folder/ --recursive
aws s3 ls s3://bucket-name/ --human-readable --summarize
```

### Copy Files
```bash
# Upload file to S3
aws s3 cp file.txt s3://bucket-name/

# Download file from S3
aws s3 cp s3://bucket-name/file.txt ./

# Copy between S3 locations
aws s3 cp s3://source-bucket/file.txt s3://dest-bucket/
```

### Sync Directories
```bash
# Upload directory to S3
aws s3 sync ./local-folder s3://bucket-name/folder/

# Download S3 folder to local
aws s3 sync s3://bucket-name/folder/ ./local-folder

# Sync with delete (removes files not in source)
aws s3 sync ./local-folder s3://bucket-name/folder/ --delete
```

### Remove Objects
```bash
# Remove single file
aws s3 rm s3://bucket-name/file.txt

# Remove all objects in folder
aws s3 rm s3://bucket-name/folder/ --recursive
```

### Create and Delete Buckets
```bash
# Create bucket
aws s3 mb s3://new-bucket-name

# Delete bucket (must be empty)
aws s3 rb s3://bucket-name
aws s3 rb s3://bucket-name --force  # Remove bucket and all contents
```

## 🖥️ EC2 Commands

### List Instances
```bash
# Basic list
aws ec2 describe-instances

# Running instances only
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"

# Formatted table view
aws ec2 describe-instances --output table \
  --query 'Reservations[].Instances[].{ID:InstanceId,Type:InstanceType,State:State.Name,IP:PublicIpAddress}'
```

### Start/Stop Instances
```bash
# Start instance
aws ec2 start-instances --instance-ids i-1234567890abcdef0

# Stop instance
aws ec2 stop-instances --instance-ids i-1234567890abcdef0

# Reboot instance
aws ec2 reboot-instances --instance-ids i-1234567890abcdef0

# Terminate instance
aws ec2 terminate-instances --instance-ids i-1234567890abcdef0
```

### Launch New Instance
```bash
aws ec2 run-instances \
  --image-id ami-0abcdef1234567890 \
  --instance-type t3.micro \
  --key-name my-key-pair \
  --security-group-ids sg-903004f8 \
  --count 1
```

### Key Pairs
```bash
# List key pairs
aws ec2 describe-key-pairs

# Create key pair
aws ec2 create-key-pair --key-name MyKeyPair --output text --query 'KeyMaterial' > MyKeyPair.pem
chmod 400 MyKeyPair.pem

# Delete key pair
aws ec2 delete-key-pair --key-name MyKeyPair
```

### Security Groups
```bash
# List security groups
aws ec2 describe-security-groups

# Create security group
aws ec2 create-security-group --group-name my-sg --description "My security group"

# Add rule to security group
aws ec2 authorize-security-group-ingress \
  --group-id sg-903004f8 \
  --protocol tcp \
  --port 22 \
  --cidr 0.0.0.0/0
```

### EBS Snapshots
```bash
# List snapshots
aws ec2 describe-snapshots --owner-ids self

# Create snapshot
aws ec2 create-snapshot --volume-id vol-1234567890abcdef0 --description "My snapshot"

# Delete snapshot
aws ec2 delete-snapshot --snapshot-id snap-1234567890abcdef0
```

## 👤 IAM Commands

### Users
```bash
# List users
aws iam list-users
aws iam list-users --output table

# Get current user
aws iam get-user

# Create user
aws iam create-user --user-name newuser

# Delete user
aws iam delete-user --user-name username
```

### Groups
```bash
# List groups
aws iam list-groups

# Create group
aws iam create-group --group-name developers

# Add user to group
aws iam add-user-to-group --user-name newuser --group-name developers
```

### Policies
```bash
# List policies
aws iam list-policies --scope Local

# Attach policy to user
aws iam attach-user-policy \
  --user-name newuser \
  --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

# List attached policies for user
aws iam list-attached-user-policies --user-name newuser
```

### Access Keys
```bash
# Create access key
aws iam create-access-key --user-name newuser

# List access keys
aws iam list-access-keys --user-name newuser

# Delete access key
aws iam delete-access-key --user-name newuser --access-key-id AKIAIOSFODNN7EXAMPLE
```

### Roles
```bash
# List roles
aws iam list-roles

# Get role
aws iam get-role --role-name MyRole

# Create role (requires trust policy document)
aws iam create-role --role-name MyRole --assume-role-policy-document file://trust-policy.json
```

## ⚡ Lambda Commands

### List Functions
```bash
aws lambda list-functions
aws lambda list-functions --output table --query 'Functions[].{Name:FunctionName,Runtime:Runtime}'
```

### Get Function Information
```bash
aws lambda get-function --function-name my-function
aws lambda get-function-configuration --function-name my-function
```

### Invoke Function
```bash
# Synchronous invocation
aws lambda invoke --function-name my-function output.json

# Asynchronous invocation
aws lambda invoke --function-name my-function --invocation-type Event output.json
```

### Update Function Code
```bash
aws lambda update-function-code \
  --function-name my-function \
  --zip-file fileb://function.zip
```

## 📚 CloudFormation Commands

### List Stacks
```bash
aws cloudformation list-stacks
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE
```

### Describe Stack
```bash
aws cloudformation describe-stacks --stack-name my-stack
aws cloudformation describe-stack-resources --stack-name my-stack
```

### Create Stack
```bash
aws cloudformation create-stack \
  --stack-name my-stack \
  --template-body file://template.yaml \
  --parameters ParameterKey=KeyPairName,ParameterValue=MyKey
```

### Update Stack
```bash
aws cloudformation update-stack \
  --stack-name my-stack \
  --template-body file://template.yaml
```

### Delete Stack
```bash
aws cloudformation delete-stack --stack-name my-stack
```

## 🗄️ RDS Commands

### List DB Instances
```bash
aws rds describe-db-instances
aws rds describe-db-instances --output table --query 'DBInstances[].{ID:DBInstanceIdentifier,Engine:Engine,Status:DBInstanceStatus}'
```

### Create DB Instance
```bash
aws rds create-db-instance \
  --db-instance-identifier mydb \
  --db-instance-class db.t3.micro \
  --engine mysql \
  --master-username admin \
  --master-user-password mypassword \
  --allocated-storage 20
```

### Create Snapshot
```bash
aws rds create-db-snapshot \
  --db-instance-identifier mydb \
  --db-snapshot-identifier mydb-snapshot-$(date +%Y%m%d)
```

## 📊 CloudWatch Commands

### List Metrics
```bash
aws cloudwatch list-metrics
aws cloudwatch list-metrics --namespace AWS/EC2
```

### Get Metric Statistics
```bash
aws cloudwatch get-metric-statistics \
  --namespace AWS/EC2 \
  --metric-name CPUUtilization \
  --dimensions Name=InstanceId,Value=i-1234567890abcdef0 \
  --statistics Average \
  --start-time 2023-01-01T00:00:00Z \
  --end-time 2023-01-02T00:00:00Z \
  --period 3600
```

### List Log Groups
```bash
aws logs describe-log-groups
```

### Tail Log Stream
```bash
aws logs tail /aws/lambda/my-function --follow
```

## 📄 Output Formatting

### Output Formats
```bash
# JSON (default)
aws s3 ls --output json

# Table format
aws s3 ls --output table

# Text format
aws s3 ls --output text

# YAML format
aws s3 ls --output yaml
```

### JMESPath Queries
```bash
# Get specific fields
aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId'

# Filter results
aws ec2 describe-instances --query 'Reservations[].Instances[?State.Name==`running`]'

# Format output
aws ec2 describe-instances --query 'Reservations[].Instances[].{ID:InstanceId,State:State.Name}' --output table
```

### Useful Query Examples
```bash
# Get all running EC2 instance IDs
aws ec2 describe-instances \
  --filters "Name=instance-state-name,Values=running" \
  --query 'Reservations[].Instances[].InstanceId' \
  --output text

# Get S3 bucket names only
aws s3api list-buckets --query 'Buckets[].Name' --output text

# Get Lambda function names and runtimes
aws lambda list-functions \
  --query 'Functions[].[FunctionName,Runtime]' \
  --output table
```

## 🔧 Pagination and Limits

### Handle Large Results
```bash
# Use pagination for large results
aws s3api list-objects-v2 --bucket my-bucket --max-items 1000

# Use page-size for better performance
aws ec2 describe-instances --page-size 50

# Get all results with pagination token
aws s3api list-objects-v2 --bucket my-bucket --starting-token <token>
```

## 💡 Pro Tips

1. **Use `--dry-run`** when available to test commands safely
2. **Use `--generate-cli-skeleton`** to create JSON templates
3. **Set `AWS_PAGER=""`** to disable paging
4. **Use profiles** for different environments
5. **Enable auto-completion** with `aws_completer`
6. **Use `--no-cli-pager`** for scripting

## ⚠️ Important Notes

- Always test destructive operations in development first
- Use appropriate IAM permissions (principle of least privilege)
- Keep your AWS credentials secure
- Monitor costs when running commands that create resources
- Use `--confirm` or `--force` flags carefully

This reference covers the most common AWS CLI commands you'll use daily. For more detailed information, use `aws <service> help` or refer to the [AWS CLI documentation](https://docs.aws.amazon.com/cli/).
