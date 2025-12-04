# Unmanaged Layer - Explanation

## Overview
An "unmanaged layer" typically refers to a component or layer in a software system that is **not managed by a framework, container, or dependency injection system**. The layer operates independently without automatic lifecycle management, dependency resolution, or framework-provided services.

---

## Common Contexts

### 1. **Application Architecture Layers**

#### Managed Layer (for comparison)
- **Managed by**: Dependency Injection (DI) container, IoC framework
- **Lifecycle**: Framework controls creation, initialization, disposal
- **Dependencies**: Automatically injected by framework
- **Examples**: 
  - Spring Framework beans
  - .NET services registered in DI container
  - Angular services with `@Injectable()`

#### Unmanaged Layer
- **Not managed by**: Any framework or container
- **Lifecycle**: Manual creation and management
- **Dependencies**: Manually instantiated or passed
- **Examples**:
  - Plain Java classes created with `new`
  - Static utility classes
  - Classes instantiated manually without DI

**Example:**
```java
// Managed Layer (Spring)
@Service
public class UserService {
    @Autowired
    private UserRepository repository; // Injected by Spring
}

// Unmanaged Layer
public class UserService {
    private UserRepository repository;
    
    public UserService() {
        this.repository = new UserRepository(); // Manual instantiation
    }
}
```

---

### 2. **Infrastructure/Cloud Services**

#### Managed Services
- Provider handles setup, maintenance, scaling, updates
- Examples: AWS RDS, Azure SQL Database, Google Cloud SQL

#### Unmanaged Services
- You manage setup, maintenance, scaling, updates
- Examples: Self-hosted databases, on-premise servers, VMs you manage

**In HSRG/Portal Context:**
- **Managed**: Cloud database service, managed API gateway
- **Unmanaged**: Self-hosted database, custom API layer you maintain

---

### 3. **Data Access Layers**

#### Managed Data Layer
- Framework handles connections, transactions, pooling
- Examples: Entity Framework, Hibernate, Spring Data

#### Unmanaged Data Layer
- Manual connection management, transaction handling
- Examples: Raw JDBC, ADO.NET without framework, direct SQL

**Example:**
```java
// Managed (Spring Data JPA)
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Framework handles everything
}

// Unmanaged (Raw JDBC)
public class UserRepository {
    public User findById(Long id) {
        Connection conn = DriverManager.getConnection(...);
        // Manual connection, query, mapping
    }
}
```

---

### 4. **API/Service Layers**

#### Managed API Layer
- Framework handles routing, serialization, error handling
- Examples: Spring Boot controllers, ASP.NET Core controllers

#### Unmanaged API Layer
- Manual request handling, routing, serialization
- Examples: Raw servlets, custom HTTP handlers

---

## Characteristics of Unmanaged Layers

### Advantages
✅ **Full Control**: Complete control over implementation
✅ **No Framework Overhead**: No dependency on framework features
✅ **Flexibility**: Can implement exactly what you need
✅ **Simplicity**: No need to learn framework conventions

### Disadvantages
❌ **More Code**: Must write boilerplate code manually
❌ **Error-Prone**: Easy to make mistakes (memory leaks, connection issues)
❌ **No Automatic Features**: No automatic transaction management, connection pooling
❌ **Harder to Test**: Difficult to mock dependencies
❌ **Maintenance**: More code to maintain

---

## In the Context of HSRG System

If you're dealing with an "unmanaged layer" in your HSRG system, it might mean:

### Possible Scenarios:

1. **Unmanaged Data Access Layer**
   - Direct database connections without ORM
   - Manual SQL queries
   - Manual transaction management
   - Field mappings done manually in code

2. **Unmanaged Service Layer**
   - Services not registered in DI container
   - Manual dependency creation
   - No automatic lifecycle management

3. **Unmanaged API Layer**
   - Custom request handling
   - Manual serialization/deserialization
   - Custom routing logic

### Why It Matters for TDD Field Issue:

If the field mapping is in an **unmanaged layer**, you might need to:
- Find manual field mapping code
- Update hardcoded field references
- Manually test the changes
- Handle data transformation yourself

---

## How to Identify Unmanaged Layers

### Code Indicators:
- Classes created with `new` keyword instead of DI
- Manual connection/transaction management
- No framework annotations (`@Service`, `@Component`, `@Repository`)
- Static utility classes
- Direct database access without ORM
- Manual object instantiation

### Architecture Indicators:
- Layers that don't follow framework patterns
- Custom implementations instead of framework-provided solutions
- Manual dependency wiring
- No container/framework configuration

---

## Migration from Unmanaged to Managed

If you want to convert an unmanaged layer to managed:

1. **Register in DI Container**
   ```java
   // Before (Unmanaged)
   UserService service = new UserService();
   
   // After (Managed)
   @Service
   public class UserService { ... }
   ```

2. **Use Framework Features**
   - Replace manual connections with framework-managed
   - Use framework transaction management
   - Leverage automatic dependency injection

3. **Update Configuration**
   - Register components in framework config
   - Remove manual instantiation code

---

## Best Practices

### When to Use Unmanaged:
- Simple utilities with no dependencies
- Performance-critical code
- Legacy system integration
- When framework overhead is unacceptable

### When to Use Managed:
- Business logic services
- Data access layers
- API endpoints
- Most application components

---

## Summary

**Unmanaged Layer** = Code/components that you manually create and manage, without framework assistance for:
- Object lifecycle
- Dependency injection
- Resource management (connections, transactions)
- Configuration

**Managed Layer** = Code/components handled by a framework/container that provides:
- Automatic dependency injection
- Lifecycle management
- Resource pooling
- Configuration management

---

## Questions to Clarify Context

If you're working with unmanaged layers in your HSRG system, consider:

1. **Which layer is unmanaged?**
   - Data access?
   - Service layer?
   - API layer?
   - All of the above?

2. **Why is it unmanaged?**
   - Legacy system?
   - Performance requirements?
   - Specific technical constraints?

3. **Should it be migrated to managed?**
   - Benefits vs. effort
   - Technical feasibility
   - Business priorities

---

**Note**: The specific meaning depends on your system architecture. In the context of fixing the TDD field issue, an unmanaged layer might mean the field mapping logic is manually coded rather than configuration-driven.
