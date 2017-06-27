use admin

admin = db.getSiblingDB("admin")
admin.createUser(
  {
    user: "mongousr",
    pwd: "mongousr123456",
    roles: [
        { role: "userAdminAnyDatabase", db: "admin" },
        { role: "clusterMonitor", db: "admin" },
        { role: "root", db: "admin" }
       ]
  }
)

db.getSiblingDB("admin").auth("mongousr", "mongousr123456" )

// creation of the replica set admin user
db.getSiblingDB("admin").createUser(
  {
    "user" : "replicaAdmin",
    "pwd" : "replicaAdminPassword2017",
    roles: [
      { role : "clusterAdmin", db : "admin" },
      { role: "clusterMonitor", db: "admin" }
    ]
  }
)
