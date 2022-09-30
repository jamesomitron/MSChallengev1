const db = require("../services/db");

const getDbDataService =(query)=>{
    return db.query(query)
    .then((res) => {
      return res
    })
    .catch((err) => err);
}

const postDbDataService = (collection, fields, values)=>{
    return db.query(`INSERT INTO ${collection} ${fields} VALUES ${values}`)
    .then((res)=>{
      return res
    })
    .catch((err)=>{ return {err, message: "Not created"}});
}

module.exports = {
    getDbDataService,
    postDbDataService,
}