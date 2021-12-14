const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Room = require('./room');
const Room_equipment_status = require('./room_equipment_status')
const Room_equipment = db.define('room_equipment', {
  id: {
    primaryKey: true,
    type: DataTypes.INTEGER,
    allowNull: false,
    autoIncrement: true
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

Room_equipment.belongsTo(Room, { foreignKey: "room_id" })
Room.hasMany(Room_equipment, { foreignKey: "room_id" })

Room_equipment_status.belongsTo(Room_equipment, { foreignKey: "room_equipment_id" })
Room_equipment.hasMany(Room_equipment_status, { foreignKey: "room_equipment_id" })

// db.sync();
module.exports = Room_equipment;