const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Manager = require('./manager');
const Room = require('./room');
const Message = require('./message')

const Users = db.define('Users', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false,
        autoIncrement:true
    },
  user_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false
  },
  birth_day: {
    type: DataTypes.INTEGER
  },
  phone: {
    type: DataTypes.INTEGER
  },
  id_card: {
    type: DataTypes.INTEGER
  },

  address: {
    type: DataTypes.STRING,
    allowNull: false
  },
  status: {
    type: DataTypes.STRING,
    allowNull: false
  },
  registration_date: {
    type: DataTypes.INTEGER
  },
  expiration_date: {
    type: DataTypes.INTEGER
  },
  manager_id: {
    type: DataTypes.INTEGER
  },
  room_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});
// Users.belongsTo(Manager,{foreignKey:"manager_id"})
// Users.belongsTo(Room,{foreignKey:"room_id"})
Users.hasMany(Message,{foreignKey:"user_id"})
Message.belongsTo(Users,{foreignKey:"user_id"})
// db.sync();
module.exports = Users;