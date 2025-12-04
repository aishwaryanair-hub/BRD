# Unmanaged Layer - Explanation

## Overview
An "unmanaged layer" typically refers to a component or layer in a system that is not directly controlled, managed, or maintained by the core application or framework. The exact meaning depends on the context.

---

## Common Contexts

### 1. Software Architecture / Application Layers

#### Unmanaged Layer Definition
An **unmanaged layer** is a software component that:
- Operates independently of the main application framework
- Is not automatically managed by dependency injection or service containers
- Requires manual lifecycle management (creation, initialization, disposal)
- May not follow the standard application patterns or conventions

#### Characteristics
- **Manual Control**: You must explicitly create, configure, and manage instances
- **No Framework Integration**: Not integrated with the application's dependency injection system
- **Direct Instantiation**: Created using `new` keyword or factory methods rather than being injected
- **Lifecycle Management**: You're responsible for initialization, cleanup, and resource management

#### Example in Code
```java
// Managed Layer (Framework manages it)
@Autowired
private UserService userService; // Framework creates and injects

// Unmanaged Layer (You manage it)
UserService userService = new UserService(); // You create and manage
```

---

### 2. Salesforce - Unmanaged Packages

In **Salesforce**, an unmanaged package is:
- A collection of components that can be distributed
- **Not version-controlled** by Salesforce
- Can be edited directly in the target org after installation
- Typically used for templates, examples, or starting points

**Unmanaged vs Managed Packages:**
- **Unmanaged**: Can be modified after installation, no upgrade path
- **Managed**: Version-controlled, upgradeable, components are locked

---

### 3. Infrastructure / Cloud Services

#### Unmanaged Services
Services where you have **full control** but also **full responsibility**:
- **Unmanaged Kubernetes**: You manage the control plane, nodes, updates
- **Unmanaged Databases**: You handle backups, scaling, patching
- **Unmanaged Load Balancers**: You configure and maintain everything

**vs Managed Services:**
- **Managed**: Provider handles maintenance, scaling, backups
- **Unmanaged**: You handle everything yourself

---

### 4. Data Architecture Layers

#### Unmanaged Data Layer
A data access layer that:
- Doesn't use an ORM (Object-Relational Mapping) framework
- Uses raw SQL or direct database connections
- Requires manual query writing and result mapping
- No automatic connection pooling or transaction management

**Example:**
```java
// Managed Layer (ORM like Hibernate)
User user = userRepository.findById(id); // Framework handles SQL

// Unmanaged Layer (Raw JDBC)
Connection conn = DriverManager.getConnection(url);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE id = " + id);
// Manual mapping required
```

---

### 5. API / Service Layers

#### Unmanaged API Layer
An API layer that:
- Doesn't use framework routing (like Spring, Express, etc.)
- Manually handles HTTP requests/responses
- No automatic serialization/deserialization
- Manual error handling and status codes

---

## In Context of Your HSRG System

If you're referring to an **unmanaged layer** in your HSRG portal system, it likely means:

### Possible Interpretations:

1. **Unmanaged Data Access Layer**
   - Direct database queries without ORM
   - Manual field mapping
   - Raw SQL execution
   - This could explain why field mappings might be hardcoded

2. **Unmanaged Service Layer**
   - Services not using dependency injection
   - Manual instantiation and configuration
   - Could make field mapping changes more complex

3. **Unmanaged Configuration Layer**
   - Configuration not managed by framework
   - Hardcoded values instead of config files
   - Could be why field names are hardcoded

---

## Why Unmanaged Layers Exist

### Advantages:
- ✅ **Full Control**: Complete control over behavior
- ✅ **Performance**: Can be optimized for specific use cases
- ✅ **Flexibility**: Not constrained by framework limitations
- ✅ **Simplicity**: No framework overhead for simple cases

### Disadvantages:
- ❌ **More Code**: More boilerplate and manual work
- ❌ **Maintenance**: Harder to maintain and update
- ❌ **Testing**: More difficult to test and mock
- ❌ **Consistency**: May not follow application patterns
- ❌ **Lifecycle**: Manual resource management required

---

## Identifying Unmanaged Layers

### Signs of Unmanaged Layer:
- Direct instantiation (`new ClassName()`)
- Manual resource management (connections, files, etc.)
- No dependency injection
- Hardcoded configuration
- Raw API/database access
- Manual error handling
- No framework annotations or decorators

### Example Detection:
```java
// This is likely unmanaged:
public class DataService {
    public void getData() {
        Connection conn = new Connection(); // Manual creation
        // Manual management
    }
}

// This is likely managed:
@Service
public class DataService {
    @Autowired
    private DataRepository repository; // Framework managed
}
```

---

## Converting Unmanaged to Managed

### Steps:
1. **Identify Dependencies**: What does the layer depend on?
2. **Create Interfaces**: Define contracts for the layer
3. **Register with Framework**: Add to dependency injection container
4. **Refactor Instantiation**: Replace `new` with injection
5. **Update Configuration**: Move hardcoded values to config
6. **Add Lifecycle Management**: Let framework handle creation/destruction

---

## Best Practices

### When to Use Unmanaged:
- Simple utilities with no dependencies
- Legacy code integration
- Performance-critical sections
- Third-party libraries that can't be managed

### When to Use Managed:
- Business logic components
- Data access layers
- Service layers
- Components with dependencies
- Most application code

---

## Related Terms

- **Managed Layer**: Framework-controlled, dependency-injected components
- **Managed Service**: Cloud service managed by provider
- **Managed Package**: Version-controlled, upgradeable package
- **Dependency Injection**: Framework manages object creation and wiring
- **Service Container**: Container that manages object lifecycles

---

## Questions to Clarify Context

If you're working on the HSRG TDD field issue and encounter "unmanaged layer":

1. **What type of system?**
   - Is it a web application?
   - Is it Salesforce?
   - Is it cloud infrastructure?

2. **What layer specifically?**
   - Data access layer?
   - Service layer?
   - API layer?
   - Configuration layer?

3. **What's the impact?**
   - Does it affect field mapping?
   - Does it make changes harder?
   - Is it causing the current issue?

---

**Note**: The exact meaning depends on your specific system architecture. If you can share more context about where you encountered "unmanaged layer" in your HSRG system, I can provide more specific guidance.
