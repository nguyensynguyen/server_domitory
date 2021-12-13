const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Manager = require('./manager')

const Room = db.define('Room', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false,
        autoIncrement:true
    },
  room_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  status: {
    type: DataTypes.STRING
  },
  max_people: {
    type: DataTypes.INTEGER
  },
  total_current_people: {
    type: DataTypes.INTEGER
  },
  manager_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});
// Room.belongsTo(Manager,{foreignKey:"manager_id"})
// db.sync();
module.exports = Room;