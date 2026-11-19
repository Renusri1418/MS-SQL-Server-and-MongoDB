# Task 5 – MongoDB Clinical Notes

## 1. Why MongoDB?

Clinical notes are suitable for MongoDB because medical records can contain different types of information depending on the patient's condition. Some visits may contain prescriptions and observations, while others may contain vital signs and laboratory results.

MongoDB supports flexible document structures, making it suitable for storing these varying clinical details.

## 2. Collection Creation and Validation

A collection named `clinicalNotes` was created in the `HospitalClinicalDB` database.

A `$jsonSchema` validator was applied to ensure that every document contains:

- patientId
- visitDate
- diagnosis

Optional fields include prescription, observations, vitalSigns, labResults and followUpRequired.

## 3. Two Different Document Structures

**Document Type 1 – General Clinical Notes**

Contains patient ID, visit date, diagnosis, prescription, observations and follow-up information.

**Document Type 2 – Clinical Notes with Test Results**

Contains patient ID, visit date, diagnosis, vital signs, laboratory results and follow-up information.

## 4. Query Performed

The `find()` operation was used to retrieve clinical notes by diagnosis.

Example:

`db.clinicalNotes.find({ diagnosis: "Hypertension" })`

This retrieves the clinical records of patients diagnosed with hypertension.

## 5. Conclusion
