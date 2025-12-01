# Consolidated Other Funding Source - Logic Specification

## Business Requirement

**Field:** Consolidated Other Funding Source  
**Location:** Needs & Outcome Record  
**Source:** Other Funding Source Amounts Table  
**Trigger:** Upon creation of Needs & Outcome record

---

## Logic Flow

### 1. Trigger Event
```
WHEN Needs & Outcome record is CREATED
THEN execute consolidation logic
```

### 2. Data Retrieval
```
STEP 1: Identify related "Other Funding Source Amounts" records
  - Query: SELECT * FROM Other_Funding_Source_Amounts 
           WHERE [Relationship_Field] = [Needs_Outcome_Record_ID]
           OR WHERE [Common_Identifier] = [Needs_Outcome_Common_ID]

STEP 2: Extract "Other Funding Source" field values
  - For each related record, get: Other_Funding_Source field value
  - Store in temporary array/list: fundingSources[]
```

### 3. Data Consolidation
```
STEP 3: Process and consolidate values
  IF fundingSources[] is EMPTY:
    SET Consolidated_Other_Funding_Source = NULL or ""
  
  ELSE IF fundingSources[] has ONE value:
    SET Consolidated_Other_Funding_Source = fundingSources[0]
  
  ELSE IF fundingSources[] has MULTIPLE values:
    OPTION A (Comma-separated):
      SET Consolidated_Other_Funding_Source = 
          JOIN(fundingSources[], ", ")
      Example: "Source A, Source B, Source C"
    
    OPTION B (Semicolon-separated):
      SET Consolidated_Other_Funding_Source = 
          JOIN(fundingSources[], "; ")
      Example: "Source A; Source B; Source C"
    
    OPTION C (Line break):
      SET Consolidated_Other_Funding_Source = 
          JOIN(fundingSources[], "\n")
      Example: "Source A\nSource B\nSource C"
    
    OPTION D (Remove duplicates first):
      SET uniqueSources = REMOVE_DUPLICATES(fundingSources[])
      SET Consolidated_Other_Funding_Source = JOIN(uniqueSources[], ", ")
```

### 4. Data Assignment
```
STEP 4: Populate the field
  SET Needs_Outcome_Record.Consolidated_Other_Funding_Source = 
      Consolidated_Other_Funding_Source
```

---

## Pseudocode

```pseudocode
FUNCTION populateConsolidatedOtherFundingSource(needsOutcomeRecordId) {
  
  // Step 1: Retrieve related records
  relatedFundingSources = QUERY(
    SELECT Other_Funding_Source 
    FROM Other_Funding_Source_Amounts 
    WHERE Relationship_Field = needsOutcomeRecordId
    ORDER BY Created_Date ASC  // Optional: maintain order
  )
  
  // Step 2: Check if records exist
  IF relatedFundingSources IS EMPTY THEN
    RETURN NULL or ""
  END IF
  
  // Step 3: Extract values into array
  fundingSourceArray = []
  FOR EACH record IN relatedFundingSources DO
    IF record.Other_Funding_Source IS NOT NULL AND 
       record.Other_Funding_Source IS NOT EMPTY THEN
      ADD record.Other_Funding_Source TO fundingSourceArray
    END IF
  END FOR
  
  // Step 4: Remove duplicates (optional)
  uniqueFundingSources = REMOVE_DUPLICATES(fundingSourceArray)
  
  // Step 5: Consolidate values
  IF uniqueFundingSources.LENGTH == 0 THEN
    consolidatedValue = ""
  ELSE IF uniqueFundingSources.LENGTH == 1 THEN
    consolidatedValue = uniqueFundingSources[0]
  ELSE
    // Join multiple values with delimiter
    consolidatedValue = JOIN(uniqueFundingSources, ", ")
  END IF
  
  // Step 6: Update Needs & Outcome record
  UPDATE Needs_Outcome_Record
  SET Consolidated_Other_Funding_Source = consolidatedValue
  WHERE ID = needsOutcomeRecordId
  
  RETURN consolidatedValue
END FUNCTION
```

---

## SQL Implementation Example

