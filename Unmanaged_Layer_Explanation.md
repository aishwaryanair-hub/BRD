# What are Unmanaged Layers?

## Overview
An **unmanaged layer** refers to a component or layer in a software architecture that operates independently without being managed by a framework, container, or orchestration system.

---

## Common Contexts

### 1. **Software Architecture / Application Layers**

#### Managed Layer
- Framework controls the lifecycle
- Dependency injection handled automatically
- Configuration managed by framework
- Examples: Spring-managed beans, .NET services in DI container

#### Unmanaged Layer
- **You control the lifecycle** - you create, configure, and destroy instances
- **Manual dependency management** - you handle dependencies yourself
- **No framework intervention** - operates outside framework control
- **Direct instantiation** - uses `new` keyword or manual construction

**Example:**
```java
// Managed Layer (Spring Framework)
@Service
public class UserService {
    // Spring creates and manages this instance
}

// Unmanaged Layer
public class DataProcessor {
    // You manually create: new DataProcessor()
    // You manage its lifecycle
}
```

---

### 2. **API/Service Layers**

#### Managed Services
- Automatically registered with service registry
- Health checks handled by framework
- Load balancing managed
- Service discovery automatic

#### Unmanaged Services
- **Manual registration** required
- **Custom health checks** you implement
- **Direct connections** - no service discovery
- **Manual scaling** - you handle it yourself

---

### 3. **Database/Data Access Layers**

#### Managed Layer
- ORM framework manages connections
- Transaction management automatic
- Connection pooling handled
- Entity lifecycle managed

#### Unmanaged Layer
- **Manual connection management** - you open/close connections
- **Raw SQL** - no ORM abstraction
- **Manual transaction handling**
- **Direct database access**

**Example:**
```java
// Managed (JPA/Hibernate)
@Repository
public class UserRepository extends JpaRepository<User, Long> {
    // Framework manages everything
}

// Unmanaged (JDBC)
public class UserRepository {
    Connection conn = DriverManager.getConnection(...);
    // You manage connection, transactions, etc.
}
```

---

### 4. **Cloud/Infrastructure Context**

#### Managed Services
- Provider handles scaling, backups, updates
- Automatic patching and maintenance
- Provider-managed infrastructure
- Examples: AWS RDS, Azure SQL Database

#### Unmanaged Services
- **You manage the infrastructure**
- **Manual scaling** and maintenance
- **You handle updates** and patches
- **More control, more responsibility**
- Examples: Self-hosted databases, VMs you manage

---

## Key Characteristics of Unmanaged Layers

### Advantages
✅ **Full Control**
- Complete control over behavior
- No framework limitations
- Custom implementations possible

✅ **Performance**
- No framework overhead
- Direct access to resources
- Optimized for specific needs

✅ **Flexibility**
- Not constrained by framework rules
- Can use any libraries
- Custom lifecycle management

### Disadvantages
❌ **More Work**
- Manual lifecycle management
- Manual dependency injection
- More boilerplate code

❌ **No Framework Benefits**
- No automatic transaction management
- No automatic connection pooling
- No built-in error handling

❌ **Maintenance Burden**
- You handle all aspects
- More code to maintain
- Potential for errors

---

## In Your HSRG Context

If you're dealing with unmanaged layers in your HSRG system, it might mean:

### Possible Scenarios:

1. **Unmanaged Data Layer**
   - Direct database access without ORM
   - Manual field mapping
   - Custom data transformation logic

2. **Unmanaged API Layer**
   - Services not in dependency injection container
   - Manual service instantiation
   - Custom routing logic

3. **Unmanaged Configuration**
   - Configuration not in framework config
   - Hardcoded values
   - Manual configuration loading

### For Your TDD Field Issue:
If the field mapping is in an "unmanaged layer," it might mean:
- Field mapping is hardcoded (not in config)
- Custom transformation logic (not using framework features)
- Direct database queries (not using ORM)
- Manual field selection logic

---

## How to Identify Unmanaged Layers

### Code Indicators:
- Direct instantiation: `new ClassName()`
- Manual connection management
- No annotations (like `@Service`, `@Component`)
- Custom initialization code
- Manual dependency passing
- No framework configuration

### Architecture Indicators:
- Components outside dependency injection
- Services not registered in service registry
- Direct database connections
- Custom lifecycle management code

---

## Best Practices

### When to Use Unmanaged Layers:
- ✅ Performance-critical components
- ✅ Legacy system integration
- ✅ Custom requirements not supported by framework
- ✅ Third-party libraries that don't integrate with framework

### When to Use Managed Layers:
- ✅ Standard business logic
- ✅ When framework provides needed features
- ✅ When you want automatic lifecycle management
- ✅ When following framework best practices

---

## Migration: Unmanaged → Managed

If you need to convert unmanaged to managed:

1. **Identify dependencies**
   - What does the unmanaged layer depend on?
   - What depends on it?

2. **Create managed wrapper**
   - Wrap unmanaged code in managed component
   - Use dependency injection

3. **Gradual migration**
   - Start with new code as managed
   - Migrate critical paths first
   - Keep unmanaged for legacy code

---

## Summary

**Unmanaged Layer = You're in control**
- You create it
- You configure it
- You manage its lifecycle
- You handle dependencies
- No framework magic

**Managed Layer = Framework is in control**
- Framework creates it
- Framework configures it
- Framework manages lifecycle
- Framework handles dependencies
- Framework provides features

---

**In your HSRG TDD field issue context:** If the field mapping is in an unmanaged layer, you'll likely find it as:
- Hardcoded field names in code
- Custom mapping logic
- Direct database field references
- Manual data transformation

This might actually make the fix easier - you just need to find the code and change the field reference!
