# EC2 Instance Setup  

This README provides a comprehensive guide to setting up an EC2 instance on Amazon Web Services (AWS), configuring it, and performing additional tasks such as retrieving instance metadata and setting up a basic web server.

## Steps

### 1. Launch an EC2 Instance
- Log in to the [Amazon EC2 Management Console](https://console.aws.amazon.com/ec2/).
- Click on "Launch Instance".
- Choose the `Amazon Linux AMI`.
- Select the `t2.micro` instance type (eligible for the free tier).
- Configure the instance to launch in the `default` VPC with a public IP address.
- Add a tag with Key: `Name` and Value: `EC2-Instance`.
- Configure security group `meta-sg` to allow SSH (port 22) and HTTP (port 80) traffic.

### 2. Configure Security Group
- Create a security group named `meta-sg`.
- Allow inbound traffic for SSH (port 22) and HTTP (port 80).

### 3. Launch the Instance
- Review and launch the instance.

### 4. Key Pair
- Create or select an existing key pair (e.g., `meta-key`) to connect to the instance securely via SSH.

### 5. Connect to the Instance
- Connect to the instance via SSH using the public IP address and the key pair (`meta-key.pem`):
  ```bash
  ssh -i "meta-key.pem" ec2-user@<public-ip-address>

### 6. Retrieve Instance Metadata
- Fetch the instance metadata and save it to a file named data.txt in the home directory:
 ```bash
curl http://169.254.169.254/latest/meta-data/ > ~/data.txt
```
### 7. Create a Simple Web Page
- Create an HTML file (index.html) in the document root (/var/www/html/) to display a basic webpage:
```bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
echo "<h1>Welcome to kaobi Website from $HOSTNAME</h1>" | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
echo "<!DOCTYPE html> <html> <body style=\"background-color:rgb(250, 210, 210);\"> <h1>Welcome to kaobi Website from $HOSTNAME!</h1> <p>Ec2 Demo</p> <p>Application Version: V1</p> </body></html>" | sudo tee /var/www/html/app1/index.html




