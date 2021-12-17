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
    type: DataTypes.BIGINT
  },
  phone: {
    type: DataTypes.BIGINT
  },
  id_card: {
    type: DataTypes.BIGINT
  },

  address: {
    type: DataTypes.STRING,
    allowNull: false
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false
  },

  registration_date: {
    type: DataTypes.BIGINT
  },
  expiration_date: {
    type: DataTypes.BIGINT
  },
  manager_id: {
    type: DataTypes.INTEGER
  },
  room_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});
Users.belongsTo(Room,{foreignKey:"manager_id"})
Room.hasMany(Users,{foreignKey:"room_id"})
Users.hasMany(Message,{foreignKey:"user_id"})
Message.belongsTo(Users,{foreignKey:"user_id"})
Message.belongsTo(Room,{foreignKey:"room_id"})
Room.hasMany(Message,{foreignKey:"room_id"})
// db.sync();
module.exports = Users;