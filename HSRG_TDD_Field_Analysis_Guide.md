# HSRG TDD Field Mapping Issue - Analysis Guide

## Problem Statement
In all HSRG basic need service type records, the TDD field displayed on the public-facing portal is incorrect. The system is pulling from "(DNU) Telecommunications Device for the Deaf (TDD)" instead of the correct field "Telecommunications Device for the Deaf (TDD)".

**Current State:**
- ❌ Wrong field: "(DNU) Telecommunications Device for the Deaf (TDD)" - displayed on portal
- ✅ Correct field: "Telecommunications Device for the Deaf (TDD)" - available but not used
- ⚠️ Temporary workaround: CSP manually uploading data to wrong field (not recommended by IT)

**Desired State:**
- ✅ Portal displays data from "Telecommunications Device for the Deaf (TDD)" field

---

## Analysis Framework

### Phase 1: Discovery & Documentation

#### 1.1 Identify System Components
- [ ] **Database/Data Source**
  - Where is the HSRG data stored?
  - What is the exact field name in the database?
  - What is the field type/format?
  - Are there any field aliases or mappings?

- [ ] **Data Layer/API**
  - What API or service layer retrieves HSRG data?
  - Where is the field mapping configured?
  - Are there any transformation rules?

- [ ] **Frontend/Portal**
  - What technology is the portal built on?
  - Where is the field reference in the portal code?
  - What is the display label/format?

#### 1.2 Document Current Field Configuration
```
Correct Field:
- Name: "Telecommunications Device for the Deaf (TDD)"
- Database Field ID: [TBD]
- Field Type: [TBD]
- Location: [TBD]

Incorrect Field (Currently Used):
- Name: "(DNU) Telecommunications Device for the Deaf (TDD)"
- Database Field ID: [TBD]
- Field Type: [TBD]
- Location: [TBD]
- Status: DNU (Do Not Use)
```

#### 1.3 Identify Affected Records
- [ ] How many HSRG basic need service type records are affected?
- [ ] Are there any records with data in the correct field?
- [ ] Are there any records with data in the wrong field?
- [ ] What is the data migration impact?

---

### Phase 2: Root Cause Analysis

#### 2.1 Trace Data Flow
```
[Database] → [API/Service Layer] → [Portal Frontend] → [User Display]
```

**Investigation Points:**
- [ ] Where in the code is the field reference?
- [ ] Is there a configuration file with field mappings?
- [ ] Are there any hardcoded field names?
- [ ] Is there a field mapping table/configuration?

#### 2.2 Identify Mapping Location
Check these common locations:
- [ ] API endpoint definitions
- [ ] Data transformation scripts
- [ ] Configuration files (JSON, XML, YAML, properties files)
- [ ] Database views or stored procedures
- [ ] Frontend component code
- [ ] Field mapping tables in database
- [ ] ETL/Data pipeline configurations

#### 2.3 Code Search Strategy
Search for these terms in codebase:
- [ ] "(DNU) Telecommunications Device for the Deaf"
- [ ] "TDD" (may have multiple matches)
- [ ] Field IDs or codes associated with TDD
- [ ] HSRG service type configurations
- [ ] Portal field mapping configurations

---

### Phase 3: Impact Analysis

#### 3.1 Technical Impact
- [ ] **Breaking Changes Risk**
  - Will changing the field break existing integrations?
  - Are there other systems consuming this data?
  - Are there any dependencies on the current field?

- [ ] **Data Migration**
  - Does data need to be migrated from wrong field to correct field?
  - How many records need migration?
  - What is the data quality in the wrong field?

- [ ] **Testing Requirements**
  - What test cases are needed?
  - What environments need testing?
  - Regression testing scope?

#### 3.2 Business Impact
- [ ] **User Impact**
  - How many users are affected?
  - What is the user experience impact?
  - Are there accessibility concerns?

- [ ] **Data Accuracy**
  - Is incorrect data currently being displayed?
  - What is the business impact of wrong data?

#### 3.3 Timeline Considerations
- [ ] Urgency of fix
- [ ] Deployment windows
- [ ] Resource availability
- [ ] Dependencies on other work

