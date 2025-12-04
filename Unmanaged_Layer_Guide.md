# Unmanaged Layer - Explanation Guide

## Overview
"Unmanaged layer" is a term used in different contexts, most commonly in **Salesforce** development, but also in software architecture and cloud infrastructure. This guide explains the concept across different contexts.

---

## 1. Salesforce: Unmanaged Layer (Most Common Context)

### What is an Unmanaged Layer?

In Salesforce, an **unmanaged layer** refers to components that exist in your Salesforce org but are **NOT part of a managed package**. These are customizations you create directly in your org.

### Key Characteristics:

**Unmanaged Components:**
- ✅ Created directly in your Salesforce org
- ✅ Fully editable and customizable
- ✅ Not packaged or versioned
- ✅ Can be deleted or modified at any time
- ✅ Specific to your org
- ✅ Not distributed to other orgs

**Managed Components (for comparison):**
- 📦 Part of a managed package
- 🔒 Locked/protected from direct editing
- 📌 Versioned and controlled by package developer
- 🔄 Can be upgraded by package updates
- 📤 Can be distributed to other orgs

### Examples of Unmanaged Layers:

1. **Custom Fields**
   - Fields you create directly in your org
   - Example: "Telecommunications Device for the Deaf (TDD)" field

2. **Custom Objects**
   - Objects created in your org
   - Not from AppExchange packages

3. **Apex Classes/Triggers**
   - Code written directly in your org
   - Not from managed packages

4. **Visualforce Pages/Lightning Components**
   - UI components created in your org

5. **Workflows/Process Builder/Flows**
   - Automation created directly

6. **Profiles/Permission Sets**
   - Security settings in your org

### Why It Matters:

**In the Context of Your HSRG TDD Issue:**
- If HSRG is a managed package, it may have its own fields
- Your org might have unmanaged custom fields
- Field conflicts can occur between managed and unmanaged layers
- Unmanaged fields can override or conflict with managed package fields

### Common Scenarios:

**Scenario 1: Field Name Conflicts**
```
Managed Package Field: "TDD" (from HSRG package)
Unmanaged Field: "Telecommunications Device for the Deaf (TDD)" (your custom field)
→ Portal might be pulling wrong field due to naming/API name conflicts
```

**Scenario 2: Customization Layer**
```
Base Managed Package → Unmanaged Customizations Layer
→ Your customizations sit "on top" of managed package
→ Can extend but not modify managed components
```

---

## 2. Software Architecture: Unmanaged Layer

### Definition:
In software architecture, an **unmanaged layer** refers to a layer of the application that is **not managed by a framework or container**.

### Characteristics:
- **Manual Management**: You handle lifecycle, dependencies, and resources manually
- **No Framework Control**: Not automatically managed by dependency injection, ORM, etc.
- **Direct Access**: Direct database access, file system access, etc.
- **Custom Logic**: Business logic not handled by framework

### Examples:
- Direct SQL queries instead of ORM
- Manual memory management
- Custom service layers not using DI containers
- Legacy code not integrated with modern frameworks

---

## 3. Cloud Infrastructure: Unmanaged Layer

### Definition:
Infrastructure components that you manage yourself rather than using managed services.

### Managed vs Unmanaged:

**Managed Services:**
- AWS RDS (managed database)
- AWS Lambda (managed compute)
- Azure SQL Database
- Google Cloud SQL

**Unmanaged Services:**
- EC2 instances you configure yourself
- Self-hosted databases
- Custom infrastructure you maintain
- Virtual machines you manage

---

## 4. Data Architecture: Unmanaged Data Layer

### Definition:
A data layer where you manually handle data operations, transformations, and storage without using managed data services.

### Examples:
- Custom ETL scripts
- Manual data pipelines
- Direct database connections
- Custom data transformation logic

---

## How to Identify Unmanaged Layers in Your System

### For Salesforce:
1. **Setup Menu Check**
   - Go to Setup → Installed Packages
   - See what's managed vs unmanaged

2. **Component Properties**
   - Check component details
   - Managed components show package namespace
   - Unmanaged show no namespace

3. **API Names**
   - Managed: `namespace__FieldName__c`
   - Unmanaged: `FieldName__c` (no namespace)

### For Your HSRG TDD Issue:

**Questions to Ask:**
1. Is HSRG a managed package?
2. Are the TDD fields managed or unmanaged?
3. Is there a namespace prefix on the fields?
4. Can you directly edit the fields in Setup?

**Check Field API Names:**
```
Managed Field:    hsrg__TDD__c or hsrg__Telecommunications_Device__c
Unmanaged Field:  Telecommunications_Device_for_the_Deaf_TDD__c
```

---

## Best Practices

### For Salesforce Unmanaged Layers:

1. **Naming Conventions**
   - Use clear, descriptive names
   - Avoid conflicts with managed packages
   - Follow your org's naming standards

2. **Documentation**
   - Document all unmanaged customizations
   - Track dependencies
   - Maintain change logs

3. **Version Control**
   - Use version control for unmanaged code
   - Track changes to unmanaged components
   - Use change sets or deployment tools

4. **Testing**
   - Test unmanaged customizations thoroughly
   - Ensure they don't break managed package functionality
   - Test upgrade scenarios

### For Software Architecture:

1. **Minimize Unmanaged Layers**
   - Use managed services when possible
   - Leverage frameworks for common tasks
   - Only use unmanaged for specific requirements

2. **Isolation**
   - Isolate unmanaged code
   - Use interfaces/abstractions
   - Document dependencies

---

## Troubleshooting Unmanaged Layer Issues

### Common Problems:

1. **Field Conflicts**
   - Solution: Check API names, namespaces
   - Verify field sources (managed vs unmanaged)

2. **Deployment Issues**
   - Solution: Ensure unmanaged components are included in deployment
   - Check dependencies

3. **Upgrade Conflicts**
   - Solution: Test managed package upgrades
   - Review unmanaged customizations for conflicts

4. **Performance Issues**
   - Solution: Review unmanaged code efficiency
   - Optimize custom queries/logic

---

## Related Terms

- **Managed Package**: Pre-built, packaged Salesforce application
- **Unmanaged Package**: Collection of components you can edit
- **Namespace**: Prefix identifying managed package components
- **Metadata**: Configuration and code in Salesforce
- **Customization Layer**: Your org-specific changes

---

## Summary

**In Salesforce Context (Most Relevant):**
- **Unmanaged Layer** = Components you create directly in your org
- **Not part of a managed package**
- **Fully editable and customizable**
- **Org-specific**

**For Your HSRG Issue:**
- Check if TDD fields are managed or unmanaged
- Verify field API names and namespaces
- Ensure portal is referencing the correct field (managed vs unmanaged)
- Check for field name conflicts between layers

---

**Quick Check:**
1. Go to Setup → Object Manager → [Your Object]
2. Check field properties
3. Look for namespace prefix
4. If no namespace = Unmanaged
5. If has namespace = Managed
