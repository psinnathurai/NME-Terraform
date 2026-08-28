# -----------------
# Basics
# -----------------

resource_group_name = "rg-nerdioapplication-sbx-sbx-szn-01"
azuread_app_name = "nerdio-nmw-app-1234"
azure_environment = "AzureCloud" 
subscription_display_name = "My Production Subscription"

location = "switzerlandnorth"
azure_tag_prefix = "NMW"

protect_resources = true

# -----------------
# Application
# -----------------

app_service_plan_sku_name="B3"

app_service_plan_name = "nerdio-plan-1234"
web_app_portal_name   = "nerdio-1234"
logs_law_name = "nerdio-law-1234"
law_name              = "nerdio-law-insights-1234"
app_insights_name     = "nerdio-insights-1234"
automation_account_name = "nerdio-automation-1234"
scripted_action_account_name = "nerdio-scripted-actions-1234"

# -----------------
# Database
# -----------------

sql_server_name = "nerdio-sql-1234"
database_name   = "nerdio-db"
sql_collation   = "SQL_Latin1_General_CP1_CI_AS"
database_max_size_gb = 250
database_sku_name = "S1"

# -----------------
# Storage
# -----------------

key_vault_name = "nerdio-kv-1234"
data_protection_storage_account_name = "dps1234"
data_protection_keys_blob_name = "keys-1234.xml"
data_protection_key_name = "DataProtection-1234"

# -----------------
# Certificate
# -----------------

# Self-signed certificate in Key Vault for Azure AD app authentication
# (used for features that do not support Managed Identity)
app_cert_name            = "nme-app-cert"
app_cert_lifetime_months = 4  # ~120 days; key is reused on renewal

# -----------------
# Networking
# -----------------

configure_private_endpoints = false
private_web_app             = false

# Required when configure_private_endpoints = true
# deployment_vnet_name           = "{deployment-vnet-name}"
# deployment_resource_group_name = "{deployment-rg-name}"

# Extra delay (seconds) after private DNS resolves before proceeding.
# Increase to 60-180 if initial deploy fails with 403 ForbiddenByConnection.
# private_endpoint_post_resolve_delay = 0

network_config = {
  vnet_name       = "vnet-shared-sbx-sbx-szn-01"
  vnet_cidr       = "10.0.7.0/24"
  pe_subnet_name  = "snet-privateendpoint-sbx-sbx-szn-01"
  pe_subnet_cidr  = "10.0.7.0/27"
  app_subnet_name = "snet-appservice-sbx-sbx-szn-01"
  app_subnet_cidr = "10.0.7.64/27"
}

# -----------------
# Tags / misc
# -----------------

tags_by_resource = {
  # Tags are keyed by Azure resource provider type.
  # Each key maps to a map of tag name => tag value.
  # Only include entries for resource types you want to tag.
  #
  # Supported resource type keys:
  #   Microsoft.Web/serverfarms
  #   Microsoft.Web/sites
  #   Microsoft.KeyVault/vaults
  #   Microsoft.Sql/servers
  #   Microsoft.Sql/servers/databases
  #   Microsoft.OperationalInsights/workspaces
  #   Microsoft.Insights/components
  #   Microsoft.Insights/dataCollectionEndpoints
  #   Microsoft.Insights/dataCollectionRules
  #   Microsoft.Storage/storageAccounts
  #   Microsoft.Automation/automationAccounts
  #   Microsoft.Network/virtualNetworks
  #   Microsoft.Network/privateEndpoints
  #   Microsoft.Network/privateDnsZones
  #   Microsoft.Network/privateDnsZones/virtualNetworkLinks
  #
  # Example:
  # "Microsoft.Web/sites" = {
  #   environment         = "production"
  #   cost-center         = "engineering"
  #   data-classification = "internal"
  # }
  # "Microsoft.Sql/servers" = {
  #   environment         = "production"
  #   data-classification = "confidential"
  # }
}

# -----------------
# App Role Assignments (Optional)
# -----------------
# Assign users to Azure AD application roles created by the install script.
# Requires ARM_CLIENT_ID, ARM_CLIENT_SECRET, and ARM_TENANT_ID environment variables to be set.
# 
# Available roles:
#   - Reviewer:     View access to all areas of NME; no ability to save or make changes
#   - HelpDesk:     Complete access to User sessions only
#   - DesktopAdmin: Complete access to User sessions, ability to view Host Pools and hosts
#   - WvdAdmin:     Complete access to all areas of NME
#   - RestClient:   Rest client access (for service principals/applications)
# 
# Example:
# app_role_assignments = {
#   "WvdAdmin"     = ["admin@contoso.com", "admin2@contoso.com"]
#   "Reviewer"     = ["viewer1@contoso.com", "viewer2@contoso.com"]
#   "HelpDesk"     = ["helpdesk@contoso.com"]
#   "DesktopAdmin" = ["desktopadmin@contoso.com"]
# }

app_role_assignments = {}
