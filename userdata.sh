#!/bin/bash
# Log all user data execution output
exec > /var/log/user-data.log 2>&1
dnf update -y
# Install Nginx
dnf install nginx -y

# Enable Nginx to start automatically after reboot
systemctl enable nginx

# Start Nginx
systemctl start nginx

# Create a custom website
cat <<'EOF' > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>AWS EC2 Web Server</title>
</head>
<body>
    <h1>Welcome to My AWS EC2 Project!</h1>
    <p>Nginx successfully installed using Terraform User Data.</p>
    <p>Infrastructure automated with AWS and Terraform.</p>
</body>
</html>
EOF
