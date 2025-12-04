# HSRG TDD Field Issue - Quick Analysis Checklist

## Quick Start Analysis Steps

### Step 1: Find the Code (15-30 min)
- [ ] Search codebase for: `"(DNU) Telecommunications Device"`
- [ ] Search codebase for: `"Telecommunications Device for the Deaf (TDD)"`
- [ ] Search for: `TDD` (filter for HSRG/portal related)
- [ ] Search for: `HSRG` + `field` or `mapping`
- [ ] Check configuration files for field mappings

### Step 2: Identify the System Layer (30 min)
- [ ] **Frontend/Portal**: Find component displaying TDD field
- [ ] **API/Backend**: Find endpoint serving HSRG data
- [ ] **Database**: Check schema for both TDD field names
- [ ] **Mapping Layer**: Find where field selection happens

### Step 3: Document Current State (30 min)
- [ ] Note exact field names in database
- [ ] Note where wrong field is referenced in code
- [ ] Note where correct field should be referenced
- [ ] Count affected records (if possible)

### Step 4: Determine Solution (30 min)
- [ ] Is it a simple field name change?
- [ ] Is it a configuration update?
- [ ] Does data need migration?
- [ ] What's the simplest fix?

### Step 5: Create Fix Plan (30 min)
- [ ] List files that need changes
- [ ] List configuration that needs updates
- [ ] Determine testing needed
- [ ] Estimate effort

---

## Key Questions to Answer

1. **Where is the field mapping?**
   - [ ] Configuration file?
   - [ ] Hardcoded in code?
   - [ ] Database mapping table?
   - [ ] API transformation layer?

2. **What needs to change?**
   - [ ] Field name reference?
   - [ ] Field ID/code?
   - [ ] Mapping configuration?
   - [ ] All of the above?

3. **Is there data to preserve?**
   - [ ] Data in wrong field?
   - [ ] Data in correct field?
   - [ ] Need data migration?

4. **What's the risk?**
   - [ ] Breaking change?
   - [ ] Other systems affected?
   - [ ] User impact?

---

## Code Search Commands

```bash
# Search for the wrong field
grep -r "(DNU) Telecommunications Device" /path/to/codebase

# Search for TDD references
grep -r "TDD" /path/to/codebase | grep -i hsrg

# Search for field mapping configs
grep -r "field.*map\|mapping\|field.*config" /path/to/codebase

# Search for HSRG service type
grep -r "HSRG\|basic need service" /path/to/codebase
```

---

## Common Locations to Check

### Frontend
- [ ] Portal component files
- [ ] Field display components
- [ ] Data table/grid components
- [ ] Form field definitions

### Backend/API
- [ ] API controllers
- [ ] Service layer
- [ ] Data access layer
- [ ] DTO/Model definitions

### Configuration
- [ ] application.properties/config files
- [ ] Field mapping JSON/XML files
- [ ] Database configuration
- [ ] Environment-specific configs

### Database
- [ ] Table schemas
- [ ] View definitions
- [ ] Stored procedures
- [ ] Field mapping tables

---

## Quick Fix Scenarios

### Scenario A: Simple Field Name Change
**If:** Field reference is hardcoded in one place
**Then:** Change field name from wrong to correct
**Time:** 1-2 hours

### Scenario B: Configuration Update
**If:** Field mapping in config file
**Then:** Update config to point to correct field
**Time:** 1-2 hours

### Scenario C: Multiple References
**If:** Field referenced in multiple places
**Then:** Update all references systematically
**Time:** 4-8 hours

### Scenario D: Data Migration Needed
**If:** Data exists in wrong field
**Then:** Migrate data + update mapping
**Time:** 1-2 days

---

## Deliverables

After analysis, you should have:
- [ ] Document showing where wrong field is referenced
- [ ] Document showing correct field location
- [ ] List of files/components to change
- [ ] Solution approach recommendation
- [ ] Implementation steps
- [ ] Testing plan
- [ ] Risk assessment

---

**Time Estimate for Full Analysis: 2-4 hours**
