# Use the latest Ubuntu image
FROM ubuntu:latest

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y openssh-server sudo

# Create a user with sudo privileges and set a password
RUN useradd -m -s /bin/bash user && echo "user:admin" | chpasswd && adduser user sudo

# Configure SSH to allow password authentication and permit root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Start the SSH service
CMD ["/usr/sbin/sshd", "-D"]
