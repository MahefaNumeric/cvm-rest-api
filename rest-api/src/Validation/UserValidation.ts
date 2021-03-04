
function checkIdIfExist(idUser: number, connection: any){
    const sql = `SELECT COUNT(id) FROM users WHERE id=${idUser}`;
    connection.query(sql, (error: any, results: any, fields: any) => {
        if(error) throw error;
        console.log("Results: ", results);
        return results[0];
    });
    return null;
}

export default checkIdIfExist;