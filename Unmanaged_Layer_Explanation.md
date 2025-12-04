# What Are Unmanaged Layers?

## Overview
An "unmanaged layer" typically refers to a component or layer in a system that is not centrally managed, controlled, or versioned by a primary system or platform. The term is used in various contexts depending on the technology stack.

---

## Common Contexts

### 1. Salesforce Unmanaged Packages/Layers

**Unmanaged Package:**
- A collection of components that can be installed but are not version-controlled by Salesforce
- Once installed, components become part of the org and can be modified directly
- Changes are not tracked or managed by the package system
- Typically used for:
  - One-time installations
  - Customizations specific to an org
  - Development/testing components

**Managed Package:**
- Version-controlled and managed by Salesforce
- Updates are pushed from the package publisher
- Components cannot be directly modified in the org
- Used for:
  - AppExchange applications
  - Products distributed to multiple orgs
  - Version-controlled solutions

**Key Differences:**
| Unmanaged | Managed |
|-----------|---------|
| Can be modified after install | Cannot be modified |
| No version control | Version controlled |
| No automatic updates | Can receive updates |
| Org-specific | Can be distributed |

---

### 2. Data Architecture - Unmanaged Layers

**Unmanaged Data Layer:**
- Data that is not controlled by a central data management system
- Data that can be modified directly without governance
- Examples:
  - Local databases not synced with master
  - Spreadsheets used as data sources
  - Manual data entry points
  - Legacy systems not integrated

**Managed Data Layer:**
- Centralized data management
- Governance and control policies
- Version control and audit trails
- Data quality enforcement

---

### 3. Infrastructure/Cloud - Unmanaged Services

**Unmanaged Infrastructure:**
- Infrastructure components you manage yourself
- You're responsible for:
  - Server maintenance
  - OS updates
  - Security patches
  - Scaling decisions
  - Backup/restore

**Managed Infrastructure:**
- Provider manages the infrastructure
- Examples:
  - AWS RDS (managed database)
  - Azure App Service (managed hosting)
  - Google Cloud SQL (managed database)

**Comparison:**
```
Unmanaged (e.g., EC2):
- You install and configure everything
- You handle updates and patches
- More control, more responsibility

Managed (e.g., RDS):
- Provider handles setup and maintenance
- Automatic updates and backups
- Less control, less responsibility
```

---

### 4. Application Architecture - Unmanaged Code Layers

**Unmanaged Code Layer:**
- Code that runs outside managed runtime environments
- Direct memory management
- Examples:
  - C/C++ code
  - Native libraries
  - System-level code

**Managed Code Layer:**
- Code running in managed runtime
- Automatic memory management
- Examples:
  - .NET managed code
  - Java code (JVM)
  - Python code

---

### 5. Configuration Management - Unmanaged Configurations

**Unmanaged Configuration:**
- Configuration not tracked by version control
- Manual changes not documented
- No rollback capability
- Examples:
  - Manual database config changes
  - Direct file edits in production
  - Environment-specific overrides not tracked

**Managed Configuration:**
- Version controlled
- Documented changes
- Automated deployment
- Examples:
  - Infrastructure as Code (IaC)
  - Configuration files in Git
  - Automated config management tools

---

## In the Context of Your HSRG Issue

If "unmanaged layer" is mentioned in relation to your TDD field issue, it could refer to:

### Possible Interpretations:

1. **Unmanaged Customization Layer**
   - Customizations made directly in the system (not through managed packages)
   - Field mappings or configurations that were manually set up
   - Changes that bypass the standard configuration management

2. **Unmanaged Data Layer**
   - Data stored outside the main managed system
   - Temporary workarounds (like CSP uploading to wrong field)
   - Data not following standard data governance

3. **Unmanaged Configuration**
   - Field mappings or configurations not tracked in version control
   - Manual changes that weren't documented
   - Configurations that can't be easily rolled back

---

## Why Unmanaged Layers Can Be Problematic

### Issues with Unmanaged Layers:

1. **Lack of Control**
   - Changes can be made without oversight
   - No version tracking
   - Difficult to audit

2. **Inconsistency**
   - Different environments may have different configurations
   - No standardization
   - Hard to reproduce issues

3. **Maintenance Challenges**
   - Changes not documented
   - Difficult to troubleshoot
   - No rollback capability

4. **Compliance Risks**
   - May not meet governance requirements
   - Audit trail gaps
   - Security concerns

---

## Best Practices

### For Unmanaged Layers:

1. **Document Everything**
   - Keep records of all changes
   - Document why unmanaged approach was used
   - Maintain change logs

2. **Minimize Usage**
   - Use managed layers when possible
   - Only use unmanaged for specific needs
   - Plan migration to managed

3. **Establish Governance**
   - Create policies for unmanaged changes
   - Require approvals
   - Regular reviews

4. **Plan Migration**
   - Identify unmanaged components
   - Create roadmap to managed state
   - Prioritize critical components

---

## Identifying Unmanaged Layers in Your System

### Questions to Ask:

1. **Configuration Management**
   - Are field mappings in version control?
   - Can changes be rolled back?
   - Are changes documented?

2. **Data Management**
   - Is data following standard processes?
   - Are there manual workarounds?
   - Is data quality enforced?

3. **Code/Components**
   - Are customizations tracked?
   - Can changes be deployed automatically?
   - Is there a change management process?

---

## Example: Unmanaged Field Mapping

**Scenario:**
- Field mapping configured directly in production
- Not in version control
- Changed manually when needed
- No documentation

**This is an "unmanaged layer" because:**
- Changes aren't tracked
- Can't be easily replicated
- No rollback capability
- Not following standard process

**Solution:**
- Move mapping to configuration file
- Add to version control
- Create deployment process
- Document changes

---

## Summary

**Unmanaged Layer = Not centrally controlled or managed**

**Key Characteristics:**
- Direct modifications possible
- Not version controlled
- Manual processes
- Limited governance
- Difficult to track/audit

**When to Use:**
- Temporary solutions
- One-off customizations
- Development/testing
- When managed option not available

**When to Avoid:**
- Production systems
- Critical configurations
- When governance is required
- When consistency is important

---

**Note:** The specific meaning depends on your system context. In your HSRG case, if "unmanaged layer" is mentioned, it likely refers to configurations or customizations that aren't following standard managed processes.
