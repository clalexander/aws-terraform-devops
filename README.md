# AWS Terraform Devops

DevOps scripts and GitHub Actions for AWS Terraform

## GitHub Actions

### Terraform

- [Terraform Setup](github-actions/terraform-setup/README.md) - Setup Terraform for use in actions
- [Terrfaform Validate](github-actions/terraform-validate/README.md) - Validate the Terraform configuration
- [Terraform Apply](github-actions/terraform-apply/README.md) - Apply the Terraform configuration
- [Terraform Destroy](github-actions/terraform-destroy/README.md) - Destroy the Terraform configuration
- [Terraform Variables Autoload](github-actions/terraform-vars-autoload/README.md) - Automatically add Terraform variables from the GitHub `vars` and `secrets` contexts to the environment
- [Terraform Output](github-actions/terraform-output/README.md) - Get the Terraform output values

### Miscellaneous

- [Get Version Tag](github-actions/get-version-tag/README.md) - Get the version tag from the repository

## Bin Scripts

### Setup

Add the `bin` directory to your path.

```bash
export PATH=$PATH:/path/to/aws-terraform-devops/bin
```

### `calogin`

```
Wraps the aws codeartifact login command to allow for environment variables

Usage: calogin [options]

Options:
  [-d | --domain] <domain>          The domain to use for the login
                                    (Or use CODEARTIFACT_DOMAIN environment variable)
  [-n | --namespace] <namespace>    The namespace to use for the login
                                    (Or use CODEARTIFACT_NAMESPACE environment variable)
  [-R | --repository] <repository>  The repository to use for the login
                                    (Or use CODEARTIFACT_REPOSITORY environment variable)
  [-r | --region] <region>          The AWS region to use for the login, must
                                    be a valid AWS region
                                    (Or use CODEARTIFACT_REGION environment variable)
  [-t | --tool] <tool>              The tool to use for the login, must be a
                                    valid aws codeartifact tool
                                    (Or use CODEARTIFACT_TOOL environment variable)
  [-p | --profile] <profile>        The AWS profile to use for the login
                                    (Or use CODEARTIFACT_PROFILE environment variable)

  [-h | --help]                     Show this help message
```

### `tf`

```
Wraps the terraform command to allow for environment variables

See tfprovidervars and tfkey for environment variables

Usage: tf <command> [options]

Command: The terraform command to run

Dependencies: tfprovidervars, tfkey

Options:
  [-h | --help]                     Show this help message
```

### `tfkey`

```
Creates a Terraform state key for the given account, application, baseline, and environment using environment variables in the format:

aws/<environment>/<account>/application|baseline/<application|baseline>

Example key: aws/dev/123456789012/application/myapp

Usage: tfkey [options]

Environment variables:
  AWS_ACCOUNT         The AWS account number (required)
  TFKEY_ENVIRONMENT   The environment name (required)
  TFKEY_APPLICATION   The application name (required if TFKEY_BASELINE is not set)
  TFKEY_BASELINE      The baseline name (required if TFKEY_APPLICATION is not set)

Options:
  [-h | --help]       Show this help message
```

### `tfprovidervars`

```
Sets up remote state and provider variables for Terraform using environment variables

Usage: tfprovidervars [options]

Environment variables:
  AWS_ACCESS_KEY_ID             The AWS access key id (required)
  AWS_SECRET_ACCESS_KEY         The AWS secret access key (required)
  AWS_REGION                    The AWS region (required)
  AWS_DEFAULT_REGION            The AWS default region (optional, provides
                                default for AWS_REGION)
  AWS_PROFILE                   The AWS profile to use for access (optional,
                                provides AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY,
                                and AWS_REGION)

  REMOTE_STATE_ACCESS_KEY       The AWS access key id for the remote state (required)
  REMOTE_STATE_SECRET_KEY       The AWS secret access key for the remote state (required)
  REMOTE_STATE_REGION           The AWS region for the remote state (required)
  REMOTE_STATE_DEFAULT_REGION   The AWS default region for the remote state (optional,
                                provides default for REMOTE_STATE_REGION)
  REMOTE_STATE_PROFILE          The AWS profile to use for the remote state access
                                (optional, provides REMOTE_STATE_ACCESS_KEY,
                                REMOTE_STATE_SECRET_KEY, and REMOTE_STATE_REGION)
  REMOTE_STATE_BUCKET           The S3 bucket for the remote state (required)
  REMOTE_STATE_LOCK_TABLE       The DynamoDB table for the remote state lock (required)

Dependencies: tfkey

Options:
  [-h | --help]       Show this help message
```

## To Do

- [ ] Update Terraform actions
  - [ ] Generalize inputs for multiple providers/backends
  - [ ] Generalize for multiple remote state key patterns


# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
