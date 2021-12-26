var express = require('express');
var app = express();
app.use(express.json());
const { Sequelize, DataTypes } = require('sequelize');
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));

const managerConroller = require('./controller/manager');

app.get('/api/manager/get_all_room/:managerId', managerConroller.getAllRoom);
app.get('/api/manager/get_all_bill/:managerId', managerConroller.getAllBill);
app.get('/api/manager/get_all_message/:managerId', managerConroller.getAllMessage);
app.get('/api/manager/get_all_user/:managerId', managerConroller.getAllUser);


app.post('/api/user/login_user', managerConroller.loginUser);
app.post('/api/manager/login_manager', managerConroller.loginManager);


app.post('/api/manager/create_room', managerConroller.createRoom);
app.post('/api/manager/create_service', managerConroller.createService);
app.post('/api/manager/create_user', managerConroller.createUser);
app.post('/api/manager/create_bill', managerConroller.createBill);
app.post('/api/manager/create_bill_detail', managerConroller.createBillDetail);
app.post('/api/manager/create_room_equipment', managerConroller.createRoomEquipment);
app.post('/api/manager/update_message/:id', managerConroller.updateMessage);
app.post('/api/manager/update_room/:id', managerConroller.updateRoom);
app.post('/api/manager/update_bill/:id', managerConroller.updateBill);
app.delete('/api/manager/delete_user/:id', managerConroller.deleteUser);
app.delete('/api/manager/delete_message/:id', managerConroller.deleteMessage);

// app.get('/api/user/:userId',controllers.fillUserById);
// app.post('/api/user/create_user',controllers.createUser);
// app.post('/api/user/update_user',controllers.updateUser);
// app.get('/api', (req,res) => {
// res.send(arr);
// });
// app.post('/add',addDataUser);
// chỉnh port
app.listen(3000, '192.168.2.116', function () {
  console.log(process.env.PORT);
});
module.exports = app;