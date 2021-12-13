const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');


const DetailOrder = db.define('Detail_orders', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false
    },
  order_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  price_1: {
    type: DataTypes.STRING
  },
  order_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});
db.sync();
module.exports = DetailOrder;