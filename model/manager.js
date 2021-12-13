const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const User = require('./users')
const Room = require('./room')
const Manager = db.define('Manager', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false,
        autoIncrement:true
    },
  manager_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  email: {
    type: DataTypes.STRING
  },
  address: {
    type: DataTypes.STRING
  },
  phone: {
    type: DataTypes.INTEGER
  },
  
}, {
});
Manager.hasMany(Room,{foreignKey:"manager_id"})
Manager.hasMany(User,{foreignKey:"manager_id"})

// db.sync();
module.exports = Manager;