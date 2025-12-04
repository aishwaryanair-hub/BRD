# What are Unmanaged Layers?

## Overview
An "unmanaged layer" refers to a layer in a software system that is **not managed by a framework, container, or dependency injection system**. It's code that developers write and control directly, without automatic lifecycle management.

---

## Common Contexts

### 1. **Software Architecture Layers**

In layered architecture (Presentation → Business → Data), an unmanaged layer means:

**Unmanaged Layer:**
- Code you write directly
- No framework managing object lifecycle
- Manual instantiation and management
- Full control over implementation
- Example: Plain Java classes, simple functions

**Managed Layer (opposite):**
- Framework manages object creation/lifecycle
- Dependency injection handles dependencies
- Automatic configuration
- Example: Spring beans, .NET services, Angular services

```
┌─────────────────────────────────┐
│  Presentation Layer (Managed)   │ ← Framework manages (Spring, Angular)
├─────────────────────────────────┤
│  Business Logic (Unmanaged)    │ ← You write directly, no framework
├─────────────────────────────────┤
│  Data Access (Managed)          │ ← ORM/Data framework manages
└─────────────────────────────────┘
```

---

### 2. **Cloud Computing (AWS/Azure)**

**Unmanaged Services:**
- You manage the infrastructure
- You handle scaling, patching, backups
- More control, more responsibility
- Example: EC2 instances, self-hosted databases

**Managed Services:**
- Cloud provider manages infrastructure
- Automatic scaling, patching, backups
- Less control, less maintenance
- Example: AWS Lambda, RDS, Azure Functions

---

### 3. **Data Architecture**

**Unmanaged Data Layer:**
- Direct database access
- Manual SQL queries
- No ORM (Object-Relational Mapping)
- You handle connections, transactions
- Example: JDBC, ADO.NET

**Managed Data Layer:**
- ORM framework manages
- Entity Framework, Hibernate, Sequelize
- Automatic query generation
- Connection pooling handled
- Example: Entity Framework, Hibernate

---

### 4. **Dependency Injection Context**

**Unmanaged:**
```java
// Unmanaged - you create it yourself
MyService service = new MyService();
service.doSomething();
```

**Managed:**
```java
// Managed - framework creates and injects
@Autowired
MyService service;  // Spring creates this
```

---

## Key Characteristics

### Unmanaged Layer
✅ **Pros:**
- Full control over implementation
- No framework overhead
- Simple, direct code
- Easy to understand
- No dependency on framework

❌ **Cons:**
- Manual lifecycle management
- More boilerplate code
- Harder to test (no mocking framework)
- No automatic dependency resolution
- More code to maintain

### Managed Layer
✅ **Pros:**
- Automatic lifecycle management
- Dependency injection
- Easier testing with mocks
- Less boilerplate
- Framework handles complexity

❌ **Cons:**
- Framework dependency
- Learning curve
- Less control
- Potential performance overhead
- Framework-specific code

---

## Examples by Technology

### Java/Spring
```java
// UNMANAGED - Plain Java class
public class UserService {
    private UserRepository repo = new UserRepository();
    // You manage everything
}

// MANAGED - Spring Bean
@Service
public class UserService {
    @Autowired
    private UserRepository repo;
    // Spring manages lifecycle
}
```

### .NET
```csharp
// UNMANAGED
public class UserService {
    private UserRepository repo = new UserRepository();
}

// MANAGED
public class UserService {
    private readonly UserRepository _repo;
    public UserService(UserRepository repo) {
        _repo = repo; // Dependency injection
    }
}
```

### JavaScript/Node.js
```javascript
// UNMANAGED
const userService = {
    repo: new UserRepository(),
    // Direct instantiation
};

// MANAGED (with framework like NestJS)
@Injectable()
export class UserService {
    constructor(private repo: UserRepository) {}
    // Framework manages
}
```

---

## When to Use Unmanaged Layers

### Use Unmanaged When:
- ✅ Simple applications
- ✅ Performance-critical code
- ✅ No need for dependency injection
- ✅ Minimal dependencies
- ✅ Learning/understanding the basics
- ✅ Legacy systems

### Use Managed When:
- ✅ Complex applications
- ✅ Need dependency injection
- ✅ Testing is important
- ✅ Team collaboration
- ✅ Enterprise applications
- ✅ Microservices architecture

---

## In Your HSRG Context

For the HSRG TDD field issue, you might encounter:

**Unmanaged Layer Example:**
```java
// Direct database access - unmanaged
Connection conn = DriverManager.getConnection(url);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM hsrg WHERE...");
// You manage connection, transactions, etc.
```

**Managed Layer Example:**
```java
// ORM framework - managed
@Repository
public class HSRGRepository {
    @Query("SELECT h FROM HSRG h WHERE...")
    List<HSRG> findByServiceType(String type);
    // Framework manages connection, transactions
}
```

---

## Hybrid Approach

Many systems use both:

```
┌─────────────────────────────┐
│  Managed Layer              │ ← Framework handles
│  (Controllers, Services)    │
├─────────────────────────────┤
│  Unmanaged Layer            │ ← Custom business logic
│  (Utilities, Helpers)       │
├─────────────────────────────┤
│  Managed Layer              │ ← ORM handles
│  (Data Access)              │
└─────────────────────────────┘
```

---

## Summary

**Unmanaged Layer = Code You Control Directly**
- No framework managing it
- You create, configure, and manage objects
- More control, more responsibility
- Simpler but more manual work

**Managed Layer = Framework Controls It**
- Framework creates and manages objects
- Automatic dependency injection
- Less control, less manual work
- More complex but easier to maintain

---

## Quick Reference

| Aspect | Unmanaged | Managed |
|--------|-----------|---------|
| Object Creation | Manual (`new`) | Framework |
| Lifecycle | You manage | Framework manages |
| Dependencies | Manual wiring | Auto-injection |
| Testing | Harder | Easier (mocking) |
| Control | Full | Limited |
| Complexity | Lower | Higher |
| Maintenance | More code | Less code |

---

**In your analysis:** When investigating the HSRG TDD field issue, check if the field mapping is in a managed layer (framework configuration) or unmanaged layer (hardcoded in your code). This will determine how you fix it!
