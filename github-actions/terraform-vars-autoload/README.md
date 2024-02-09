# Terraform Variables Autoload

The `terraform-vars-autoload` action is used to automatically add Terraform variables from the GitHub `vars` and `secrets` contexts to the environment.

## Usage

```yaml
- uses: clalexander/aws-terraform-devops/github-actions/terraform-vars-autoload@v1
  with:
    # The GitHub vars context to use for Terraform variables, must be a JSON string
    # Ex: vars: ${{ toJSON(vars) }}
    # Default: ''
    vars: ''
    
    # The GitHub secrets context to use for Terraform variables, must be a JSON string
    # Ex: secrets: ${{ toJSON(secrets) }}
    # Default: ''
    secrets: ''
    
    # The prefix to use to filter the Terraform variables from the GitHub vars and secrets contexts
    # Default: 'TF_VAR_'
    prefix: ''
```
