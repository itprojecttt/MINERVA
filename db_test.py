from pymongo import MongoClient
client = MongoClient()

db = client.test

# db.child.insert({'age': 3})

for i in db.child.find({}):
    print(i)