```sql
-- Option 1: Using STRING_AGG (SQL Server, PostgreSQL)
UPDATE no
SET Consolidated_Other_Funding_Source = (
    SELECT STRING_AGG(DISTINCT ofsa.Other_Funding_Source, ', ')
    FROM Other_Funding_Source_Amounts ofsa
    WHERE ofsa.Relationship_Field = no.ID
      AND ofsa.Other_Funding_Source IS NOT NULL
      AND ofsa.Other_Funding_Source != ''
)
FROM Needs_Outcome_Record no
WHERE no.ID = @NeedsOutcomeRecordId;

-- Option 2: Using FOR XML PATH (SQL Server)
UPDATE no
SET Consolidated_Other_Funding_Source = (
    SELECT DISTINCT ofsa.Other_Funding_Source + ', '
    FROM Other_Funding_Source_Amounts ofsa
    WHERE ofsa.Relationship_Field = no.ID
      AND ofsa.Other_Funding_Source IS NOT NULL
      AND ofsa.Other_Funding_Source != ''
    FOR XML PATH('')
)
FROM Needs_Outcome_Record no
WHERE no.ID = @NeedsOutcomeRecordId;

-- Option 3: Using GROUP_CONCAT (MySQL)
UPDATE Needs_Outcome_Record no
SET Consolidated_Other_Funding_Source = (
    SELECT GROUP_CONCAT(DISTINCT ofsa.Other_Funding_Source SEPARATOR ', ')
    FROM Other_Funding_Source_Amounts ofsa
    WHERE ofsa.Relationship_Source = no.ID
      AND ofsa.Other_Funding_Source IS NOT NULL
      AND ofsa.Other_Funding_Source != ''
)
WHERE no.ID = @NeedsOutcomeRecordId;
```

---

## JavaScript/TypeScript Implementation Example

```javascript
/**
 * Populates Consolidated Other Funding Source field
 * @param {string} needsOutcomeRecordId - ID of the Needs & Outcome record
 * @param {string} relationshipField - Field name linking the tables
 * @returns {Promise<string>} Consolidated funding source string
 */
async function populateConsolidatedOtherFundingSource(
  needsOutcomeRecordId, 
  relationshipField = 'Needs_Outcome_ID'
) {
  try {
    // Step 1: Query related Other Funding Source Amounts records
    const relatedRecords = await db.query(`
      SELECT DISTINCT Other_Funding_Source
      FROM Other_Funding_Source_Amounts
      WHERE ${relationshipField} = ?
        AND Other_Funding_Source IS NOT NULL
        AND Other_Funding_Source != ''
      ORDER BY Other_Funding_Source ASC
    `, [needsOutcomeRecordId]);

    // Step 2: Extract and consolidate values
    let consolidatedValue = '';
    
    if (relatedRecords.length === 0) {
      consolidatedValue = '';
    } else if (relatedRecords.length === 1) {
      consolidatedValue = relatedRecords[0].Other_Funding_Source;
    } else {
      // Join multiple values with comma and space
      const sources = relatedRecords.map(record => record.Other_Funding_Source);
      consolidatedValue = sources.join(', ');
    }

    // Step 3: Update Needs & Outcome record
    await db.query(`
      UPDATE Needs_Outcome_Record
      SET Consolidated_Other_Funding_Source = ?
      WHERE ID = ?
    `, [consolidatedValue, needsOutcomeRecordId]);

    return consolidatedValue;
  } catch (error) {
    console.error('Error populating consolidated funding source:', error);
    throw error;
  }
}

// Usage in record creation trigger
async function onCreateNeedsOutcomeRecord(recordId) {
  // ... other creation logic ...
  
  // Populate consolidated field
  await populateConsolidatedOtherFundingSource(recordId);
  
  // ... continue with other logic ...
}
```

---

## Python Implementation Example

