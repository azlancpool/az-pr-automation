#!/bin/bash

# Debug: Print the PAT (optional, for debugging only)
echo "PAT: $AZURE_DEVOPS_EXT_PAT"

# Authenticate with Azure DevOps using a Personal Access Token (PAT)
# More info about AZURE Personal Access Token: https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows
echo "Logging into Azure DevOps..."
cat my_pat_token.txt | az devops login --organization https://dev.azure.com/myOrganizationName


# Set default organization and project
az devops configure --defaults organization=https://dev.azure.com/myOrganizationName project=myProjectName

# Create a Pull Request
echo "Creating Pull Request..."
az repos pr create \
    --title "$(head -n 1 commit_message.txt)" \
    --description "$(cat commit_message.txt)" \
    --source-branch my-branch-name \
    --target-branch master \
    --repository my_repo_name \
    --work-items "some_work_item_ID"

echo "Pull Request created successfully!"