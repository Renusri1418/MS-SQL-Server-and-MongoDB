# MongoDB – Data Storage Justification

## 1. Product Reviews

Product reviews are stored in MongoDB because they contain flexible, unstructured text and may have different attributes. MongoDB documents allow this information to be stored without requiring a rigid table structure.

## 2. Search Activity

Search activity is suitable for MongoDB because it involves frequently generated records with flexible fields such as search terms, timestamps, customer IDs and filters. MongoDB supports storing and retrieving these records efficiently.

## 3. JSON Schema Validation

A `$jsonSchema` validator was applied to the `reviews` collection to ensure that mandatory fields are present and that ratings are integers between 1 and 5.

## 4. Operations Performed

- `insertMany()` – Inserted 10 product reviews.
- `find()` – Retrieved all reviews and filtered reviews by product and rating.
- `updateOne()` – Updated Arun's product review.
- `deleteOne()` – Deleted Kiran's product review.

**Final collection count:** 9 documents after the update and delete operations.