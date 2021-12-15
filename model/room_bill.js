const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Room = require('./room');
const Room_bill_detail = require('./room_bill_detail')
const Room_bill = db.define('room_bill', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false,
        autoIncrement:true
    },
  total_price: {
    type: DataTypes.DOUBLE,
    allowNull: false
  },
  total_service: {
    type: DataTypes.DOUBLE,
    allowNull: false
  },
  status: {
    type: DataTypes.STRING,
    allowNull: false
  },
  date_create: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  room_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});
Room_bill.belongsTo(Room,{foreignKey:"room_id"})
Room.hasMany(Room_bill,{foreignKey:"room_id"})

// db.sync();
module.exports = Room_bill;