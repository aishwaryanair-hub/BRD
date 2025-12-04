# What are Unmanaged Layers?

## Overview
An "unmanaged layer" refers to a component or layer in a system architecture that operates outside the standard managed framework or control mechanisms of the application.

---

## Common Contexts

### 1. Software Architecture Layers

#### Managed Layer
- **Definition**: Layers that are controlled, monitored, and managed by the application framework
- **Characteristics**:
  - Framework handles lifecycle (creation, initialization, destruction)
  - Automatic dependency injection
  - Transaction management
  - Error handling and logging
  - Configuration management
- **Examples**:
  - Spring-managed beans
  - .NET dependency injection containers
  - Managed services in microservices

#### Unmanaged Layer
- **Definition**: Layers that operate independently without framework management
- **Characteristics**:
  - Manual lifecycle management
  - Direct instantiation (using `new` keyword)
  - No automatic dependency injection
  - Manual resource management
  - Custom error handling
- **Examples**:
  - Plain Java objects (POJOs) not managed by Spring
  - Utility classes
  - Static helper classes
  - Legacy code components

**Key Difference:**
```
Managed Layer: Framework creates and manages the object
Unmanaged Layer: You create and manage the object yourself
```

---

### 2. Salesforce Context

#### Managed Package Layer
- Components installed as managed packages
- Protected from modification
- Upgradable by package publisher
- Namespace protected

#### Unmanaged Layer
- **Definition**: Custom code/components not in managed packages
- **Characteristics**:
  - Can be modified directly
  - No namespace protection
  - Not upgradable via package
  - Full control over code
- **Use Cases**:
  - Customizations specific to your org
  - Integrations with external systems
  - Business logic unique to your organization

---

### 3. Data Architecture Layers

#### Managed Data Layer
- **Definition**: Data access handled by ORM or framework
- **Characteristics**:
  - Entity Framework, Hibernate, etc.
  - Automatic SQL generation
  - Connection pooling
  - Transaction management
  - Caching

#### Unmanaged Data Layer
- **Definition**: Direct database access without framework
- **Characteristics**:
  - Raw SQL queries
  - Manual connection management
  - Custom transaction handling
  - Direct JDBC/ADO.NET usage
- **Use Cases**:
  - Performance-critical operations
  - Complex queries not easily expressed in ORM
  - Legacy database access
  - Stored procedures

---

### 4. Infrastructure/Cloud Layers

#### Managed Services
- Cloud provider manages the infrastructure
- Automatic scaling
- Built-in monitoring
- Managed backups
- Examples: AWS RDS, Azure SQL Database

#### Unmanaged Layer
- **Definition**: Infrastructure you manage yourself
- **Characteristics**:
  - Manual server management
  - Self-managed databases
  - Custom scaling logic
  - Your own monitoring
- **Examples**:
  - Self-hosted databases
  - On-premise servers
  - Custom infrastructure

---

## Why Use Unmanaged Layers?

### Advantages
1. **Performance**: Direct control can be faster
2. **Flexibility**: No framework constraints
3. **Legacy Integration**: Works with existing systems
4. **Specific Requirements**: Custom needs not met by framework
5. **Learning/Understanding**: Full visibility into what's happening

### Disadvantages
1. **More Code**: Manual management required
2. **Error-Prone**: Easy to make mistakes (memory leaks, etc.)
3. **No Framework Benefits**: Missing automatic features
4. **Harder to Test**: Less framework support for testing
5. **Maintenance**: More code to maintain

---

## Examples in Code

### Managed Layer (Spring Framework)
```java
@Service  // Spring manages this
public class UserService {
    @Autowired  // Spring injects this
    private UserRepository repository;
    
    public User getUser(Long id) {
        return repository.findById(id);
    }
}
```

### Unmanaged Layer
```java
// No annotations - you manage it yourself
public class UserService {
    private UserRepository repository;
    
    // Manual instantiation
    public UserService() {
        this.repository = new UserRepository();
    }
    
    public User getUser(Long id) {
        return repository.findById(id);
    }
}
```

---

## In Your HSRG Context

For the HSRG TDD field issue, an "unmanaged layer" might refer to:

1. **Data Access Layer**
   - Direct database queries not using ORM
   - Custom SQL for field retrieval
   - Manual field mapping logic

2. **Integration Layer**
   - External API calls not managed by framework
   - Custom data transformation
   - Legacy integration code

3. **Presentation Layer**
   - Custom portal components
   - Direct field binding
   - Manual data display logic

**When investigating the TDD field issue:**
- Check if field mapping is in a managed configuration or unmanaged code
- Look for hardcoded field references in unmanaged layers
- Identify if the issue is in framework-managed vs. custom code

---

## Best Practices

### When to Use Unmanaged Layers
- ✅ Performance-critical code
- ✅ Legacy system integration
- ✅ Framework limitations
- ✅ Specific technical requirements

### When to Use Managed Layers
- ✅ Standard business logic
- ✅ New development
- ✅ Framework provides needed features
- ✅ Team familiarity with framework

### Hybrid Approach
- Use managed layers for most code
- Use unmanaged layers for specific needs
- Clear boundaries between layers
- Document why unmanaged is used

---

## Key Takeaways

1. **Unmanaged = You Control**: You're responsible for lifecycle and management
2. **Managed = Framework Controls**: Framework handles creation, dependencies, etc.
3. **Context Matters**: Meaning varies by technology stack
4. **Trade-offs**: More control vs. more work
5. **Common in Legacy**: Older systems often have unmanaged layers

---

## Questions to Ask

When you encounter "unmanaged layer":
1. What framework/technology is being used?
2. What does "managed" mean in this context?
3. Why is this layer unmanaged?
4. What are the implications?
5. Should it be converted to managed?

---

**Note**: The exact meaning depends on your specific technology stack and architecture. In most modern applications, you'll have a mix of both managed and unmanaged layers.
