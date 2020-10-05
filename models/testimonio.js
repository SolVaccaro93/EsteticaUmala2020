const pool = require("./../utils/bd");

const getTestimonios = async() => {
    const query = "select * from ?? order by id desc limit 5";
    const rows = await pool.query(query, process.env.TABLA_TESTIMONIO);
    return rows; // [{}]
};

const createTestimonio = async(obj) => {
    try {
        const query = "INSERT INTO ?? SET ?"
        const params = [process.env.TABLA_TESTIMONIO, obj];
        const row = await pool.query(query, params);
        return row;
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    getTestimonios,
    createTestimonio,
};