aws ec2 create-security-group --group-name MyWebSG --description "Allow HTTP and SSH"

aws ec2 authorize-security-group-ingress --group-name MyWebSG --protocol tcp --port 22 --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress --group-name MyWebSG --protocol tcp --port 80 --cidr 0.0.0.0/0
