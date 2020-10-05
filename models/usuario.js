const pool = require("../utils/bd");

getUsers = async () => {
    try {
      const query =
        "SELECT id, username, name, lastname ,password , mail, isadmin, status FROM ?? order by id desc";
      const params = [process.env.USERS_TABLE];
      const rows = await pool.query(query, params);
      return rows;
    } catch (error) {
      console.log(error);
    }
  };
  
updateAdmin = async(id, isadmin) => {
    const query = "UPDATE ?? SET users.isadmin = ? WHERE id = ?"
    const params = [process.env.USERS_TABLE, isadmin, id];
    return await pool.query(query,params);
}

createUser = async(obj) => {
  try{
    const query = "INSERT into ?? SET ?"
    const params = [process.env.USERS_TABLE, obj]
    return await pool.query(query,params);
  }catch(error){
    console.log(error);
  }
}

logueado = async(usuario, password) => {
  try{
  const query = "SELECT * FROM ?? WHERE username = ? AND password = ?"
  const params = [process.env.USERS_TABLE, usuario, password];
  return await pool.query(query, params);
  }
  catch(error){
      console.log(error)
  }
};

updateUser = async(id, status) => {
  try{ 
    const query = "UPDATE ?? SET users.status = ? WHERE id = ?"
    const params = [process.env.USERS_TABLE, status, id];
    return await pool.query(query, params);
  }
  catch(error){
    console.log(error)
  }
};



  module.exports = {
      getUsers,
      updateAdmin,
      createUser,
      logueado,
      updateUser,
  }