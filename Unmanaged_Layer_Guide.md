# Unmanaged Layer - Explanation Guide

## Overview
"Unmanaged layer" refers to a layer or component in a system that is not centrally managed, controlled, or maintained by a primary system or administrator. The exact meaning depends on the context.

---

## Common Contexts

### 1. Salesforce Unmanaged Packages/Layers

**What it is:**
- Code, components, or configurations that are not packaged or managed by Salesforce's managed package system
- Customizations that exist directly in an org without package protection
- Can be modified directly by users with appropriate permissions

**Characteristics:**
- ✅ Can be edited directly in the org
- ✅ No version control through packages
- ✅ No namespace protection
- ✅ Can be deleted or modified by any user with permissions
- ❌ Not protected from accidental changes
- ❌ Not easily transferable between orgs

**Example:**
```
Managed Package (Managed Layer):
- Protected code/components
- Versioned releases
- Namespace protected
- Cannot be directly edited

Unmanaged Package (Unmanaged Layer):
- Custom fields, objects, code
- Directly editable
- No namespace protection
- Can be modified/deleted
```

**Use Cases:**
- Customizations specific to one org
- Development/testing environments
- Quick fixes or temporary solutions
- Custom integrations

---

### 2. Application Architecture - Unmanaged Layers

**What it is:**
- Code or components that are not managed by a framework, container, or orchestration system
- Direct access to resources without abstraction layers
- Manual management required

**Managed vs Unmanaged:**

| Aspect | Managed Layer | Unmanaged Layer |
|--------|--------------|-----------------|
| **Control** | Framework/System manages lifecycle | Manual management required |
| **Updates** | Automatic or orchestrated | Manual updates needed |
| **Configuration** | Centralized config | Distributed/scattered config |
| **Monitoring** | Built-in monitoring | Manual monitoring setup |
| **Scaling** | Auto-scaling possible | Manual scaling |
| **Dependencies** | Managed by system | Manual dependency management |

**Example in Application Stack:**
```
Managed Layer:
- Application server manages components
- Framework handles lifecycle
- Container orchestrates resources

Unmanaged Layer:
- Direct database connections
- Manual file system access
- Custom resource management
- Direct API calls without abstraction
```

---

### 3. Cloud Services - Unmanaged Services

**What it is:**
- Infrastructure or services you manage yourself
- No automatic scaling, patching, or maintenance
- Full control but full responsibility

**Managed vs Unmanaged Services:**

**Managed Service (Managed Layer):**
- Provider handles maintenance, updates, scaling
- Automatic backups and monitoring
- Less control, less responsibility
- Example: AWS RDS (managed database)

**Unmanaged Service (Unmanaged Layer):**
- You handle everything
- Full control and customization
- More responsibility
- Example: EC2 instance with self-managed database

**Example:**
```
Managed Database Service:
- Automatic backups
- Auto-scaling
- Managed updates
- Provider handles maintenance

Unmanaged Database (Unmanaged Layer):
- You install and configure
- You handle backups
- You manage updates
- You monitor and maintain
```

---

### 4. Data Architecture - Unmanaged Data Layers

**What it is:**
- Data that is not managed by a data governance system
- Data without metadata management
- Data not tracked in a data catalog
- Shadow data or data silos

**Characteristics:**
- ❌ Not cataloged or documented
- ❌ No data quality controls
- ❌ No lineage tracking
- ❌ May violate data governance policies
- ✅ Quick access without restrictions
- ✅ No approval processes

**Example:**
```
Managed Data Layer:
- Data catalog entries
- Data quality rules
- Access controls
- Lineage tracking
- Governance policies

Unmanaged Data Layer:
- Spreadsheets on shared drives
- Local databases
- Unregistered data sources
- Data without documentation
```

---

### 5. Code/Configuration Management

**What it is:**
- Code or configuration not managed by version control
- Components not tracked in CI/CD pipelines
- Manual deployment processes
- Configuration drift

**Managed vs Unmanaged:**

**Managed Code/Config:**
- Version controlled (Git, SVN)
- Automated testing
- CI/CD pipelines
- Code reviews
- Automated deployments

**Unmanaged Code/Config:**
- Manual changes
- No version control
- Direct production edits
- No testing requirements
- Manual deployments

---

## In Context of Your HSRG System

If you're working with HSRG and field mappings, "unmanaged layer" might refer to:

### Possible Meanings:

1. **Unmanaged Customizations**
   - Custom fields or configurations not in a managed package
   - Direct org customizations that can be modified
   - Field mappings that aren't protected

2. **Unmanaged Data Layer**
   - Data not governed by data management policies
   - Field data that bypasses standard processes
   - The temporary workaround (CSP uploading to wrong field) might be "unmanaged"

3. **Unmanaged Configuration**
   - Field mappings not in a configuration management system
   - Hardcoded values instead of configurable settings
   - Manual field selection instead of managed mapping

---

## Key Differences Summary

| Aspect | Managed Layer | Unmanaged Layer |
|--------|--------------|-----------------|
| **Control** | Centralized, automated | Manual, distributed |
| **Protection** | Protected from changes | Can be modified freely |
| **Tracking** | Versioned, audited | May not be tracked |
| **Maintenance** | Automated or orchestrated | Manual maintenance |
| **Governance** | Policy-enforced | May bypass policies |
| **Flexibility** | Less flexible, more stable | More flexible, less stable |
| **Responsibility** | Shared/system | Full user responsibility |

---

## Best Practices

### When to Use Unmanaged Layers:
- ✅ Rapid prototyping
- ✅ Org-specific customizations
- ✅ Temporary solutions
- ✅ Development/testing environments
- ✅ When you need full control

### When to Avoid Unmanaged Layers:
- ❌ Production-critical systems
- ❌ Multi-org deployments
- ❌ When governance is required
- ❌ When consistency is critical
- ❌ Long-term solutions

### Migration to Managed:
- Document unmanaged components
- Create managed package/version
- Test thoroughly
- Migrate gradually
- Update documentation

---

## Questions to Clarify Context

If you need to understand "unmanaged layer" in your specific situation, ask:

1. **What system/platform are you using?**
   - Salesforce?
   - Cloud platform (AWS, Azure, GCP)?
   - Custom application?
   - Data platform?

2. **What layer are you referring to?**
   - Code layer?
   - Data layer?
   - Configuration layer?
   - Infrastructure layer?

3. **What's the concern?**
   - Security?
   - Governance?
   - Maintenance?
   - Migration?

---

## Common Issues with Unmanaged Layers

1. **Configuration Drift**
   - Changes not tracked
   - Inconsistencies between environments
   - Difficult to reproduce issues

2. **Security Risks**
   - No access controls
   - Unauthorized modifications possible
   - Audit trail gaps

3. **Maintenance Burden**
   - Manual updates required
   - No automated testing
   - Higher risk of errors

4. **Governance Gaps**
   - May bypass policies
   - Not included in compliance
   - Difficult to track

---

**Note:** The specific meaning of "unmanaged layer" depends on your system architecture. If you can share more context about your HSRG system or the specific concern, I can provide more targeted guidance.
