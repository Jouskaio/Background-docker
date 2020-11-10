const MongoClient = require('mongodb').MongoClient;
const assert = require('assert');

(async function() {
    // Connection URL
    const url = 'mongodb://tpDockDB:27017/tpdock';
    // Database Name
    const dbName = 'tpdockbdd';
    const client = new MongoClient(url);

    try {
        // Use connect method to connect to the Server
        await client.connect();

        console.log("Connected correctly to server");

        const db = client.db(dbName);

        // Create a collection
        db.createCollection("users")

        // Get the collection
        const dbUser = db.collection('users');

        // Insert a single document
        const newDocument = await db.collection('users').insertOne({
            name: "Shelka",
            age: 20,
            website: "ms-coding.com"
          });
        assert.equal(1, newDocument.insertedCount);

        // Get first two documents that match the query
        // const displayDates = await dbDate.find().limit(2).toArray();

        // console.log(displayDates)
    } catch (err) {
        console.log(err.stack);
    }

    client.close();
})();