```python
def populate_consolidated_other_funding_source(needs_outcome_record_id: str) -> str:
    """
    Populates Consolidated Other Funding Source field from related records.
    
    Args:
        needs_outcome_record_id: ID of the Needs & Outcome record
        
    Returns:
        Consolidated funding source string
    """
    # Step 1: Query related Other Funding Source Amounts records
    query = """
        SELECT DISTINCT Other_Funding_Source
        FROM Other_Funding_Source_Amounts
        WHERE Relationship_Field = ?
          AND Other_Funding_Source IS NOT NULL
          AND Other_Funding_Source != ''
        ORDER BY Other_Funding_Source ASC
    """
    
    related_records = db.execute(query, (needs_outcome_record_id,))
    
    # Step 2: Extract values
    funding_sources = [
        record['Other_Funding_Source'] 
        for record in related_records 
        if record['Other_Funding_Source']
    ]
    
    # Step 3: Consolidate values
    if not funding_sources:
        consolidated_value = ''
    elif len(funding_sources) == 1:
        consolidated_value = funding_sources[0]
    else:
        # Join multiple values with comma and space
        consolidated_value = ', '.join(funding_sources)
    
    # Step 4: Update Needs & Outcome record
    update_query = """
        UPDATE Needs_Outcome_Record
        SET Consolidated_Other_Funding_Source = ?
        WHERE ID = ?
    """
    db.execute(update_query, (consolidated_value, needs_outcome_record_id))
    
    return consolidated_value

# Usage in record creation
def create_needs_outcome_record(record_data):
    # Create the record
    record_id = db.insert('Needs_Outcome_Record', record_data)
    
    # Populate consolidated field
    populate_consolidated_other_funding_source(record_id)
    
    return record_id
```

---

## Configuration Options

### Delimiter Options
| Option | Delimiter | Use Case |
|--------|-----------|----------|
| Comma | `, ` | Standard list format |
| Semicolon | `; ` | When commas might be in values |
| Line Break | `\n` | Multi-line display |
| Pipe | `\|` | Technical/import formats |

### Duplicate Handling
- **Remove Duplicates:** Yes (recommended)
- **Case Sensitivity:** Specify (case-sensitive or case-insensitive)
- **Trim Whitespace:** Yes (recommended)

### Null/Empty Handling
- **Skip NULL values:** Yes
- **Skip Empty strings:** Yes
- **Default value if no sources:** Empty string or NULL

---

## Edge Cases & Error Handling

### Scenario 1: No Related Records
```
IF no related records found:
  SET Consolidated_Other_Funding_Source = NULL or ""
  LOG: "No funding sources found for record {ID}"
```

### Scenario 2: All Values Are NULL/Empty
```
IF all Other_Funding_Source values are NULL or empty:
  SET Consolidated_Other_Funding_Source = NULL or ""
  LOG: "All funding sources are empty for record {ID}"
```

### Scenario 3: Relationship Field Not Set
```
IF Relationship_Field is NULL:
  SKIP consolidation
  LOG WARNING: "Cannot consolidate - relationship field not set"
```

### Scenario 4: Multiple Records with Same Value
```
IF duplicate values exist:
  REMOVE duplicates before consolidation
  Example: ["Source A", "Source A", "Source B"] → "Source A, Source B"
```

### Scenario 5: Very Long Consolidated String
```
IF consolidated string length > MAX_FIELD_LENGTH:
  TRUNCATE to MAX_FIELD_LENGTH
  APPEND "..." if truncated
  LOG WARNING: "Consolidated value truncated for record {ID}"
```

---

## Testing Scenarios

| Test Case | Input | Expected Output |
|-----------|-------|-----------------|
| No related records | 0 records | Empty string or NULL |
| Single record | 1 record with "Source A" | "Source A" |
| Multiple unique | 3 records: A, B, C | "Source A, Source B, Source C" |
| Duplicates | 3 records: A, A, B | "Source A, Source B" |
| NULL values | 2 records: NULL, "Source A" | "Source A" |
| Empty strings | 2 records: "", "Source A" | "Source A" |
| Mixed case | "Source A", "source a" | "Source A, source a" (if case-sensitive) or "Source A" (if case-insensitive) |

---

## Implementation Checklist

- [ ] Identify relationship field between tables
- [ ] Determine delimiter preference (comma, semicolon, etc.)
- [ ] Decide on duplicate handling (remove or keep)
- [ ] Set case sensitivity rules
- [ ] Implement null/empty value filtering
- [ ] Add error handling for edge cases
- [ ] Create unit tests for all scenarios
- [ ] Test with real data
- [ ] Document field length limitations
- [ ] Set up logging for troubleshooting
- [ ] Consider update trigger (if source data changes)

---

## Notes

1. **Timing:** This logic executes upon Needs & Outcome record creation
2. **One-time vs. Recurring:** Determine if this should also run on updates
3. **Performance:** Consider indexing the relationship field for faster queries
4. **Data Integrity:** Ensure relationship field is properly maintained
5. **Audit Trail:** Consider logging when consolidation occurs
