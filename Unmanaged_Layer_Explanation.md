# Unmanaged Layer - Explanation

## Overview
An "unmanaged layer" refers to a component or layer in a system that is **not managed, controlled, or orchestrated** by a framework, service, or automated system. The term is context-dependent and can mean different things in different architectures.

---

## Common Contexts

### 1. **Software Architecture / Application Layers**

**Unmanaged Layer:**
- Code/components that are **not managed by a framework** (like dependency injection container, service locator, etc.)
- Layers that you manually instantiate and control
- Direct instantiation without framework intervention

**Example:**
```java
// Managed Layer (Spring Framework manages this)
@Service
public class UserService {
    // Spring creates and manages this instance
}

// Unmanaged Layer (You manage this yourself)
public class LegacyService {
    // You manually create: new LegacyService()
}
```

**Characteristics:**
- Manual lifecycle management
- No automatic dependency injection
- Direct instantiation
- You control creation/destruction

---

### 2. **API Gateway / Service Mesh Context**

**Unmanaged Layer:**
- Services or endpoints that are **not managed by the API Gateway** or service mesh
- Direct access without going through the managed gateway
- Bypasses centralized routing, security, monitoring

**Example:**
```
Managed Layer:
Client → API Gateway → Service A → Database

Unmanaged Layer:
Client → Service B (direct access, bypasses gateway)
```

**Characteristics:**
- No centralized routing
- No automatic load balancing
- No unified security policies
- Direct service-to-service communication

---

### 3. **Cloud Infrastructure / Managed vs Unmanaged Services**

**Unmanaged Layer:**
- Infrastructure components you **manage yourself** rather than using cloud provider's managed services
- You're responsible for setup, maintenance, scaling, backups

**Examples:**

| Managed Service | Unmanaged Equivalent |
|----------------|---------------------|
| AWS RDS (managed database) | EC2 instance with MySQL installed |
| Azure App Service | VM running your application |
| Google Cloud SQL | Compute Engine with database |
| AWS Lambda | EC2 running your code |

**Characteristics:**
- You handle installation
- You manage updates/patches
- You configure scaling
- You handle backups
- More control, more responsibility

---

### 4. **Data Architecture / Data Layers**

**Unmanaged Layer:**
- Data storage or processing that is **not managed by a data platform**
- Raw data storage without automated management
- Direct file system or database access without abstraction

**Example:**
```
Managed Data Layer:
Application → Data Platform → Automated ETL → Data Warehouse

Unmanaged Data Layer:
Application → Direct file system access → Manual processing
```

**Characteristics:**
- No automated data pipelines
- Manual data management
- Direct storage access
- You handle data lifecycle

---

### 5. **Dependency Injection / IoC Container Context**

**Unmanaged Layer:**
- Objects/components that are **not registered with or managed by** the IoC (Inversion of Control) container
- Created using `new` keyword instead of dependency injection
- Not part of the dependency graph

**Example:**
```csharp
// Managed by DI Container
public class UserController 
{
    private IUserService _userService;
    
    public UserController(IUserService userService) 
    {
        _userService = userService; // Container injects this
    }
}

// Unmanaged - created manually
var unmanagedService = new LegacyService(); // Not in DI container
```

**Characteristics:**
- Manual instantiation
- Not in dependency graph
- No automatic lifecycle management
- Can't be easily swapped/mocked

---

## Key Differences: Managed vs Unmanaged

| Aspect | Managed Layer | Unmanaged Layer |
|--------|--------------|-----------------|
| **Control** | Framework/system controls | You control |
| **Lifecycle** | Automatic management | Manual management |
| **Configuration** | Declarative/automated | Imperative/manual |
| **Scaling** | Often automatic | Manual |
| **Monitoring** | Built-in | You implement |
| **Updates** | Managed by provider | You handle |
| **Complexity** | Lower (for you) | Higher (you manage everything) |
| **Flexibility** | Limited by framework | Full control |

---

## When to Use Unmanaged Layers

### Use Unmanaged When:
- ✅ You need full control over behavior
- ✅ Framework limitations prevent what you need
- ✅ Legacy systems that can't be refactored
- ✅ Performance-critical code requiring direct control
- ✅ Custom requirements not supported by managed services
- ✅ Cost optimization (sometimes cheaper to manage yourself)

### Use Managed When:
- ✅ Standard use cases
- ✅ Want to reduce operational overhead
- ✅ Need automatic scaling, backups, monitoring
- ✅ Team lacks expertise in managing that layer
- ✅ Want faster development/deployment
- ✅ Need built-in security and compliance

---

## In Context of Your HSRG System

If you're asking about unmanaged layers in relation to the HSRG TDD field issue, it might refer to:

1. **Data Layer:**
   - Unmanaged = Direct database access, manual queries
   - Managed = ORM, data access framework

2. **API Layer:**
   - Unmanaged = Direct service calls, no gateway
   - Managed = API Gateway routing, service mesh

3. **Field Mapping:**
   - Unmanaged = Hardcoded field references
   - Managed = Configuration-driven field mappings

---

## Common Patterns

### Pattern 1: Hybrid Approach
```
Managed Layer (API Gateway)
    ↓
Unmanaged Layer (Legacy Service)
    ↓
Managed Layer (Database)
```

### Pattern 2: Gradual Migration
```
Start: Fully Unmanaged
    ↓
Migrate: Some Managed Components
    ↓
End Goal: Fully Managed (where possible)
```

---

## Best Practices

1. **Document Unmanaged Layers**
   - Clearly document what's unmanaged and why
   - Document maintenance responsibilities

2. **Minimize Unmanaged Components**
   - Use managed services when possible
   - Only use unmanaged when necessary

3. **Plan for Migration**
   - If unmanaged is temporary, plan migration path
   - Consider technical debt

4. **Monitor Unmanaged Layers**
   - Since they're not automatically monitored, add custom monitoring
   - Set up alerts and logging

5. **Standardize Management**
   - Even if unmanaged, use consistent patterns
   - Create runbooks for operations

---

## Questions to Ask

If someone mentions "unmanaged layer" in your context:

1. **What type of layer?**
   - Application layer?
   - Infrastructure layer?
   - Data layer?
   - API layer?

2. **What framework/service should manage it?**
   - Dependency injection container?
   - API Gateway?
   - Cloud provider service?
   - Data platform?

3. **Why is it unmanaged?**
   - Legacy system?
   - Custom requirements?
   - Cost considerations?
   - Technical limitations?

4. **Should it be managed?**
   - Is there a migration path?
   - What are the benefits of making it managed?
   - What are the risks?

---

## Summary

**Unmanaged Layer = You're in control, you're responsible**

- More control and flexibility
- More operational overhead
- More responsibility for maintenance, scaling, monitoring
- Often used for legacy systems, custom requirements, or cost optimization

The opposite would be a **managed layer** where a framework, service, or platform handles the operational aspects for you.

---

**Note:** The specific meaning depends on your system architecture. If you can share more context about where you encountered this term, I can provide a more targeted explanation.
