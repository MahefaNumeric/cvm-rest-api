
function checkIdIfExist(idUser, connection){
    const sql = `SELECT COUNT(id) FROM users WHERE id=${idUser}`;
    connection.query(sql, (error, results, fields) => {
        if(error) throw error;
        console.log("Results: ", results);
        return results[0];
    });
    return null;
}

export default checkIdIfExist;