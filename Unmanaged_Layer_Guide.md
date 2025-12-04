# Unmanaged Layer - Explanation Guide

## Overview
An "unmanaged layer" refers to a component or tier in a system architecture that is not directly controlled, managed, or maintained by the primary application or framework. The term varies in meaning depending on the context.

---

## 1. Software Architecture Context

### What is an Unmanaged Layer?

In layered software architecture, an **unmanaged layer** is a layer that:
- Operates independently of the main application framework
- Is not automatically managed by dependency injection containers
- Requires manual lifecycle management
- May not follow the same patterns as managed layers

### Managed vs. Unmanaged Layers

**Managed Layer (Framework-Managed):**
- Automatically instantiated by the framework
- Lifecycle managed by dependency injection (DI) container
- Automatically handles dependencies
- Examples: Controllers, Services, Repositories in Spring/.NET

**Unmanaged Layer:**
- Manually instantiated by developers
- Lifecycle must be managed manually
- Dependencies must be wired manually
- Examples: Legacy code, third-party integrations, utility classes

### Example Architecture:

```
┌─────────────────────────────────┐
│   Presentation Layer            │ ← Managed (Framework)
│   (Controllers, Views)          │
├─────────────────────────────────┤
│   Business Logic Layer          │ ← Managed (Framework)
│   (Services, Domain Models)    │
├─────────────────────────────────┤
│   Data Access Layer             │ ← Managed (Framework)
│   (Repositories, ORM)           │
├─────────────────────────────────┤
│   Unmanaged Layer               │ ← Unmanaged
│   (Legacy APIs, External Libs) │
└─────────────────────────────────┘
```

---

## 2. Cloud Computing Context

### AWS / Cloud Services

**Unmanaged Services:**
- Services where you manage the underlying infrastructure
- You're responsible for OS, patches, scaling, backups
- More control but more responsibility
- Example: EC2 instances (you manage the server)

**Managed Services:**
- Services where the cloud provider manages infrastructure
- Provider handles scaling, backups, maintenance
- Less control but less operational overhead
- Example: RDS, Lambda, S3

### Example:
```
Managed Layer:
- AWS RDS (database managed by AWS)
- AWS Lambda (serverless, managed by AWS)
- AWS S3 (storage managed by AWS)

Unmanaged Layer:
- EC2 instances (you manage the OS)
- Self-hosted databases
- Custom infrastructure you maintain
```

---

## 3. Database Context

### Database Layers

**Managed Database Layer:**
- ORM (Object-Relational Mapping) manages database interactions
- Framework handles connection pooling, transactions
- Example: Entity Framework, Hibernate, Django ORM

**Unmanaged Database Layer:**
- Direct SQL queries or stored procedures
- Manual connection management
- Manual transaction handling
- Example: Raw ADO.NET, JDBC, direct SQL

### Example:
```csharp
// Managed Layer (Entity Framework)
var users = context.Users.Where(u => u.Active).ToList();

// Unmanaged Layer (Raw SQL)
var users = connection.Query<User>("SELECT * FROM Users WHERE Active = 1");
```

---

## 4. Application Framework Context

### .NET / Java / Spring

**Managed Components:**
- Automatically registered in DI container
- Lifecycle managed by framework
- Dependencies automatically injected
- Example: `@Service`, `@Component` in Spring

**Unmanaged Components:**
- Not registered in DI container
- Must be manually instantiated
- Dependencies must be manually provided
- Example: `new MyClass()` instead of DI

### Example (Spring Framework):

```java
// Managed Layer - Spring manages this
@Service
public class UserService {
    // Spring automatically injects dependencies
    @Autowired
    private UserRepository repository;
}

// Unmanaged Layer - You manage this
public class LegacyUtility {
    // Must manually create and manage
    public void doSomething() {
        // No DI, manual instantiation
    }
}
```

---

## 5. In Context of Your HSRG System

Based on your field mapping issue, an unmanaged layer might refer to:

### Possible Interpretations:

1. **Data Layer Not Managed by Framework**
   - Direct database access bypassing ORM
   - Manual field mapping not using framework conventions
   - Custom data transformation layer

2. **Configuration Layer**
   - Field mappings stored outside framework configuration
   - External configuration files not managed by framework
   - Database-driven configuration

3. **Integration Layer**
   - Third-party integrations not using standard patterns
   - Legacy system connections
   - External API calls not using framework HTTP clients

### Example Scenario:
```
Portal (Managed) → API (Managed) → Data Access (Managed)
                                         ↓
                              Field Mapping Config (Unmanaged)
                                         ↓
                              Database (Unmanaged Layer)
```

---

## 6. Common Characteristics

### Unmanaged Layers Typically:
- ✅ Require manual initialization
- ✅ Need explicit lifecycle management
- ✅ Don't participate in dependency injection
- ✅ May not follow framework conventions
- ✅ Often used for legacy code or third-party integrations
- ✅ Require more manual testing
- ✅ Can be harder to maintain

### When to Use Unmanaged Layers:
- Legacy system integration
- Third-party libraries without DI support
- Performance-critical code requiring direct control
- External systems that can't be managed
- Migration scenarios (transitioning to managed)

---

## 7. Best Practices

### Working with Unmanaged Layers:

1. **Isolate Unmanaged Code**
   - Wrap unmanaged components in managed adapters
   - Create interfaces to abstract unmanaged dependencies
   - Keep unmanaged code separate from managed code

2. **Document Dependencies**
   - Clearly document what is managed vs. unmanaged
   - Document initialization requirements
   - Document lifecycle management needs

3. **Use Adapter Pattern**
   ```java
   // Managed adapter wrapping unmanaged component
   @Service
   public class LegacyAdapter {
       private LegacySystem legacy; // Unmanaged
       
       @PostConstruct
       public void init() {
           legacy = new LegacySystem(); // Manual init
       }
   }
   ```

4. **Minimize Unmanaged Code**
   - Prefer managed solutions when possible
   - Gradually migrate unmanaged to managed
   - Use unmanaged only when necessary

---

## 8. Identification Checklist

To identify if something is an unmanaged layer:

- [ ] Is it automatically created by the framework? (No = Unmanaged)
- [ ] Are dependencies automatically injected? (No = Unmanaged)
- [ ] Is lifecycle managed by framework? (No = Unmanaged)
- [ ] Do you use `new` keyword to create it? (Yes = Likely Unmanaged)
- [ ] Is it outside the framework's DI container? (Yes = Unmanaged)
- [ ] Does it require manual initialization? (Yes = Unmanaged)

---

## 9. Related Terms

- **Managed Layer**: Framework-controlled components
- **Dependency Injection (DI)**: Automatic dependency management
- **IoC Container**: Container managing object lifecycle
- **Service Locator**: Pattern for accessing unmanaged services
- **Adapter Pattern**: Wrapping unmanaged in managed interface

---

## Summary

**Unmanaged Layer** = A component that you manually control and manage, rather than having the framework automatically handle its lifecycle, dependencies, and initialization.

**Key Takeaway**: In most modern applications, you want to minimize unmanaged layers and use managed components for better maintainability, testability, and consistency.

---

**In your HSRG context**, if the field mapping is in an "unmanaged layer," it might mean:
- The mapping is not using the framework's standard configuration
- It's in a custom/legacy component
- It requires manual updates rather than framework-managed configuration

Would you like me to help identify if your HSRG field mapping issue is related to an unmanaged layer in your system?
