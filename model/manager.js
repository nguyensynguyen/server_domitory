const { Sequelize, DataTypes } = require('sequelize');
const db = require('../dao/connect_db');
const User = require('./users')
const Room = require('./room')
const Message = require('./message')


const Manager = db.define('Manager', {
  id: {
    primaryKey: true,
    type: DataTypes.INTEGER,
    allowNull: false,
    autoIncrement: true
  },
  manager_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  email: {
    type: DataTypes.STRING
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false
  },
  address: {
    type: DataTypes.STRING
  },
  phone: {
    type: DataTypes.INTEGER
  },

}, {
});
Manager.hasMany(Room, { foreignKey: "manager_id" })
Room.belongsTo(Manager, { foreignKey: "manager_id" })

Manager.hasMany(User, { foreignKey: "manager_id" })
User.belongsTo(Manager, { foreignKey: "manager_id" })

Message.belongsTo(Manager, { foreignKey: "manager_id" })
Manager.hasMany(Message, { foreignKey: "manager_id" })


// db.sync();
module.exports = Manager;