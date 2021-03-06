const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const Room = require('./room');

const service = db.define('service', {
    id:{
        primaryKey:true,
        type:DataTypes.INTEGER,
        allowNull:false,
        autoIncrement:true
    },
  service_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  number_start: {
    type: DataTypes.INTEGER
  },
  unit_price: {
    type: DataTypes.DOUBLE,
    allowNull: false
  },
  unit: {
    type: DataTypes.STRING,
  },
  room_id: {
    type: DataTypes.INTEGER
  },
  
}, {
});
service.belongsTo(Room,{foreignKey:"room_id"})
Room.hasMany(service,{foreignKey:"room_id"})

// db.sync();
module.exports = service;