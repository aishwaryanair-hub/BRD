# What are Unmanaged Layers?

## Overview
An **unmanaged layer** refers to a layer in a system architecture where developers have direct control and responsibility, as opposed to a **managed layer** where the platform/framework handles operations automatically.

---

## Common Contexts

### 1. Software Architecture Layers

#### Managed Layer
- Framework/platform handles operations automatically
- Less control, but easier to use
- Examples: ORM frameworks, managed services

#### Unmanaged Layer
- Developers have full control
- More flexibility, but more responsibility
- Examples: Direct database access, custom implementations

**Example in Layered Architecture:**
```
┌─────────────────────────────────┐
│   Presentation Layer (Managed)  │  ← Framework handles UI rendering
├─────────────────────────────────┤
│   Business Logic (Unmanaged)    │  ← Your custom code
├─────────────────────────────────┤
│   Data Access (Unmanaged)       │  ← Direct SQL/custom queries
├─────────────────────────────────┤
│   Database (Managed)            │  ← Database engine handles storage
└─────────────────────────────────┘
```

---

### 2. Cloud Services (AWS, Azure, GCP)

#### Managed Services
- Platform handles infrastructure, scaling, maintenance
- Examples: AWS Lambda, Azure Functions, RDS

#### Unmanaged Services
- You manage the infrastructure yourself
- Examples: EC2 instances, self-hosted databases

**Example:**
- **Managed Database**: AWS RDS (AWS handles backups, scaling, patching)
- **Unmanaged Database**: EC2 instance with MySQL installed (you handle everything)

---

### 3. Data Architecture

#### Managed Data Layer
- Framework handles data access automatically
- Examples: Entity Framework, Hibernate ORM

#### Unmanaged Data Layer
- Direct database access
- Custom SQL queries
- Manual connection management
- Examples: ADO.NET, JDBC, raw SQL

**Code Example:**

**Managed (ORM):**
```csharp
// Entity Framework - managed
var users = context.Users.Where(u => u.Active).ToList();
```

**Unmanaged (Direct Access):**
```csharp
// ADO.NET - unmanaged
using (var connection = new SqlConnection(connectionString))
{
    var command = new SqlCommand("SELECT * FROM Users WHERE Active = 1", connection);
    // Manual connection, command, and data reader management
}
```

---

### 4. Application Layers (N-Tier Architecture)

#### Typical Layers:

1. **Presentation Layer** (Often Managed)
   - UI frameworks handle rendering
   - Managed by React, Angular, Vue, etc.

2. **Business Logic Layer** (Usually Unmanaged)
   - Your custom business rules
   - Full control over logic

3. **Data Access Layer** (Can be Managed or Unmanaged)
   - **Managed**: ORM frameworks
   - **Unmanaged**: Direct database access

4. **Database Layer** (Managed by DB Engine)
   - Database engine handles storage

---

## Key Characteristics

### Unmanaged Layers

**Advantages:**
- ✅ Full control and flexibility
- ✅ Can optimize for specific needs
- ✅ No framework limitations
- ✅ Better performance (if optimized correctly)
- ✅ Direct access to underlying resources

**Disadvantages:**
- ❌ More code to write and maintain
- ❌ More responsibility (error handling, connection management)
- ❌ Higher risk of bugs
- ❌ More time-consuming
- ❌ Need to handle edge cases manually

### Managed Layers

**Advantages:**
- ✅ Less code to write
- ✅ Framework handles common tasks
- ✅ Built-in best practices
- ✅ Faster development
- ✅ Less error-prone

**Disadvantages:**
- ❌ Less control
- ❌ Framework limitations
- ❌ Potential performance overhead
- ❌ Learning curve for framework
- ❌ May not fit all use cases

---

## Real-World Example: HSRG System Context

In the context of your HSRG field mapping issue:

```
┌─────────────────────────────────────┐
│   Portal Frontend (Managed)        │  ← React/Angular handles UI
├─────────────────────────────────────┤
│   API Layer (Unmanaged)             │  ← Your custom API code
│   - Field mapping logic             │
│   - Data transformation             │
├─────────────────────────────────────┤
│   Data Access (Unmanaged)           │  ← Direct DB queries or ORM
│   - Field selection                 │
│   - Query building                  │
├─────────────────────────────────────┤
│   Database (Managed)                │  ← SQL Server/Oracle handles storage
└─────────────────────────────────────┘
```

**In Your TDD Field Issue:**
- The **field mapping** likely happens in an **unmanaged layer** (your API/backend code)
- You have direct control to change which field is selected
- This is where you'd fix the mapping from wrong field to correct field

---

## When to Use Unmanaged vs Managed

### Use Unmanaged When:
- Need maximum performance
- Framework doesn't support your use case
- Need direct access to resources
- Complex custom requirements
- Legacy system integration

### Use Managed When:
- Standard operations
- Rapid development needed
- Team less experienced
- Framework fits requirements
- Want built-in features (caching, validation, etc.)

---

## Hybrid Approach

Many systems use a **hybrid approach**:

```
┌─────────────────────────────────┐
│   Managed Layer (ORM)            │  ← For standard CRUD operations
├─────────────────────────────────┤
│   Unmanaged Layer (Raw SQL)     │  ← For complex queries, performance
└─────────────────────────────────┘
```

**Example:**
- Use Entity Framework for simple queries (managed)
- Use raw SQL for complex reports (unmanaged)

---

## Summary

**Unmanaged Layer = Your Code, Your Control**
- You write the code
- You manage resources
- You handle errors
- You optimize performance
- Full flexibility

**Managed Layer = Framework Handles It**
- Framework writes the code
- Framework manages resources
- Framework handles common errors
- Framework provides optimizations
- Less flexibility, more convenience

---

## In Your HSRG Context

For your TDD field mapping issue:
- The **field selection/mapping** is likely in an **unmanaged layer** (your backend code)
- You can directly change which field is referenced
- This gives you control to fix the issue
- You may need to update:
  - API code (unmanaged)
  - Data access code (unmanaged)
  - Configuration files (unmanaged configuration)

The fix will be in the unmanaged layer where you have direct control over field selection.
