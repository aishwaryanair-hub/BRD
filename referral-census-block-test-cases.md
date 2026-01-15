# Referral Census Block Test Cases

## Scope

These test cases validate that the Census Block field appears in the Referral form UI directly below the Zip Code field and that the Census Block value is included in all Referral data exports.

## Test Cases

| Test ID | Scenario | Prerequisites | Steps | Expected Result |
|:---|:---|:---|:---|:---|
| REF_UI_001 | Referral form shows Census Block field below Zip Code | User can open the Referral form | 1. Open the Referral form for a new referral.<br>2. Locate the Zip Code field.<br>3. Verify the Census Block field is positioned directly below Zip Code. | Census Block field is visible directly below Zip Code with the correct label. |
| REF_UI_002 | Referral form displays stored Census Block value | A referral record exists with a known Census Block value in the referral table | 1. Open the referral record in the Referral form.<br>2. Locate the Census Block field. | Census Block value matches the value stored in the referral table. |
| REF_EXPORT_001 | Referral export includes Census Block values | Two referral records exist, one with Census Block value and one without | 1. Run a Referral data export.<br>2. Open the exported file.<br>3. Locate the Census Block column.<br>4. Compare the exported values to the referral records. | Census Block column is present and values match the referral table for each record. Records without a Census Block value remain blank. |
| REF_EXPORT_002 | Census Block included in each Referral export option | User can access all Referral export options available in the system | 1. Run each available Referral export option in the system.<br>2. Open each exported file.<br>3. Locate the Census Block column. | Each Referral export includes a Census Block column populated from the referral table. |
