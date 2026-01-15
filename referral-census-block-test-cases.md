# Referral Census Block Test Cases

## Scope

* Validate Census Block field in Referral user interface
* Validate Referral exports include Census Block from the referral table
* Validate one time data remediation for existing Referral records

## Test Data Setup

* Referral record with full address and matching Associated Address Details record linked to Assistance details with a related Addresses record that has a Census Block value
* Referral record with full address and no matching Associated Address Details record
* Referral record with an existing Census Block value in the referral table
* Referral record with a missing Census Block value in the referral table
* Access to each Referral export path supported in the system

## Referral User Interface

| ID | Scenario | Preconditions | Steps | Expected Results | Notes |
|:---|:---------|:--------------|:------|:-----------------|:------|
| UI01 | Census Block field appears directly below Zip Code | Referral form is available and Zip Code field is visible | 1. Open a Referral record form. 2. Locate Zip Code field. 3. Verify the field immediately below is Census Block. | Census Block field is present directly below Zip Code with correct label. | None |
| UI02 | Census Block value displays for an existing Referral record | Referral record exists with Census Block populated in referral table | 1. Open the Referral record. 2. Locate the Census Block field. | Census Block field displays the value stored in the referral table. | None |
| UI03 | Empty Census Block remains empty when no value exists | Referral record exists with no Census Block value in referral table | 1. Open the Referral record. 2. Locate the Census Block field. | Census Block field is empty and does not show an incorrect default value. | None |
| UI04 | Census Block value persists after save when editable | Referral record exists and Census Block field is editable | 1. Open the Referral record. 2. Enter a Census Block value. 3. Save the record. 4. Reopen the record. | Entered Census Block value persists and matches the referral table value. | If field is read only, verify it is not editable instead of updating. |

## Referral Data Exports

| ID | Scenario | Preconditions | Steps | Expected Results | Notes |
|:---|:---------|:--------------|:------|:-----------------|:------|
| EX01 | User interface export includes Census Block column | At least one Referral record has a Census Block value | 1. Run a Referral export from the user interface. 2. Open the export file. 3. Locate Census Block column. 4. Validate value for a known Referral record. | Export includes Census Block column and values match referral table values. | Use the standard export method used by operations. |
| EX02 | Bulk or scheduled export includes Census Block column | Access to bulk or scheduled export path exists | 1. Run the bulk or scheduled Referral export. 2. Open the export file. 3. Locate Census Block column. 4. Validate values for known Referral records. | Export includes Census Block column and values match referral table values. | Repeat for each configured scheduled export. |
| EX03 | API or integration export includes Census Block field | API or integration export is available | 1. Run the API or integration export for Referral data. 2. Inspect payload or file output. 3. Verify Census Block field is present. | Census Block field is present and values match referral table values. | Skip if no API or integration export exists. |
| EX04 | Export uses referral table value when it differs from address table | Referral record exists with Census Block value that differs from related Addresses record | 1. Run a Referral export. 2. Locate the record in the export. | Census Block value in export matches the referral table value and not the Addresses table value. | Confirms export mapping source. |

## Data Remediation

| ID | Scenario | Preconditions | Steps | Expected Results | Notes |
|:---|:---------|:--------------|:------|:-----------------|:------|
| DR01 | Populate missing Census Block using matched address | Referral record has missing Census Block and matching Associated Address Details record exists with related Addresses record Census Block value | 1. Run the one time remediation job. 2. Reopen the Referral record. | Referral record Census Block value is populated from the related Addresses record. | Validate in a safe test environment before production. |
| DR02 | Do not overwrite existing Census Block values | Referral record has existing Census Block value | 1. Run the one time remediation job. 2. Reopen the Referral record. | Census Block value remains unchanged. | None |
| DR03 | No update when no matching address exists | Referral record has missing Census Block and no matching Associated Address Details record | 1. Run the one time remediation job. 2. Reopen the Referral record. | Census Block remains empty and record is not updated. | Capture count of unmatched records if logging exists. |
| DR04 | Address matching handles formatting differences | Referral address has format differences from Associated Address Details record but should match | 1. Run the one time remediation job. 2. Reopen the Referral record. | Census Block value is populated for the matched address. | Confirm expected normalization behavior with owners. |
| DR05 | Multiple matching Associated Address Details are resolved correctly | Referral address matches multiple Associated Address Details records | 1. Run the one time remediation job. 2. Reopen the Referral record. | Census Block value follows the defined selection rule. | Confirm selection rule such as primary or most recent. |
| DR06 | Remediated Census Block values appear in exports | Remediation job has updated at least one Referral record | 1. Run a Referral export. 2. Locate updated records in export. | Export shows updated Census Block values for remediated records. | Confirms end to end flow. |
