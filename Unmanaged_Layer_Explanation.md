# Unmanaged Layer - Explanation

## Overview
An "unmanaged layer" refers to a layer in a system architecture that is not controlled, managed, or maintained by a central authority or automated system. The term can have different meanings depending on the context.

---

## Common Contexts

### 1. Software Architecture Layers

In traditional layered architecture, an **unmanaged layer** typically means:

**Characteristics:**
- Not controlled by a framework or container
- Manual lifecycle management
- Direct instantiation and management
- No automatic dependency injection
- Manual resource cleanup

**Example:**
```java
// Unmanaged Layer - Manual instantiation
public class DataAccessLayer {
    private Connection connection;
    
    public DataAccessLayer() {
        // Manual connection management
        this.connection = DriverManager.getConnection(...);
    }
    
    public void close() {
        // Manual cleanup required
        connection.close();
    }
}
```

**vs. Managed Layer:**
```java
// Managed Layer - Framework handles lifecycle
@Service  // Spring framework manages this
public class DataAccessLayer {
    @Autowired
    private Connection connection;  // Injected by framework
    
    // Framework handles cleanup automatically
}
```

---

### 2. Salesforce - Unmanaged Packages/Layers

In Salesforce, **unmanaged layers** refer to:

**Unmanaged Package:**
- Metadata that can be modified directly
- Not version-controlled by Salesforce
- Can be edited in any org
- Changes are not tracked as package versions
- Typically used for development or one-time deployments

**Managed Package:**
- Metadata locked and version-controlled
- Cannot be modified in subscriber orgs
- Changes tracked through versions
- Used for AppExchange apps

**Unmanaged Layer in Salesforce:**
- Customizations made directly in the org
- Not part of a managed package
- Can be modified by admins/developers
- Not protected from changes

---

### 3. Data Architecture Layers

In data architecture, **unmanaged layers** can mean:

**Unmanaged Data Layer:**
- Data not controlled by a data management system
- No automated governance
- Manual data quality processes
- Direct database access without abstraction
- No data lineage tracking

**Managed Data Layer:**
- Controlled by data management platform
- Automated governance and quality checks
- Data cataloging and lineage
- Access through APIs/abstractions

---

### 4. Infrastructure/Cloud Layers

**Unmanaged Infrastructure Layer:**
- Servers, networks, storage managed manually
- No automation or orchestration
- Manual scaling and provisioning
- Direct access to underlying resources

**Managed Infrastructure Layer:**
- Cloud provider manages resources
- Automated scaling and provisioning
- Managed services (e.g., AWS RDS, Azure SQL)
- Limited direct access

---

## Key Characteristics of Unmanaged Layers

### Advantages
✅ **Full Control**
- Complete control over implementation
- No framework limitations
- Custom behavior possible

✅ **Flexibility**
- Can be modified directly
- No restrictions from management layer
- Direct access to resources

✅ **Simplicity (sometimes)**
- No framework overhead
- Direct implementation
- Easier to understand for simple cases

### Disadvantages
❌ **Manual Management**
- Must handle lifecycle manually
- Resource cleanup is your responsibility
- More boilerplate code

❌ **No Automation**
- No automatic dependency injection
- Manual configuration
- No built-in features

❌ **Maintenance Burden**
- More code to maintain
- Error-prone manual processes
- Less standardized

---

## In Context of Your HSRG System

If you're dealing with an "unmanaged layer" in your HSRG system, it likely means:

### Possible Scenarios:

1. **Unmanaged Data Access Layer**
   - Direct database connections
   - Manual query execution
   - No ORM or data access framework
   - Manual transaction management

2. **Unmanaged Configuration Layer**
   - Configuration not in a managed config system
   - Hardcoded values
   - Manual configuration updates
   - No centralized configuration management

3. **Unmanaged Field Mapping Layer**
   - Field mappings hardcoded in code
   - Not in a configuration file or database
   - Manual updates required for field changes
   - No dynamic field mapping system

### For Your TDD Field Issue:

If the field mapping is in an "unmanaged layer," it might mean:
- Field reference is hardcoded in code (not configurable)
- No configuration system managing field mappings
- Changes require code modifications (not just config updates)
- No centralized field mapping management

---

## How to Identify Unmanaged Layers

### Signs of Unmanaged Layer:
- [ ] Direct instantiation (no dependency injection)
- [ ] Manual resource management (connections, files, etc.)
- [ ] Hardcoded values instead of configuration
- [ ] No framework annotations or decorators
- [ ] Manual lifecycle management
- [ ] Direct database/storage access
- [ ] No automated testing framework integration

### Code Indicators:
```java
// Unmanaged - Manual instantiation
MyService service = new MyService();

// Managed - Framework injection
@Autowired
MyService service;
```

```java
// Unmanaged - Hardcoded
String fieldName = "(DNU) Telecommunications Device for the Deaf (TDD)";

// Managed - From configuration
String fieldName = config.getFieldMapping("TDD");
```

---

## Converting Unmanaged to Managed

### Steps:
1. **Identify the Layer**
   - What needs to be managed?
   - What are the pain points?

2. **Choose Management Approach**
   - Framework (Spring, .NET Core, etc.)
   - Configuration system
   - Service container
   - Cloud managed services

3. **Refactor Gradually**
   - Start with new code
   - Migrate critical paths
   - Maintain backward compatibility

4. **Benefits to Gain**
   - Automatic lifecycle management
   - Configuration-driven behavior
   - Easier testing
   - Better maintainability

---

## Best Practices

### When to Use Unmanaged:
- Simple, standalone components
- Performance-critical code
- Legacy system integration
- When framework overhead is unacceptable

### When to Use Managed:
- Complex applications
- Need for dependency injection
- Configuration-driven behavior
- Team development (standardization)
- Testing requirements

---

## Related Terms

- **Managed Layer**: Framework-controlled, automated lifecycle
- **Managed Service**: Cloud provider manages infrastructure
- **Unmanaged Package**: Editable metadata (Salesforce)
- **Managed Package**: Locked, versioned metadata (Salesforce)
- **Dependency Injection**: Framework manages dependencies
- **IoC Container**: Inversion of Control container

---

## Summary

**Unmanaged Layer** = Layer you control and manage manually
- No framework automation
- Direct implementation
- Manual lifecycle management
- Full control but more responsibility

**Managed Layer** = Layer controlled by framework/system
- Automated lifecycle
- Dependency injection
- Configuration-driven
- Less control but less maintenance

---

**For your HSRG TDD field issue:** If the field mapping is in an unmanaged layer, you'll likely need to:
1. Find the hardcoded field reference
2. Change it directly in code
3. Deploy the code change
4. (Consider moving to managed config for future flexibility)
