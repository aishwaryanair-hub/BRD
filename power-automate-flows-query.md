# Querying 3 Power Automate Flows in One Query

This document provides examples for querying multiple Power Automate flows in a single query using different methods.

---

## Method 1: Dataverse/CDS OData Query (Recommended)

### Using $filter with OR conditions

```http
GET /api/data/v9.2/workflows?$filter=
  name eq 'Flow Name 1' or 
  name eq 'Flow Name 2' or 
  name eq 'Flow Name 3'
&$select=name,workflowid,statecode,statuscode,createdon,modifiedon,description
&$orderby=name
```

### Using $filter with IN operator (if supported)

```http
GET /api/data/v9.2/workflows?$filter=
  name in ('Flow Name 1', 'Flow Name 2', 'Flow Name 3')
&$select=name,workflowid,statecode,statuscode,createdon,modifiedon,description
```

### Using workflowid (if you have the IDs)

```http
GET /api/data/v9.2/workflows?$filter=
  workflowid eq 'guid-1' or 
  workflowid eq 'guid-2' or 
  workflowid eq 'guid-3'
&$select=name,workflowid,statecode,statuscode,createdon,modifiedon,description
```

---

## Method 2: Power Platform PowerShell

### Using Get-Flow cmdlet

```powershell
# Install module if needed
# Install-Module -Name Microsoft.PowerApps.Administration.PowerShell

# Connect to Power Platform
Add-PowerAppsAccount

# Query 3 flows by name
$flowNames = @('Flow Name 1', 'Flow Name 2', 'Flow Name 3')
$flows = $flowNames | ForEach-Object {
    Get-Flow -FlowName $_
}

# Display results
$flows | Select-Object FlowName, FlowDisplayName, FlowState, CreatedTime, LastModifiedTime | Format-Table
```

### Using Get-AdminFlow cmdlet (for tenant admin)

```powershell
# Get flows by name pattern or IDs
$flowIds = @('flow-id-1', 'flow-id-2', 'flow-id-3')
$flows = $flowIds | ForEach-Object {
    Get-AdminFlow -FlowName $_
}

# Or filter by environment
$flows = Get-AdminFlow -EnvironmentName 'Your-Environment' | 
    Where-Object { $_.FlowName -in @('Flow Name 1', 'Flow Name 2', 'Flow Name 3') }
```

---

## Method 3: Power Automate REST API

### Using HTTP Request action in Power Automate

```json
{
  "method": "GET",
  "uri": "https://api.flow.microsoft.com/providers/Microsoft.ProcessSimple/environments/{environmentId}/flows",
  "headers": {
    "Authorization": "Bearer {accessToken}"
  },
  "queries": {
    "$filter": "name eq 'Flow Name 1' or name eq 'Flow Name 2' or name eq 'Flow Name 3'"
  }
}
```

### Using Flow Management API

```http
GET https://api.flow.microsoft.com/providers/Microsoft.ProcessSimple/environments/{environmentId}/flows
  ?$filter=properties/displayName eq 'Flow Name 1' or 
           properties/displayName eq 'Flow Name 2' or 
           properties/displayName eq 'Flow Name 3'
Authorization: Bearer {accessToken}
```

---

## Method 4: Microsoft Graph API

### Query flows using Graph API

```http
GET https://graph.microsoft.com/beta/applications/{appId}/flows
  ?$filter=displayName eq 'Flow Name 1' or 
           displayName eq 'Flow Name 2' or 
           displayName eq 'Flow Name 3'
Authorization: Bearer {accessToken}
```

### Using batch request for multiple flows

```http
POST https://graph.microsoft.com/v1.0/$batch
Content-Type: application/json
Authorization: Bearer {accessToken}

{
  "requests": [
    {
      "id": "1",
      "method": "GET",
      "url": "/applications/{appId}/flows/{flowId1}"
    },
    {
      "id": "2",
      "method": "GET",
      "url": "/applications/{appId}/flows/{flowId2}"
    },
    {
      "id": "3",
      "method": "GET",
      "url": "/applications/{appId}/flows/{flowId3}"
    }
  ]
}
```

---

## Method 5: SQL Query (if flows are stored in database)

### Example SQL query

```sql
-- If flows are stored in a custom table
SELECT 
    FlowName,
    FlowId,
    FlowState,
    CreatedDate,
    ModifiedDate,
    Description,
    EnvironmentName
FROM 
    PowerAutomateFlows
WHERE 
    FlowName IN ('Flow Name 1', 'Flow Name 2', 'Flow Name 3')
    -- OR FlowId IN ('id-1', 'id-2', 'id-3')
ORDER BY 
    FlowName;
```

### Using UNION (if needed for different conditions)

```sql
SELECT * FROM PowerAutomateFlows WHERE FlowName = 'Flow Name 1'
UNION ALL
SELECT * FROM PowerAutomateFlows WHERE FlowName = 'Flow Name 2'
UNION ALL
SELECT * FROM PowerAutomateFlows WHERE FlowName = 'Flow Name 3';
```

---

## Method 6: Power Automate HTTP Request with OData

### Complete example for Power Automate

**Action: HTTP Request**

```json
{
  "method": "GET",
  "uri": "https://{environment}.crm.dynamics.com/api/data/v9.2/workflows",
  "headers": {
    "OData-MaxVersion": "4.0",
    "OData-Version": "4.0",
    "Accept": "application/json",
    "Prefer": "odata.include-annotations=\"*\""
  },
  "queries": {
    "$filter": "name eq 'Flow Name 1' or name eq 'Flow Name 2' or name eq 'Flow Name 3'",
    "$select": "name,workflowid,statecode,statuscode,createdon,modifiedon,description",
    "$orderby": "name"
  }
}
```

