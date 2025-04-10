# Use the official Azure CLI image as the base
FROM mcr.microsoft.com/azure-cli:latest


# Install Azure DevOps extension
RUN az extension add --name azure-devops

# Set the working directory
WORKDIR /workspace

# Copy any scripts or files you need into the container
COPY . .

# Set the entrypoint or command to run your script
ENTRYPOINT ["bash", "create-pr.sh"]