const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Room_bill = require('./room_bill');

const Room_bill_detail = db.define('room_bill_detail', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false,
        autoIncrement:true
    },
  service_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  number_start: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  number_end: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  amount_used: {
    type: DataTypes.DOUBLE,
    allowNull: false
  },
  total_price: {
    type: DataTypes.DOUBLE,
    allowNull: false
  },
  room_bill_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});
Room_bill_detail.belongsTo(Room_bill,{foreignKey:"room_bill_id"})
Room_bill.hasMany(Room_bill_detail,{foreignKey:"room_bill_id"})

// db.sync();
module.exports = Room_bill_detail;