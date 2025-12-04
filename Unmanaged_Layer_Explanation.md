# Unmanaged Layer - Explanation

## Overview
An "unmanaged layer" refers to a component or layer in a system that is not centrally managed, controlled, or maintained by a standard management system or framework. The exact meaning depends on the context.

---

## Common Contexts

### 1. Salesforce Unmanaged Packages/Layers

**Unmanaged Package:**
- A collection of components that can be installed but are not version-controlled by Salesforce
- Once installed, components become part of the org and can be modified directly
- No upgrade path - changes must be made manually
- Typically used for templates, examples, or one-time installations

**Unmanaged Layer (in Salesforce):**
- Components that exist outside of managed package governance
- Can be modified directly in the org
- Not protected from changes
- Often refers to customizations made directly in the org vs. through managed packages

**Key Characteristics:**
- ✅ Can be modified directly
- ✅ No version control by vendor
- ✅ No automatic upgrades
- ❌ No dependency management
- ❌ Can be accidentally deleted or modified

---

### 2. Software Architecture - Unmanaged Layers

**Unmanaged Layer:**
- A layer in application architecture that operates independently
- Not controlled by a central management framework
- May have its own lifecycle and update mechanisms
- Often refers to legacy systems or third-party integrations

**Example Architecture:**
```
┌─────────────────────────────────────┐
│   Managed Layer (Central Control)  │
│   - Version controlled              │
│   - Automated deployments           │
│   - Standardized updates            │
└─────────────────────────────────────┘
              ↓
┌─────────────────────────────────────┐
│   Unmanaged Layer (Independent)     │
│   - Manual updates                  │
│   - Custom configurations           │
│   - Legacy systems                  │
└─────────────────────────────────────┘
```

**Characteristics:**
- Independent operation
- Manual maintenance
- Custom update processes
- May not follow standard patterns
- Harder to track and manage

---

### 3. Cloud Infrastructure - Unmanaged Services

**Unmanaged Service/Layer:**
- Infrastructure components you manage yourself
- No automatic scaling, patching, or management
- Full control but full responsibility
- Examples: Unmanaged databases, self-hosted services

**Managed vs. Unmanaged:**
```
Managed Service:
- Automatic backups
- Auto-scaling
- Managed updates
- Vendor handles operations

Unmanaged Service:
- Manual backups
- Manual scaling
- Manual updates
- You handle operations
```

---

### 4. Data Architecture - Unmanaged Data Layer

**Unmanaged Data Layer:**
- Data storage or processing layer not controlled by a data management platform
- May include:
  - Legacy databases
  - File-based storage
  - Unstructured data repositories
  - Systems without data governance

**Characteristics:**
- No centralized data governance
- Manual data management
- May lack data quality controls
- Difficult to track data lineage
- May have data silos

---

### 5. Application Components - Unmanaged Components

**Unmanaged Component:**
- Part of an application not controlled by a management system
- Examples:
  - Custom scripts not in version control
  - Configuration files not managed by config management
  - Third-party integrations without management layer
  - Legacy code not in CI/CD pipeline

---

## In Context of Your HSRG System

Given your HSRG portal and field mapping work, "unmanaged layer" might refer to:

### Possible Meanings:

1. **Unmanaged Configuration Layer**
   - Field mappings or configurations not managed by a configuration management system
   - Manual changes that aren't tracked
   - Custom configurations outside standard processes

2. **Unmanaged Data Layer**
   - Data sources not managed by a data governance system
   - Legacy databases or systems
   - Data that doesn't go through standard data pipelines

3. **Unmanaged Application Layer**
   - Portal components or services not in standard deployment pipeline
   - Custom code not version-controlled
   - Third-party integrations managed separately

4. **Unmanaged Integration Layer**
   - APIs or integrations not managed by an API gateway
   - Direct database connections
   - Custom integration code

---

## Identifying Unmanaged Layers

### Questions to Ask:
- [ ] Is this component in version control?
- [ ] Is it part of standard deployment process?
- [ ] Is it managed by a configuration management system?
- [ ] Are changes tracked and audited?
- [ ] Is there automated testing?
- [ ] Is it documented in standard documentation?
- [ ] Does it follow standard patterns?

### Red Flags:
- ❌ Manual changes required
- ❌ No version control
- ❌ No automated deployment
- ❌ Custom processes for updates
- ❌ Limited documentation
- ❌ Hard to track changes
- ❌ No standard testing

---

## Risks of Unmanaged Layers

1. **Maintenance Issues**
   - Hard to track what changed
   - Difficult to troubleshoot
   - Knowledge gaps if person leaves

2. **Security Risks**
   - May not follow security standards
   - Hard to audit
   - May have vulnerabilities

3. **Compliance Issues**
   - May not meet compliance requirements
   - Hard to demonstrate controls
   - Audit challenges

4. **Integration Problems**
   - May break when other systems change
   - Hard to test integration points
   - Dependency issues

---

## Best Practices

### If You Have Unmanaged Layers:

1. **Document Everything**
   - What it does
   - How it works
   - Who maintains it
   - How to update it

2. **Bring Under Management**
   - Add to version control
   - Include in deployment pipeline
   - Add to monitoring
   - Create runbooks

3. **Standardize**
   - Follow standard patterns
   - Use standard tools
   - Implement standard processes

4. **Plan Migration**
   - Identify all unmanaged components
   - Prioritize by risk
   - Create migration plan
   - Execute systematically

---

## Example: Unmanaged Field Mapping

In your HSRG TDD field issue context:

**Unmanaged Field Mapping:**
- Field mappings hardcoded in code
- Not in configuration management
- Manual changes required
- No version control for mappings
- Hard to track changes

**Managed Field Mapping:**
- Mappings in configuration file/database
- Version controlled
- Can be updated without code changes
- Changes tracked and audited
- Standardized update process

---

## Summary

**Unmanaged Layer = Component not controlled by standard management systems**

**Key Indicators:**
- Manual processes
- No version control
- Custom maintenance
- Limited documentation
- Hard to track changes

**Action Items:**
1. Identify all unmanaged layers in your system
2. Document them
3. Assess risks
4. Plan to bring under management
5. Execute migration plan

---

**Note:** The specific meaning depends on your system architecture. If you can share more context about where you encountered "unmanaged layer," I can provide more targeted guidance.
