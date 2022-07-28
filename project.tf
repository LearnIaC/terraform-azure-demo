resource "azuredevops_project" "fullstack_app" {
  name               = "FullstackDemoApp"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Managed by Terraform"
  features = {
    "testplans" = "disabled"
    "artifacts" = "disabled"
  }
}

resource "azuredevops_serviceendpoint_azurerm" "azure_service_connection" {
  project_id            = azuredevops_project.fullstack_app.id
  service_endpoint_name = "Example AzureRM"
  description           = "Managed by Terraform"
  credentials {
    serviceprincipalid  = var.azure_sp_client_id
    serviceprincipalkey = var.azure_sp_client_secret
  }
  azurerm_spn_tenantid      = var.azure_tenant_id
  azurerm_subscription_id   = var.azure_subscription_id
  azurerm_subscription_name = "Azure subscription 1"
}

resource "azuredevops_git_repository" "backend-repository" {
  project_id = azuredevops_project.fullstack_app.id
  name       = "DotnetBackendApp"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "frontend-repository" {
  project_id = azuredevops_project.fullstack_app.id
  name       = "VueFrontendApp"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_build_definition" "backend-build-definition" {
  project_id = azuredevops_project.fullstack_app.id
  name = "Dotnet Backend Build"
  ci_trigger {
    use_yaml = true
  }
  repository {
    repo_type = "TfsGit"
    repo_id = azuredevops_git_repository.backend-repository.id
    branch_name = azuredevops_git_repository.backend-repository.default_branch
    yml_path = "azure-pipelines.yml"
  }
}