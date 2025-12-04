# Unmanaged Layer - Quick Reference

## What is an Unmanaged Layer?

**Simple Definition:**
Components in your system that you create and manage yourself, not part of a packaged/managed solution.

---

## Salesforce Context (Most Common)

### Unmanaged = Your Custom Stuff
- ✅ Fields you create yourself
- ✅ Objects you build
- ✅ Code you write
- ✅ Customizations in your org

### Managed = From a Package
- 📦 Fields from AppExchange packages
- 📦 Objects from installed packages
- 📦 Code from managed packages
- 📦 Controlled by package developer

---

## How to Tell the Difference

### Check Field API Names:

**Unmanaged Field:**
```
API Name: Telecommunications_Device_for_the_Deaf_TDD__c
Namespace: None (no prefix)
```

**Managed Field:**
```
API Name: hsrg__Telecommunications_Device__c
Namespace: hsrg (package prefix)
```

---

## For Your HSRG TDD Issue

### Questions to Answer:

1. **Is the correct TDD field unmanaged?**
   - Check: Does it have a namespace prefix?
   - If NO namespace → Unmanaged
   - If YES namespace → Managed

2. **Is the wrong (DNU) field unmanaged?**
   - Check field properties
   - Determine source

3. **Is HSRG a managed package?**
   - Check: Setup → Installed Packages
   - Look for HSRG package

4. **Field conflict?**
   - Two fields with similar names
   - One managed, one unmanaged
   - Portal pulling wrong one

---

## Quick Identification Steps

### In Salesforce:
1. Setup → Object Manager
2. Select object (e.g., HSRG Service)
3. Fields & Relationships
4. Click on TDD field
5. Check "Namespace Prefix"
   - Empty = Unmanaged
   - Has value = Managed

### In Code:
```apex
// Unmanaged field reference
Service__c.Telecommunications_Device__c

// Managed field reference  
Service__c.hsrg__TDD__c
```

---

## Common Scenarios

### Scenario 1: Unmanaged Custom Field
- You created: "Telecommunications Device for the Deaf (TDD)"
- This is unmanaged
- Portal should use this

### Scenario 2: Managed Package Field
- HSRG package provides: "TDD"
- This is managed
- Portal might be using this instead

### Scenario 3: Both Exist
- Managed field from package
- Unmanaged field you created
- Portal pulling wrong one
- **Solution**: Update portal to reference correct field

---

## Key Takeaways

1. **Unmanaged** = Your customizations, fully editable
2. **Managed** = From package, protected/controlled
3. **Check namespace** to identify which is which
4. **Field conflicts** can occur between layers
5. **Portal mapping** needs to reference correct field

---

## Action Items for Your Issue

- [ ] Identify if correct TDD field is unmanaged or managed
- [ ] Identify if wrong (DNU) field is unmanaged or managed  
- [ ] Check HSRG package namespace
- [ ] Verify portal field mapping references
- [ ] Update mapping to use correct field (managed or unmanaged)

---

**Remember:** Unmanaged layers are components you control. Managed layers are from packages you've installed.
