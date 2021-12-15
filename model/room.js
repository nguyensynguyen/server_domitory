const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Manager = require('./manager')
const User = require('./users')
const Message = require('./message')


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
  room_amount: {
    type: DataTypes.DOUBLE
  },
  total_current_people: {
    type: DataTypes.INTEGER
  },
  manager_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});
// Message.belongsTo(Room,{foreignKey:"room_id"})
// Room.belongsTo(Message,{foreignKey:"room_id"})
// Room.hasMany(User,{foreignKey:"room_id"})
// User.belongsTo(Room,{foreignKey:"room_id"})
// Room.belongsTo(Manager,{foreignKey:"manager_id"})
// db.sync();
module.exports = Room;