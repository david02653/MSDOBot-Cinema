db = db.getSiblingDB('cinema');
db.createUser(
    {
        user: "cinema",
        pwd: "cinema",
        roles: [{ role: "readWrite", db: "cinema" }]
    }
);

db = db.getSiblingDB('grocery');
db.createUser(
    {
        user: "cinema",
        pwd: "cinema",
        roles: [{ role: "readWrite", db: "grocery" }]
);

db = db.getSiblingDB('notification');
db.createUser(
    {
        user: "cinema",
        pwd: "cinema",
        roles: [{ role: "readWrite", db: "notification" }]
);

db = db.getSiblingDB('ordering_list');
db.createUser(
    {
        user: "cinema",
        pwd: "cinema",
        roles: [{ role: "readWrite", db: "ordering_list" }]
);
