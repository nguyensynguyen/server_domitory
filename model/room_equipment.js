const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Room = require('./room');

const Room_equipment = db.define('room_equipment', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false,
        autoIncrement:true
    },
  room_equipment_name: {
    type: DataTypes.STRING,
    allowNull: false
  },

  room_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});
Room_equipment.belongsTo(Room,{foreignKey:"room_id"})
// db.sync();
module.exports = Room_equipment;