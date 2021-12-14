const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Room_equipment = require('./room_equipment');

const Room_equipment_status = db.define('room_equipment_status', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false,
        autoIncrement:true
    },
  status: {
    type: DataTypes.STRING,
    allowNull: false
  },

  room_equipment_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});

// db.sync();
module.exports = Room_equipment_status;