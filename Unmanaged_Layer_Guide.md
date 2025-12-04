# Unmanaged Layer - Explanation Guide

## Overview
An "unmanaged layer" refers to a component or layer in a system architecture that is **not managed** by a framework, container, or automated system. The term is used in contrast to "managed layers" which are automatically handled by infrastructure or frameworks.

---

## Common Contexts

### 1. Software Architecture / Application Layers

#### Unmanaged Layer
- **Definition**: Code/components that you manually control and manage
- **Characteristics**:
  - You write and maintain all the code
  - No automatic lifecycle management
  - You handle initialization, cleanup, error handling
  - Direct control over resources
  - More flexibility, more responsibility

#### Managed Layer
- **Definition**: Components managed by a framework/container
- **Characteristics**:
  - Framework handles lifecycle (creation, destruction)
  - Automatic dependency injection
  - Built-in error handling
  - Less code to write
  - Less direct control

**Example:**
```
Unmanaged Layer:
- Custom data access code
- Manual connection pooling
- Direct database queries
- Custom business logic

Managed Layer:
- ORM (Object-Relational Mapping) framework
- Dependency injection container
- Framework-managed services
- Auto-configured components
```

---

### 2. Cloud Services / Infrastructure

#### Unmanaged Services
- **Definition**: Infrastructure you fully control and manage
- **You are responsible for**:
  - Server provisioning and scaling
  - Operating system updates
  - Security patches
  - Backup and recovery
  - Monitoring and maintenance

**Examples:**
- Virtual Machines (VMs)
- Unmanaged databases
- Bare metal servers
- Self-hosted applications

#### Managed Services
- **Definition**: Infrastructure managed by the cloud provider
- **Provider handles**:
  - Scaling
  - Updates and patches
  - Backups
  - Monitoring
  - High availability

**Examples:**
- AWS RDS (managed database)
- Azure App Service (managed hosting)
- Google Cloud SQL
- Serverless functions

---

### 3. Data Architecture

#### Unmanaged Data Layer
- **Definition**: Data storage/access you manage directly
- **Characteristics**:
  - Direct database connections
  - Manual query optimization
  - Custom caching logic
  - Manual data migration
  - You handle transactions

**Example:**
```sql
-- Unmanaged: Direct SQL queries
SELECT * FROM users WHERE id = ?
-- You handle connection, error, transaction
```

#### Managed Data Layer
- **Definition**: Data access managed by framework/ORM
- **Characteristics**:
  - ORM handles connections
  - Automatic query optimization
  - Built-in caching
  - Migration tools
  - Framework manages transactions

**Example:**
```python
# Managed: ORM handles everything
user = User.objects.get(id=123)
# Framework handles connection, error, transaction
```

---

### 4. API / Service Layers

#### Unmanaged API Layer
- **Definition**: API endpoints you build and manage manually
- **You handle**:
  - Request routing
  - Authentication/authorization
  - Request validation
  - Error handling
  - Response formatting
  - Rate limiting

**Example:**
```javascript
// Unmanaged: Manual API handling
app.post('/api/users', (req, res) => {
  // You write all validation, error handling, etc.
  if (!req.body.email) {
    return res.status(400).json({error: 'Email required'});
  }
  // ... manual processing
});
```

#### Managed API Layer
- **Definition**: API framework handles common concerns
- **Framework provides**:
  - Automatic routing
  - Built-in validation
  - Standardized error handling
  - Authentication middleware
  - Auto-generated documentation

**Example:**
```python
# Managed: Framework handles common concerns
@api.route('/users', methods=['POST'])
@validate_request(UserSchema)
@require_auth
def create_user(data):
    # Framework handled validation, auth, errors
    return User.create(data)
```

---

## In Context of HSRG System

If "unmanaged layer" was mentioned in your HSRG field mapping analysis, it likely refers to:

### Possible Meanings:

1. **Unmanaged Data Access Layer**
   - Direct database queries instead of ORM
   - Manual field mapping
   - Custom data transformation code

2. **Unmanaged Service Layer**
   - Custom API endpoints
   - Manual request/response handling
   - No framework-managed services

3. **Unmanaged Configuration**
   - Hardcoded field mappings
   - Manual configuration management
   - Not using configuration framework

### Why It Matters for TDD Field Issue:

If the TDD field mapping is in an "unmanaged layer":
- ✅ **Pros**: Direct control, easier to find and change
- ❌ **Cons**: Might be hardcoded, less flexible, harder to maintain

**Investigation Focus:**
- Look for direct database queries
- Check for hardcoded field names
- Find manual field mapping code
- Look for custom data transformation logic

---

## Key Differences Summary

| Aspect | Unmanaged Layer | Managed Layer |
|--------|----------------|---------------|
| **Control** | Full control | Framework controls |
| **Code** | More code to write | Less code needed |
| **Flexibility** | High flexibility | Framework constraints |
| **Maintenance** | You maintain everything | Framework handles some |
| **Complexity** | More complex initially | Simpler to start |
| **Customization** | Easy to customize | May be limited |
| **Updates** | You handle updates | Framework may auto-update |

---

## When to Use Each

### Use Unmanaged Layer When:
- Need maximum control
- Custom requirements not met by frameworks
- Performance-critical code
- Legacy system integration
- Specific security requirements

### Use Managed Layer When:
- Standard functionality needed
- Faster development required
- Team less familiar with low-level details
- Want built-in best practices
- Need automatic scaling/management

---

## Common Patterns

### Hybrid Approach (Most Common)
Many systems use both:
```
┌─────────────────────┐
│  Managed API Layer  │  ← Framework handles routing, auth
├─────────────────────┤
│ Unmanaged Business  │  ← Custom business logic
│      Logic          │
├─────────────────────┤
│  Managed Data Layer │  ← ORM handles data access
└─────────────────────┘
```

---

## Questions to Ask

If someone mentions "unmanaged layer" in your context:

1. **What layer are they referring to?**
   - Data access?
   - API/service?
   - Infrastructure?
   - Configuration?

2. **Why is it unmanaged?**
   - Legacy system?
   - Custom requirements?
   - Performance needs?
   - Migration in progress?

3. **What are the implications?**
   - More manual work?
   - Different maintenance approach?
   - Different testing strategy?
   - Different deployment process?

---

## Related Terms

- **Managed Service**: Cloud service managed by provider
- **Unmanaged Service**: Service you manage yourself
- **Bare Metal**: Unmanaged infrastructure
- **Infrastructure as Code**: Managing infrastructure programmatically
- **Container Orchestration**: Managing containers (Kubernetes, etc.)
- **Serverless**: Fully managed compute (extreme managed)

---

**Note**: The exact meaning depends on your specific system context. In the HSRG TDD field issue, it likely refers to a layer where field mappings are handled manually rather than through a configuration framework.
