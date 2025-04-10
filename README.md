# AZ PR Automation

[![Docker](https://img.shields.io/badge/Docker-Enabled-success)](https://www.docker.com/)
[![Azure CLI](https://img.shields.io/badge/Azure%20CLI-Required-blue)](https://docs.microsoft.com/en-us/cli/azure/)
[![Bash](https://img.shields.io/badge/Bash-Scripting-yellow)](https://www.gnu.org/software/bash/)

A Dockerized solution to automate Pull Request creation in Azure DevOps repositories using Bash and Azure CLI.

## Features

- Automated PR creation with customizable templates
- Docker container for easy execution
- Configurable via environment variables
- Supports PR title, description, reviewers, and work item association
- Bash scripts for easy integration with CI/CD pipelines

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) installed
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed (for local testing)
- Azure DevOps PAT (Personal Access Token) with code read/write permissions

## Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/azlancpool/az-pr-automation.git
   cd az-pr-automation

2. Build the Docker image:
   ```bash
   docker build -t az-pr-automation .

## Configuration
1. Configure Azure Personal Access Token: You just need to set your PAT in the file [my_pat_token.txt](my_pat_token.txt).

2. Configure repository info: In order to make the necessary configurations, the [create-pr.sh](create-pr.sh) file must be modified to define the repository, project, source branch and so on.

3. Configure PR information: On the other hand, you can also modify the content of the [commit-message.txt](commit-message.txt) file in order to obtain the information associated with the PR title and description.

## Usage Example
You just need to run:
   ```bash
   docker run -e AZURE_DEVOPS_PAT="$(echo my_pat_token.txt)" az-pr-automation

## CI/CD Integration
This tool can be easily integrated into your CI/CD pipeline. Here's an example for Azure DevOps::
   ```yaml
   steps:
    - task: Docker@2
      inputs:
        containerRegistry: 'your-registry'
        repository: 'az-pr-automation'
        command: 'run'
        arguments: '-e AZURE_DEVOPS_PAT="$(PAT_TOKEN)"'
                    az-pr-automation
   ```

## Contributing
Contributions are welcome! Please open an issue or PR for any improvements.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for.

