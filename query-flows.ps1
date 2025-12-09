# PowerShell Script to Query 3 Power Automate Flows
# Requires: Microsoft.PowerApps.Administration.PowerShell module

# Install module if not already installed
# Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Scope CurrentUser

# Connect to Power Platform
# Add-PowerAppsAccount

# Define the 3 flow names to query
$flowNames = @(
    'Flow Name 1',
    'Flow Name 2',
    'Flow Name 3'
)

# Alternative: Query by Flow IDs
# $flowIds = @(
#     'flow-id-1',
#     'flow-id-2',
#     'flow-id-3'
# )

Write-Host "Querying Power Automate flows..." -ForegroundColor Cyan

# Method 1: Query flows by name
$flows = @()
foreach ($flowName in $flowNames) {
    try {
        $flow = Get-Flow -FlowName $flowName -ErrorAction SilentlyContinue
        if ($flow) {
            $flows += $flow
            Write-Host "Found: $flowName" -ForegroundColor Green
        } else {
            Write-Host "Not found: $flowName" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Error querying $flowName : $_" -ForegroundColor Red
    }
}

# Display results
if ($flows.Count -gt 0) {
    Write-Host "`n=== Flow Results ===" -ForegroundColor Cyan
    $flows | Select-Object FlowName, FlowDisplayName, FlowState, CreatedTime, LastModifiedTime | Format-Table -AutoSize
    
    # Export to CSV
    $flows | Select-Object FlowName, FlowDisplayName, FlowState, CreatedTime, LastModifiedTime | 
        Export-Csv -Path "flows-export.csv" -NoTypeInformation
    Write-Host "Results exported to flows-export.csv" -ForegroundColor Green
} else {
    Write-Host "No flows found matching the specified names." -ForegroundColor Yellow
}

# Method 2: Query using Dataverse Web API (if you have environment URL and token)
function Query-FlowsViaAPI {
    param(
        [string]$EnvironmentUrl,
        [string]$AccessToken,
        [string[]]$FlowNames
    )
    
    $filter = ($FlowNames | ForEach-Object { "name eq '$_'" }) -join ' or '
    $uri = "$EnvironmentUrl/api/data/v9.2/workflows" + 
           "?`$filter=$filter" + 
           "&`$select=name,workflowid,statecode,statuscode,createdon,modifiedon,description" +
           "&`$orderby=name"
    
    $headers = @{
        'Authorization' = "Bearer $AccessToken"
        'OData-MaxVersion' = '4.0'
        'OData-Version' = '4.0'
        'Accept' = 'application/json'
    }
    
    try {
        $response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers
        return $response.value
    } catch {
        Write-Error "API query failed: $_"
        return $null
    }
}

# Uncomment to use API method
# $apiResults = Query-FlowsViaAPI -EnvironmentUrl "https://yourorg.crm.dynamics.com" -AccessToken $token -FlowNames $flowNames
