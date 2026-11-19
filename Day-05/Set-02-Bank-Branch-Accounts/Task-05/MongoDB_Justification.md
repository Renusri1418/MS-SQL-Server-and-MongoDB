# MongoDB Capped Collection – Customer Activity Logs

## Why MongoDB?

Customer activity logs are suitable for MongoDB because they are generated frequently and contain flexible information. Different activities may have different fields, such as device, search term and transaction amount.

## Capped Collection

A capped collection named `activityLogs` was created with a maximum size of 1 MB and a maximum of 1,000 documents.

Capped collections preserve insertion order and automatically remove older documents when their configured limits are reached.

## Operations Performed

1. Created the `activityLogs` capped collection.
2. Inserted 20 customer activity documents using `insertMany()`.
3. Retrieved activity records using `find()`.
4. Filtered login events for customer CUST001.
5. Sorted the login events by timestamp in descending order.
6. Used `limit(5)` to retrieve the latest five login events.

## Conclusion

MongoDB capped collections are useful for storing recent customer activity logs because they provide bounded storage and automatic removal of older records.