---

### Phase 4: Solution Design

#### 4.1 Solution Options

**Option A: Direct Field Mapping Change**
- Change portal/API to reference correct field
- Pros: Simple, direct fix
- Cons: May need data migration if wrong field has data

**Option B: Field Mapping Update**
- Update configuration/mapping table to point to correct field
- Pros: Configuration-based, easier to maintain
- Cons: Requires mapping infrastructure

**Option C: Data Migration + Field Change**
- Migrate data from wrong field to correct field, then update mapping
- Pros: Preserves existing data
- Cons: More complex, requires data validation

#### 4.2 Recommended Approach
[To be determined based on analysis findings]

**Considerations:**
- [ ] Is there data in the wrong field that needs preservation?
- [ ] What is the simplest fix that meets requirements?
- [ ] What maintains system integrity?

---

### Phase 5: Implementation Plan

#### 5.1 Pre-Implementation
- [ ] Document current state
- [ ] Get stakeholder approval
- [ ] Create backup/rollback plan
- [ ] Prepare test data

#### 5.2 Implementation Steps
1. [ ] Update field mapping/configuration
2. [ ] Update code references (if hardcoded)
3. [ ] Perform data migration (if needed)
4. [ ] Update documentation
5. [ ] Remove temporary workaround

#### 5.3 Testing
- [ ] Unit tests
- [ ] Integration tests
- [ ] Portal display verification
- [ ] Data accuracy validation
- [ ] Regression testing

#### 5.4 Deployment
- [ ] Deploy to test environment
- [ ] User acceptance testing
- [ ] Deploy to production
- [ ] Monitor for issues
- [ ] Verify fix in production

---

## Investigation Checklist

### Immediate Actions
- [ ] Search codebase for "(DNU) Telecommunications Device"
- [ ] Search codebase for "TDD" field references
- [ ] Locate HSRG service type configuration
- [ ] Find portal field mapping configuration
- [ ] Identify API endpoints serving HSRG data
- [ ] Check database schema for both TDD fields
- [ ] Review any existing documentation on field mappings

### Code Locations to Check
- [ ] Frontend components displaying HSRG data
- [ ] API controllers/services
- [ ] Data access layer/repositories
- [ ] Configuration files
- [ ] Database views/queries
- [ ] Field mapping tables
- [ ] ETL/data pipeline scripts

### Questions to Answer
1. Where is the field mapping defined?
2. Is it hardcoded or configurable?
3. Are there other fields with similar issues?
4. What is the data state in both fields?
5. What is the deployment process?
6. Who needs to approve the change?

---

## Documentation Template

### Issue Summary
```
Issue ID: [TBD]
Title: HSRG TDD Field Mapping Incorrect
Severity: [High/Medium/Low]
Status: [Open/In Progress/Resolved]
```

### Technical Details
```
Affected System: HSRG Portal
Affected Component: Field Mapping/Display
Root Cause: [TBD after analysis]
Solution: [TBD after analysis]
```

### Change Details
```
Files Changed: [List]
Configuration Changes: [List]
Database Changes: [List]
API Changes: [List]
```

---

## Next Steps

1. **Start Investigation**
   - Use code search tools to find field references
   - Review system architecture documentation
   - Interview developers familiar with the system

2. **Document Findings**
   - Create issue ticket/document
   - Document current vs. desired state
   - Identify all affected components

3. **Design Solution**
   - Choose best approach based on findings
   - Create detailed implementation plan
   - Get stakeholder approval

4. **Implement & Test**
   - Make the changes
   - Test thoroughly
   - Deploy to production

5. **Verify & Close**
   - Verify fix in production
   - Remove temporary workaround
   - Update documentation
   - Close issue

---

## Tools & Resources Needed

- [ ] Access to codebase/repository
- [ ] Database access for schema review
- [ ] API documentation
- [ ] System architecture diagrams
- [ ] Access to test/production environments
- [ ] Code search tools (grep, IDE search, etc.)
- [ ] Database query tools

---

**Note:** This analysis should be conducted in collaboration with IT team members familiar with the HSRG system architecture and portal implementation.
