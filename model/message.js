const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Room = require('./room');
const Manager = require('./manager');
const Users = require('./users');


const Message = db.define('message', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false,
        autoIncrement:true
    },
  title: {
    type: DataTypes.STRING,
  },
  content: {
    type: DataTypes.STRING,
  },
  status: {
    type: DataTypes.STRING,
  },
  date_create: {
    type: DataTypes.INTEGER
  },

  room_id: {
    type: DataTypes.INTEGER
  },
  manager_id: {
    type: DataTypes.INTEGER
  },
  user_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});

// Message.belongsTo(Manager,{foreignKey:"manager_id"})

// db.sync();
module.exports = Message;