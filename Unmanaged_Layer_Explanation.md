# What Are Unmanaged Layers?

## Overview
"Unmanaged layer" can refer to different concepts depending on the context. Here are the most common interpretations:

---

## 1. Software Architecture - Layered Architecture

### Definition
In **layered architecture**, an **unmanaged layer** typically refers to a layer that:
- Is not directly controlled or managed by a framework
- Requires manual handling of dependencies, lifecycle, and resources
- Doesn't have automatic dependency injection or management
- You must manually instantiate, configure, and dispose of components

### Managed vs. Unmanaged Layers

**Managed Layer:**
- Framework handles lifecycle (creation, initialization, disposal)
- Automatic dependency injection
- Configuration-driven
- Example: Spring Framework managed beans, .NET dependency injection

**Unmanaged Layer:**
- Manual lifecycle management
- You create and manage objects yourself
- Direct instantiation (using `new` keyword)
- Manual resource cleanup
- Example: Plain Java classes, direct database connections

### Example in Code

```java
// MANAGED LAYER (Framework manages it)
@Service
public class UserService {
    @Autowired
    private UserRepository repository; // Framework injects this
    // Framework handles creation and lifecycle
}

// UNMANAGED LAYER (You manage it)
public class UserService {
    private UserRepository repository;
    
    public UserService() {
        // You manually create dependencies
        this.repository = new UserRepository();
    }
    // You must manage lifecycle yourself
}
```

---

## 2. Salesforce - Unmanaged Packages/Layers

### Definition
In **Salesforce**, "unmanaged" refers to components that:
- Are not packaged or version-controlled in a managed package
- Can be directly edited in the org
- Are not locked or protected
- Can be modified by any user with appropriate permissions

### Managed vs. Unmanaged in Salesforce

**Managed Package:**
- Locked components (can't be edited)
- Version-controlled
- Installed as a package
- Protected from modification

**Unmanaged:**
- Editable components
- Custom code, objects, fields created directly in org
- Can be modified freely
- Not packaged

### Example
- **Managed**: Installed AppExchange package (locked components)
- **Unmanaged**: Custom objects/fields you create directly in your org

---

## 3. Data Architecture - Data Layers

### Definition
In **data architecture**, an unmanaged layer might refer to:
- Raw data that isn't processed or transformed
- Data that doesn't follow a schema or governance
- Data sources not integrated into a data management system

### Managed vs. Unmanaged Data

**Managed Data Layer:**
- Structured, validated, governed
- Follows schema and standards
- Integrated into data pipeline
- Has metadata and documentation

**Unmanaged Data Layer:**
- Raw, unstructured, or semi-structured
- No validation or governance
- Not integrated into standard processes
- May be temporary or ad-hoc

---

## 4. Network/Infrastructure Layers

### Definition
In **network or infrastructure** contexts:
- Layers not controlled by orchestration tools
- Manual configuration required
- Not part of Infrastructure as Code (IaC)

### Managed vs. Unmanaged Infrastructure

**Managed:**
- Cloud-managed services (AWS RDS, Azure SQL)
- Infrastructure as Code (Terraform, CloudFormation)
- Auto-scaling, automated backups

**Unmanaged:**
- Self-hosted servers
- Manual configuration
- You handle updates, backups, scaling

---

## 5. Application Layers - Common Architecture

### Typical Layered Architecture

```
┌─────────────────────────────────┐
│   Presentation Layer            │  ← User Interface
│   (UI, Controllers, Views)      │
├─────────────────────────────────┤
│   Business Logic Layer          │  ← Business Rules
│   (Services, Domain Logic)      │
├─────────────────────────────────┤
│   Data Access Layer             │  ← Database Access
│   (Repositories, DAOs)          │
├─────────────────────────────────┤
│   Database Layer                │  ← Data Storage
│   (Tables, Views, Stored Procs) │
└─────────────────────────────────┘
```

### Unmanaged Layer Characteristics
- **No Framework Control**: Layer operates independently
- **Manual Management**: You handle creation, configuration, lifecycle
- **Direct Dependencies**: No dependency injection
- **Explicit Resource Management**: Manual cleanup required

---

## Common Use Cases

### When You Might Encounter "Unmanaged Layer"

1. **Legacy Code Integration**
   - Integrating old code that doesn't use modern frameworks
   - Wrapping unmanaged components in managed layers

2. **Performance-Critical Sections**
   - Direct database access for performance
   - Bypassing framework overhead

3. **Third-Party Integrations**
   - External libraries that aren't framework-aware
   - APIs that require manual connection management

4. **Migration Scenarios**
   - Moving from unmanaged to managed architecture
   - Gradual refactoring of layers

---

## Best Practices

### Working with Unmanaged Layers

1. **Isolation**
   - Keep unmanaged code isolated
   - Use adapters/wrappers to integrate with managed layers

2. **Documentation**
   - Clearly document what's unmanaged and why
   - Note lifecycle and resource management requirements

3. **Resource Management**
   - Always clean up resources (connections, files, memory)
   - Use try-finally or using statements

4. **Testing**
   - Test unmanaged layers thoroughly
   - Mock dependencies when possible

5. **Migration Path**
   - Plan to move to managed layers when possible
   - Document technical debt

---

## In Context of Your HSRG System

If you're asking about unmanaged layers in relation to your HSRG TDD field issue, it might refer to:

1. **Data Layer**: Raw database fields not managed by an ORM
2. **API Layer**: Direct database queries vs. managed service layer
3. **Configuration Layer**: Hardcoded values vs. managed configuration

### Questions to Clarify Context:
- Are you working with a specific framework (Spring, .NET, Salesforce)?
- Is this about data architecture or application architecture?
- Are you trying to identify where field mappings are managed vs. unmanaged?

---

## Summary

**Unmanaged Layer** generally means:
- ✅ Components you control and manage manually
- ✅ Not automatically handled by a framework
- ✅ Requires explicit lifecycle and resource management
- ✅ Can be modified directly

**Managed Layer** generally means:
- ✅ Framework handles lifecycle automatically
- ✅ Configuration-driven
- ✅ Dependency injection
- ✅ Less manual intervention needed

---

**Next Steps:**
If you can provide more context about your specific use case (framework, system type, or where you encountered this term), I can give you a more targeted explanation!
