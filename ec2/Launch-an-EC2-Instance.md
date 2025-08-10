# AWS EC2 - Common Real Use Case Scenarios with AWS CLI

---

## 1. Launch an EC2 Instance

**Use case:** Spin up a new EC2 instance using a specific AMI, instance type, and key pair.

```bash
aws ec2 run-instances \
    --image-id ami-0abcdef1234567890 \
    --count 1 \
    --instance-type t2.micro \
    --key-name MyKeyPair \
    --security-group-ids sg-0abc12345def67890 \
    --subnet-id subnet-0ab1c2d3e4f567890 \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MyTestInstance}]'
