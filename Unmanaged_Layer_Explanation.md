# What are Unmanaged Layers?

## Overview
An **unmanaged layer** refers to a layer in a software architecture that is not automatically managed by a framework, platform, or infrastructure. Developers have full control and responsibility for its implementation, lifecycle, and maintenance.

---

## Common Contexts

### 1. Software Architecture Layers

In traditional layered architecture, an unmanaged layer is one where:
- **You write all the code yourself**
- **No framework handles it automatically**
- **You manage dependencies, lifecycle, and behavior**

**Example:**
```
┌─────────────────────────────────┐
│  Presentation Layer (Managed)   │ ← Framework handles routing, views
├─────────────────────────────────┤
│  Business Logic Layer           │
│  (Unmanaged)                    │ ← You write all business rules
├─────────────────────────────────┤
│  Data Access Layer (Unmanaged)  │ ← You write all database queries
├─────────────────────────────────┤
│  Database Layer                 │
└─────────────────────────────────┘
```

### 2. AWS Lambda Layers

In AWS Lambda, **unmanaged layers** are:
- Layers you create and maintain yourself
- Custom code, libraries, or dependencies
- You're responsible for versioning, updates, and compatibility

**Managed vs Unmanaged:**
- **Managed Layer**: AWS provides and maintains (e.g., AWS SDK)
- **Unmanaged Layer**: You create and maintain (e.g., custom utility library)

### 3. Data Architecture Layers

In data architecture:
- **Managed Layer**: Data warehouse, managed databases (handled by platform)
- **Unmanaged Layer**: Custom data processing, ETL scripts you write

### 4. Application Architecture

In application design:

**Managed Layers:**
- Framework handles routing, dependency injection, lifecycle
- Examples: Spring Boot controllers, ASP.NET MVC views

**Unmanaged Layers:**
- Custom business logic
- Custom data access code
- Integration code
- You write and maintain everything

---

## Characteristics of Unmanaged Layers

### ✅ Advantages
- **Full Control**: Complete flexibility in implementation
- **Customization**: Can implement exactly what you need
- **No Framework Limitations**: Not constrained by framework rules
- **Performance**: Can optimize for specific use cases

### ⚠️ Disadvantages
- **More Code**: You write everything from scratch
- **Maintenance Burden**: You're responsible for updates, bug fixes
- **No Built-in Features**: Must implement security, logging, error handling yourself
- **Testing**: Must write all tests yourself
- **Documentation**: Must document your own code

---

## Examples

### Example 1: Custom Business Logic Layer
```java
// Unmanaged Layer - You write all the logic
public class OrderService {
    public Order processOrder(OrderRequest request) {
        // You implement validation
        // You implement business rules
        // You handle errors
        // Framework doesn't help here
        return order;
    }
}
```

### Example 2: Custom Data Access Layer
```java
// Unmanaged Layer - You write all database code
public class OrderRepository {
    public Order findById(Long id) {
        // You write SQL
        // You handle connections
        // You map results
        // No ORM framework
        return order;
    }
}
```

### Example 3: AWS Lambda Unmanaged Layer
```bash
# You create and maintain this layer
layer/
  ├── nodejs/
  │   └── node_modules/
  │       └── custom-utils/  # Your custom code
  └── python/
      └── lib/
          └── custom-helpers/  # Your custom code
```

---

## Unmanaged vs Managed Comparison

| Aspect | Managed Layer | Unmanaged Layer |
|--------|--------------|-----------------|
| **Code** | Framework provides | You write |
| **Updates** | Framework handles | You maintain |
| **Features** | Built-in | You implement |
| **Control** | Limited by framework | Full control |
| **Complexity** | Lower (framework helps) | Higher (you do everything) |
| **Flexibility** | Constrained | Complete |
| **Maintenance** | Framework team | Your team |

---

## When to Use Unmanaged Layers

### ✅ Use Unmanaged When:
- You need complete control over behavior
- Framework doesn't support your requirements
- Performance is critical and you need optimization
- You have specific business logic that doesn't fit frameworks
- You're building reusable components

### ❌ Avoid Unmanaged When:
- Framework provides what you need
- You want faster development
- You want built-in security/features
- Team lacks expertise in that area
- Maintenance burden is a concern

---

## In Context of HSRG System

For your HSRG TDD field issue, unmanaged layers might refer to:

### Possible Unmanaged Layers:
1. **Custom Data Transformation Layer**
   - Code that transforms database fields to portal display
   - You wrote this, so you control field mappings

2. **Custom API Layer**
   - Endpoints that serve HSRG data
   - You manage how fields are selected/returned

3. **Custom Field Mapping Layer**
   - Logic that maps database fields to display fields
   - This is where the TDD field issue likely exists

### Why It Matters:
- If field mapping is in an **unmanaged layer**, you have full control to fix it
- You can change the field reference directly
- No framework constraints to work around
- You're responsible for testing and maintaining the fix

---

## Best Practices for Unmanaged Layers

1. **Documentation**
   - Document architecture and decisions
   - Explain why it's unmanaged

2. **Testing**
   - Write comprehensive tests
   - No framework tests to rely on

3. **Code Quality**
   - Follow coding standards
   - Use design patterns
   - Keep it maintainable

4. **Version Control**
   - Track changes carefully
   - Document breaking changes

5. **Monitoring**
   - Add logging and monitoring
   - Track performance and errors

---

## Summary

**Unmanaged Layer = Code You Write and Maintain**

- Not handled by a framework
- Full developer control
- Full developer responsibility
- More flexibility, more work

**Key Takeaway:** In your HSRG system, if the field mapping is in an unmanaged layer, you can directly modify the code to fix the TDD field issue without framework constraints.

---

## Related Terms

- **Managed Layer**: Framework/platform handles it
- **Abstraction Layer**: Hides implementation details
- **Service Layer**: Business logic layer
- **Data Access Layer**: Database interaction layer
- **Presentation Layer**: User interface layer
