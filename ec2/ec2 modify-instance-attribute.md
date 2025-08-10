aws ec2 stop-instances --instance-ids i-0123456789abcdef0

aws ec2 modify-instance-attribute --instance-id i-0123456789abcdef0 --instance-type "{\"Value\": \"t3.medium\"}"

aws ec2 start-instances --instance-ids i-0123456789abcdef0
