# Unmanaged Layer - Explanation Guide

## Overview
"Unmanaged layer" refers to a layer or component in a system that is not centrally managed, controlled, or maintained by a primary system or framework. The exact meaning depends on the context.

---

## Common Contexts

### 1. Salesforce Unmanaged Packages/Layers

**What it is:**
- In Salesforce, an **unmanaged package** is a collection of components that can be distributed but are not version-controlled or upgradeable by the package creator
- Once installed, the components become part of the subscriber's org and can be modified directly
- No automatic updates from the package creator

**Characteristics:**
- ✅ Can be modified by the subscriber
- ✅ No version control by publisher
- ✅ No automatic upgrades
- ✅ Components become part of subscriber's org
- ❌ Cannot be upgraded automatically
- ❌ No dependency management

**Use Cases:**
- Template code
- Sample applications
- One-time installations
- Customizations that need local modification

**Example:**
```
Unmanaged Package: "HSRG Field Mapping Template"
- Contains: Field mapping configurations
- After install: Can be modified directly in org
- Updates: Must be manually applied
```

---

### 2. Application Architecture - Unmanaged Layers

**What it is:**
- A layer in application architecture that operates independently without centralized management
- Not controlled by a framework or orchestration system
- Manual configuration and maintenance required

**Characteristics:**
- Manual configuration
- No automatic scaling
- No centralized monitoring
- Direct access and modification
- Self-managed resources

**Managed vs Unmanaged:**

| Aspect | Managed Layer | Unmanaged Layer |
|--------|--------------|-----------------|
| Configuration | Automated/Framework-controlled | Manual |
| Scaling | Automatic | Manual |
| Updates | Automated | Manual |
| Monitoring | Centralized | Self-managed |
| Maintenance | Framework handles | You handle |
| Flexibility | Limited by framework | Full control |

**Example Architecture:**
```
┌─────────────────────────────────┐
│   Managed Layer (Framework)     │
│   - Auto-scaling                │
│   - Centralized config          │
│   - Framework-controlled        │
└─────────────────────────────────┘
           ↓
┌─────────────────────────────────┐
│   Unmanaged Layer               │
│   - Manual configuration        │
│   - Direct database access      │
│   - Custom business logic       │
│   - Self-maintained             │
└─────────────────────────────────┘
```

---

### 3. Cloud Services - Unmanaged Services

**What it is:**
- Infrastructure or services where you have full control and responsibility
- Provider gives you the resources, but you manage everything
- No automated management, scaling, or maintenance

**Examples:**
- **Unmanaged Database**: You manage backups, scaling, patching
- **Unmanaged Kubernetes**: You manage the control plane
- **Unmanaged Load Balancer**: You configure all rules manually

**Managed vs Unmanaged:**

**Managed Service:**
- Provider handles: Scaling, backups, updates, monitoring
- You focus on: Application logic
- Example: AWS RDS (managed database)

**Unmanaged Service:**
- Provider provides: Infrastructure only
- You handle: Everything (scaling, backups, updates, monitoring)
- Example: EC2 instance with self-installed database

---

### 4. Data Architecture - Unmanaged Data Layer

**What it is:**
- Data layer that is not controlled by a data management platform
- Direct database access without abstraction layer
- No automated data governance or lifecycle management

**Characteristics:**
- Direct SQL/database access
- Manual data management
- No automated backups/archiving
- Custom data access patterns
- Self-managed data lifecycle

**Example:**
```
Managed Data Layer:
- ORM (Object-Relational Mapping)
- Data access framework
- Automated caching
- Query optimization

Unmanaged Data Layer:
- Direct SQL queries
- Manual connection management
- Custom caching logic
- Manual optimization
```

---

### 5. Code/Application Layers

**What it is:**
- Code layer that is not managed by a framework or container
- Standalone components that operate independently
- Manual lifecycle management

**Example Structure:**
```
Application Layers:
├── Managed Layer (Framework)
│   ├── Dependency Injection
│   ├── Lifecycle Management
│   └── Framework Services
│
└── Unmanaged Layer
    ├── Legacy Code
    ├── Third-party Integrations
    ├── Custom Business Logic
    └── Direct System Calls
```

---

## In Context of Your HSRG System

If you're working with HSRG and field mappings, "unmanaged layer" might refer to:

### Possibility 1: Custom Field Mapping Layer
- Field mappings that are not controlled by a framework
- Manual configuration files
- Direct database field references
- Custom transformation logic

### Possibility 2: Legacy Integration Layer
- Older system components not integrated into managed framework
- Direct API calls or database access
- Manual configuration required

### Possibility 3: Configuration Layer
- Field mappings stored in unmanaged configuration
- Not part of managed package/system
- Can be modified directly without framework control

---

## How to Identify Unmanaged Layers

### Questions to Ask:
1. **Who manages it?**
   - If answer is "we do manually" → likely unmanaged

2. **How is it updated?**
   - If manual updates required → likely unmanaged

3. **Is it version-controlled?**
   - If no automatic versioning → likely unmanaged

4. **Can it be modified directly?**
   - If yes, without framework approval → likely unmanaged

5. **Is there automated monitoring?**
   - If no centralized monitoring → likely unmanaged

---

## Advantages of Unmanaged Layers

✅ **Full Control**
- Complete flexibility
- No framework limitations
- Custom implementations

✅ **Direct Access**
- No abstraction overhead
- Direct system access
- Performance optimization

✅ **Independence**
- Not tied to framework updates
- Can evolve independently
- No vendor lock-in

---

## Disadvantages of Unmanaged Layers

❌ **Maintenance Burden**
- Manual updates required
- No automated scaling
- Self-managed monitoring

❌ **Risk**
- Higher chance of errors
- No automated backups
- Manual security management

❌ **Complexity**
- More code to maintain
- Custom solutions needed
- Knowledge required

---

## Best Practices

### When to Use Unmanaged:
- Legacy system integration
- Performance-critical components
- Custom business requirements
- Temporary solutions
- Prototyping

### When to Use Managed:
- Standard functionality
- Scalability requirements
- Team efficiency
- Long-term maintenance
- Enterprise applications

### Migration Strategy:
1. Identify unmanaged components
2. Assess migration feasibility
3. Plan gradual migration
4. Maintain backward compatibility
5. Monitor and optimize

---

## Example: Field Mapping Context

If your HSRG system has an "unmanaged layer" for field mappings:

**Unmanaged Field Mapping:**
```
- Direct database field references
- Manual configuration files
- Custom transformation scripts
- No framework control
- Manual updates required
```

**Managed Field Mapping:**
```
- Framework-controlled mappings
- Configuration through admin UI
- Automated validation
- Version-controlled
- Framework-managed updates
```

---

## Summary

**Unmanaged Layer = You're in Control**
- Manual management
- Direct access
- Full responsibility
- Custom solutions
- Independent operation

**Managed Layer = Framework in Control**
- Automated management
- Abstraction layer
- Framework responsibility
- Standard solutions
- Integrated operation

---

**Key Takeaway:** An unmanaged layer gives you full control but requires you to handle all aspects of management, configuration, and maintenance yourself.
