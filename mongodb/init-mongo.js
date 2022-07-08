db.createUser({
    user: "citizix",
    pwd: "secret",
    roles: [
        {
            role: "readWrite",
            db: "cloud_storage"
        }
    ]
})