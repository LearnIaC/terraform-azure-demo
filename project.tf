resource "azuredevops_project" "vue_app_ci_demo" {
  name               = "VueAppCIDemo"
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
  project_id            = azuredevops_project.vue_app_ci_demo.id
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

resource "azuredevops_git_repository" "vue_tf_demo_repo" {
  project_id = azuredevops_project.vue_app_ci_demo.id
  name       = "vue-tf-demo-app"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_build_definition" "vue_tf_demo_build" {
  project_id = azuredevops_project.vue_app_ci_demo.id
  name = "Vue Terraform Demo Build"
  ci_trigger {
    use_yaml = true
  }
  repository {
    repo_type = "TfsGit"
    repo_id = azuredevops_git_repository.vue_tf_demo_repo.id
    branch_name = azuredevops_git_repository.vue_tf_demo_repo.default_branch
    yml_path = "azure-pipelines.yml"
  }
}