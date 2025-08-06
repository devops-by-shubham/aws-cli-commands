# AWS CLI Commands Repository 🚀

A comprehensive collection of AWS CLI commands, scripts, and best practices for developers and DevOps engineers at all skill levels.

## 📖 Table of Contents

- [Quick Start](#quick-start)
- [Repository Structure](#repository-structure)
- [Installation](#installation)
- [Basic Usage](#basic-usage)
- [Contributing](#contributing)
- [License](#license)

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/aws-cli-commands.git
cd aws-cli-commands

# Run the setup script
chmod +x quick-setup.sh
./quick-setup.sh

# Start with basics
cat basics/common-commands.md
```

## 📁 Repository Structure

```
aws-cli-commands/
├── basics/                 # Entry-level commands and concepts
├── services/              # Service-specific scripts and commands
├── automation/            # Advanced automation scripts
├── utils/                 # Utility scripts and helpers
├── scenarios/             # Real-world use cases
├── best-practices/        # Guidelines and recommendations
├── templates/             # Configuration templates
├── troubleshooting/       # Common issues and solutions
├── integrations/          # CI/CD and tool integrations
├── learning/              # Exercises and challenges
└── versions/              # Version-specific information
```

## 🛠 Installation

### Prerequisites
- AWS CLI v2 (recommended)
- Valid AWS credentials configured
- Bash/Zsh shell (for scripts)

### Quick Installation
```bash
# Install AWS CLI v2 (macOS)
brew install awscli

# Install AWS CLI v2 (Linux)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Configure AWS credentials
aws configure
```

## 💡 Basic Usage

### Essential Commands
```bash
# Check AWS CLI version
aws --version

# List all S3 buckets
aws s3 ls

# Describe EC2 instances
aws ec2 describe-instances

# Get current AWS identity
aws sts get-caller-identity
```

### Profile Management
```bash
# Create a new profile
aws configure --profile myprofile

# Use specific profile
aws s3 ls --profile myprofile

# Set default profile
export AWS_PROFILE=myprofile
```

## 📚 Learning Path

### 🟢 Beginner (Start Here)
1. [Setup and Configuration](basics/setup-and-config.md)
2. [Common Commands](basics/common-commands.md)
3. [Basic S3 Operations](basics/basic-s3-operations.sh)
4. [Basic EC2 Operations](basics/basic-ec2-operations.sh)

### 🟡 Intermediate
1. [Service-Specific Scripts](services/)
2. [Automation Basics](automation/)
3. [Real-World Scenarios](scenarios/)
4. [Best Practices](best-practices/)

### 🔴 Advanced
1. [Advanced Automation](automation/)
2. [CI/CD Integration](integrations/)
3. [Complex Scenarios](scenarios/)
4. [Performance Optimization](best-practices/performance-optimization.md)

## 🎯 Popular Use Cases

| Use Case | Script Location | Difficulty |
|----------|----------------|------------|
| S3 Backup Automation | `services/s3-sync-backup.sh` | 🟢 |
| EC2 Instance Management | `services/ec2-instance-management.sh` | 🟡 |
| Multi-Region Operations | `automation/multi-region-operations.sh` | 🔴 |
| Cost Optimization | `automation/cost-optimization-scripts.sh` | 🟡 |
| Disaster Recovery | `automation/disaster-recovery-setup.sh` | 🔴 |

## ⚡ Quick Examples

### S3 Operations
```bash
# Sync local directory to S3
aws s3 sync ./local-folder s3://your-bucket/folder/

# Copy with server-side encryption
aws s3 cp file.txt s3://your-bucket/ --sse AES256

# List objects with human-readable sizes
aws s3 ls s3://your-bucket --recursive --human-readable
```

### EC2 Operations
```bash
# Start an instance
aws ec2 start-instances --instance-ids i-1234567890abcdef0

# Get instance public IP
aws ec2 describe-instances --instance-ids i-1234567890abcdef0 \
  --query 'Reservations[0].Instances[0].PublicIpAddress' --output text

# Create a snapshot
aws ec2 create-snapshot --volume-id vol-1234567890abcdef0 \
  --description "Backup $(date +%Y-%m-%d)"
```

### IAM Operations
```bash
# List users
aws iam list-users --output table

# Create a new user
aws iam create-user --user-name newuser

# Attach policy to user
aws iam attach-user-policy --user-name newuser \
  --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess
```

## 🔧 Utility Scripts

- **Profile Switcher**: `utils/aws-profile-switcher.sh`
- **Resource Cleanup**: `utils/resource-cleanup.sh`
- **Credential Rotation**: `utils/credential-rotation.sh`
- **Parallel Operations**: `utils/parallel-operations.sh`

## 🚨 Safety First

⚠️ **Important Reminders:**
- Always test scripts in a development environment first
- Use `--dry-run` flag when available
- Keep credentials secure and never commit them
- Review IAM permissions regularly
- Enable CloudTrail for auditing

## 📞 Support & Community

- 🐛 [Report Issues](https://github.com/yourusername/aws-cli-commands/issues)
- 💡 [Request Features](https://github.com/yourusername/aws-cli-commands/issues)
- 📖 [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)
- 💬 [AWS CLI GitHub](https://github.com/aws/aws-cli)

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Quick Contribution Steps
1. Fork the repository
2. Create a feature branch
3. Add your scripts/documentation
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

⭐ **Star this repository** if you find it helpful!

**Happy Cloud Computing!** ☁️