---

## Method 7: Using Power Platform CLI (pac)

```bash
# Install Power Platform CLI
# npm install -g @microsoft/powerplatform-cli

# Authenticate
pac auth create --name dev --url https://{environment}.crm.dynamics.com

# Export flows (you can filter by name)
pac solution export --path ./solutions --name "MySolution" --include settings

# Or use pac CLI to query
pac solution list --environment-url https://{environment}.crm.dynamics.com
```

---

## Complete Example: Power Automate Flow Query Action

### Step-by-step in Power Automate

1. **Add HTTP Request Action**
   - Method: `GET`
   - URI: `https://{environment}.crm.dynamics.com/api/data/v9.2/workflows`

2. **Add Query Parameters**
   ```
   $filter: name eq 'Flow Name 1' or name eq 'Flow Name 2' or name eq 'Flow Name 3'
   $select: name,workflowid,statecode,statuscode,createdon,modifiedon,description
   $orderby: name
   ```

3. **Add Headers**
   ```
   Authorization: Bearer {your-token}
   OData-MaxVersion: 4.0
   OData-Version: 4.0
   Accept: application/json
   ```

4. **Parse JSON Response**
   ```json
   {
     "value": [
       {
         "name": "Flow Name 1",
         "workflowid": "guid-1",
         "statecode": 1,
         "statuscode": 2,
         "createdon": "2024-01-01T00:00:00Z",
         "modifiedon": "2024-01-15T00:00:00Z"
       },
       {
         "name": "Flow Name 2",
         "workflowid": "guid-2",
         "statecode": 1,
         "statuscode": 2,
         "createdon": "2024-01-02T00:00:00Z",
         "modifiedon": "2024-01-16T00:00:00Z"
       },
       {
         "name": "Flow Name 3",
         "workflowid": "guid-3",
         "statecode": 1,
         "statuscode": 2,
         "createdon": "2024-01-03T00:00:00Z",
         "modifiedon": "2024-01-17T00:00:00Z"
       }
     ]
   }
   ```

---

## Best Practices

### 1. Use specific identifiers when possible

* Prefer `workflowid` over `name` if you have the IDs (more reliable)
* Use `name` if you need to query by display name

### 2. Limit returned fields

* Always use `$select` to return only needed fields
* Reduces response size and improves performance

### 3. Handle authentication

* Use Azure AD authentication for Power Platform APIs
* Store credentials securely (Azure Key Vault, environment variables)

### 4. Error handling

* Check for null/empty results
* Handle cases where one or more flows don't exist
* Implement retry logic for transient failures

### 5. Performance considerations

* Use `$top` to limit results if querying many flows
* Consider caching results if querying frequently
* Use batch requests when querying many individual flows

---

## Example: Complete Power Automate Flow

### Flow Structure

```
1. Initialize Variable (FlowNames)
   - Type: Array
   - Value: ["Flow Name 1", "Flow Name 2", "Flow Name 3"]

2. HTTP Request
   - Method: GET
   - URI: https://{env}.crm.dynamics.com/api/data/v9.2/workflows
   - Query: $filter=name eq 'Flow Name 1' or name eq 'Flow Name 2' or name eq 'Flow Name 3'

3. Parse JSON (Response)
   - Schema: (auto-generated from sample)

4. Apply to Each (value array)
   - Process each flow result
   - Log or store results
```

---

## Troubleshooting

### Common Issues

1. **Authentication errors**
   * Verify access token is valid
   * Check token expiration
   * Ensure proper permissions (Flow.Read.All, Workflow.Read)

2. **No results returned**
   * Verify flow names are exact (case-sensitive in some APIs)
   * Check if flows exist in the specified environment
   * Verify filter syntax is correct

3. **Timeout errors**
   * Add pagination with `$top` and `$skip`
   * Reduce number of fields in `$select`
   * Check network connectivity

4. **Invalid filter syntax**
   * Use proper OData syntax
   * Escape special characters in flow names
   * Verify OR conditions are properly formatted

---

## Additional Resources

* [Power Platform REST API Documentation](https://docs.microsoft.com/en-us/power-platform/admin/api-reference)
* [OData Query Syntax](https://www.odata.org/documentation/)
* [Power Automate Management API](https://docs.microsoft.com/en-us/rest/api/power-automate/)
* [Microsoft Graph API for Power Automate](https://docs.microsoft.com/en-us/graph/api/resources/flow)

---

## Quick Reference

### OData Filter Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `eq` | Equals | `name eq 'Flow1'` |
| `ne` | Not equals | `name ne 'Flow1'` |
| `or` | Logical OR | `name eq 'Flow1' or name eq 'Flow2'` |
| `and` | Logical AND | `name eq 'Flow1' and statecode eq 1` |
| `in` | In list | `name in ('Flow1', 'Flow2', 'Flow3')` |

### Common Workflow Fields

| Field | Description | Type |
|-------|-------------|------|
| `workflowid` | Unique identifier | GUID |
| `name` | Flow name | String |
| `statecode` | State (0=Draft, 1=Activated) | Int |
| `statuscode` | Status code | Int |
| `createdon` | Creation date | DateTime |
| `modifiedon` | Last modified | DateTime |
| `description` | Flow description | String |

---

**Note**: Replace placeholder values like `{environment}`, `{environmentId}`, `{appId}`, `{accessToken}`, and flow names with your actual values.
