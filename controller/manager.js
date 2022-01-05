const Manager = require('../model/manager');
const User = require('../model/users');
const Room = require('../model/room');
const Message = require('../model/message');
const RoomBillDetail = require('../model/room_bill_detail');
const RoomBill = require('../model/room_bill');
const RoomEquipment = require('../model/room_equipment');
const RoomEquipmentStatus = require('../model/room_equipment_status');
const Service = require('../model/service');
var check = false
const bcrypt = require('bcrypt');
// exports.fillAllUser = (req,res,next) =>{
//     const  managerId = req.params.managerId;
//     Message.findAll({include:[{model:Manager,include:{model:Room}}]}).then(listUser =>{
//    res.status(200).json({
//        "success":true,
//        "data":listUser
//    },);
//     }).catch(err =>{
//         if(!err.statusCode){
//            err.statusCode = 500;
//         }
//         next(err);
//     });
// }

// exports.fillAllUser = (req,res,next) =>{
//     const  managerId = req.params.managerId;
//         Message.findAll({include:[{model:Manager,include:{model:Room,include:{model:RoomBill,include:{model:RoomBillDetail}}}}]}).then(listUser =>{
//     res.status(200).json({
//         "success":true,
//         "data":listUser
//     },);
//         }).catch(err =>{
//             if(!err.statusCode){
//             err.statusCode = 500;
//             }
//             next(err);
//         });
//     }


    // exports.fillAllUser = (req,res,next) =>{
    //     const  managerId = req.params.managerId;
    //         Room.findAll({where: {
    //             manager_id: managerId,
    //           },include:[
    //               {
    //                   model:RoomBill,
    //                 include:{model:RoomBillDetail}
    //             }
    //             ]}).then(listUser =>{
    //     res.status(200).json({
    //         "success":true,
    //         "data":listUser
    //     },);
    //         }).catch(err =>{
    //             if(!err.statusCode){
    //             err.statusCode = 500;
    //             }
    //             next(err);
    //         });
    //     }

    
    // exports.fillAllUser = (req,res,next) =>{
    //     const  managerId = req.params.managerId;
    //         Room.findAll({where: {
    //             manager_id: managerId,
    //           },include:[
    //               {
    //                   model:User,
    //             },
              
    //             ]}).then(listUser =>{
    //     res.status(200).json({
    //         "success":true,
    //         "data":listUser
    //     },);
    //         }).catch(err =>{
    //             if(!err.statusCode){
    //             err.statusCode = 500;
    //             }
    //             next(err);
    //         });
    //     }

    exports.loginUser = (req,res,next) =>{
            User.findAll({where: {
                email: req.body.email,
                manager_id:req.body.manager_id,
                // password:req.body.password
              }}).then(listUser =>{
                  console.log(listUser[0].dataValues.password)
                  if(listUser.length > 0){
                          if(bcrypt.compareSync(req.body.password, listUser[0].dataValues.password)){
                              res.status(200).json({
                                  "success":true,
                                  "data":listUser[0].dataValues
                              },);
                              return
                          }
                          res.status(200).json({
                            "success":false,
                            "data": null
                        },);
                  }else{
                    res.status(200).json({
                        "success":false,
                        "data":null
                    },);
                  }

            }).catch(err =>{
                if(!err.statusCode){
                    err.statusCode = 500;
                }
                next()
            });
        }
        exports.loginManager = (req,res,next) =>{
            Manager.findAll({where: {
                email: req.body.email,
                // password:req.body.password
              }}).then(listUser =>{
                  console.log(listUser[0].dataValues.password)
                  if(listUser.length > 0){
                          if(bcrypt.compareSync(req.body.password, listUser[0].dataValues.password)){
                              res.status(200).json({
                                  "success":true,
                                  "data":listUser[0].dataValues
                              },);
                              return
                          }
                          res.status(200).json({
                            "success":false,
                            "data": null
                        },);
                  }else{
                    res.status(200).json({
                        "success":false,
                        "data":null
                    },);
                  }

            }).catch(err =>{
                if(!err.statusCode){
                    err.statusCode = 500;
                }
                next()
            });
        }
    exports.getAllRoom = (req,res,next) =>{
        const  managerId = req.params.managerId;
            Room.findAll({where: {
                manager_id: managerId,
              },include:[
                {model:User},
                {model:RoomEquipment,include:{model:RoomEquipmentStatus}},
                {model:RoomBill,include:{model:RoomBillDetail}},
                {model:Service}
              
                ]}).then(listUser =>{
        res.status(200).json({
            "success":true,
            "data":listUser
        },);
            }).catch(err =>{
                if(!err.statusCode){
                err.statusCode = 500;
                }
                next(err);
            });
        }
        

        exports.getAllMessage = (req,res,next) =>{
            const  managerId = req.params.managerId;
                Message.findAll({where: {
                    manager_id: managerId,
                  },include:[
                       { 
                          model:Room,
                         
                    },
                    {model:User},
                  
                    ]}).then(listUser =>{
            res.status(200).json({
                "success":true,
                "data":listUser
            },);
                }).catch(err =>{
                    if(!err.statusCode){
                    err.statusCode = 500;
                    }
                    next(err);
                });
            }
    
    exports.getAllBill = (req,res,next) =>{
        const  managerId = req.params.managerId;
            RoomBill.findAll({where: {
                manager_id: managerId,
              },include:[
                   { 
                      model:Room,
                },
                {model:RoomBillDetail},
              
                ]}).then(listUser =>{
        res.status(200).json({
            "success":true,
            "data":listUser
        },);
            }).catch(err =>{
                if(!err.statusCode){
                err.statusCode = 500;
                }
                next(err);
            });
        }

        exports.getAllUser = (req,res,next) =>{
            const  managerId = req.params.managerId;
                User.findAll({where: {
                    manager_id: managerId,
                  },include:[
                       { 
                          model:Room,
                    },                  
                    ]}).then(listUser =>{
            res.status(200).json({
                "success":true,
                "data":listUser
            },);
                }).catch(err =>{
                    if(!err.statusCode){
                    err.statusCode = 500;
                    }
                    next(err);
                });
            }

    
exports.createRoom = (req,res,next) =>{
    // console.log(data.name);
    // const _id = req.body.id;
    // const _firstName = req.body.firstName;
    // const _lastName = req.body.lastName;
    const _room = new Room(req.body);
    _room.save().then(result => {
        res.status(200).json({
            "success":true,
            "data":result
        },);
         }).catch(err =>{
             if(!err.statusCode){
                err.statusCode = 500;
             }
             next(err);
         });
    
  }

  exports.createService = (req,res,next) =>{
    req.body.forEach(item =>{
        const _service = new Service(item);
        _service.save()
        
    });
    res.status(200).json({
        "success":true,
    },);
    
  }

  exports.createUser = (req,res,next) =>{
   var data =  { 
    "user_name": req.body.user_name,
    "email":req.body.email,
    "birth_day": req.body.birth_day,
    "phone":req.body.phone ,
    "id_card": req.body.id_card,
    "address": req.body.address,
    "password": bcrypt.hashSync(req.body.password, 10),
    "registration_date": req.body.registration_date,
    "expiration_date": req.body.expiration_date,
    "manager_id": req.body.manager_id,
    "room_id":req.body.room_id ,
    }
    const _room = new User(data);
    _room.save().then(result => {
        res.status(200).json({
            "success":true,
            "data":result
        },);
         }).catch(err =>{
             if(!err.statusCode){
                err.statusCode = 500;
             }
             next(err);
         });
    
  }

  exports.createBill = (req,res,next) =>{
    const _bill = new RoomBill(req.body);
    _bill.save().then(result => {
        res.status(200).json({
            "success":true,
            "data":result
        },);
         }).catch(err =>{
             if(!err.statusCode){
                err.statusCode = 500;
             }
             next(err);
         });
  }
  exports.createBillDetail = (req,res,next) =>{
    req.body.forEach(item =>{
        const _room = new RoomBillDetail(item);
    _room.save()
        
    });
    res.status(200).json({
        "success":true,
    },);

  }

  exports.createRoomEquipment = (req,res,next) =>{
    const _equipment = new RoomEquipment(req.body);
    _equipment.save().then(result => {
        res.status(200).json({
            "success":true,
            "data":result
        },);
         }).catch(err =>{
             if(!err.statusCode){
                err.statusCode = 500;
             }
             next(err);
         });
  }



  exports.updateMessage = (req,res,next) =>{
    const  _id = req.params.id
   var rs = Message.update(req.body,{where:{id :_id}}).then(rs =>{
        res.status(200).json(
            {
                "success": true,
                "data":"update success"
            }
        );
    }).catch(err =>{
        if(!err.statusCode){
            err.statusCode = 500;
        }
        next(err);
    });
  }


  exports.updateRoom = (req,res,next) =>{
    const  _id = req.params.id
   var rs = Room.update(req.body,{where:{id :_id}}).then(rs =>{
        res.status(200).json(
            {
                "success": true,
                "data":"update success"
            }
        );
    }).catch(err =>{
        if(!err.statusCode){
            err.statusCode = 500;
        }
        next(err);
    });
  }

  exports.updateBill = (req,res,next) =>{
    const  _id = req.params.id
   var rs = RoomBill.update(req.body,{where:{id :_id}}).then(rs =>{
        res.status(200).json(
            {
                "success": true,
                "data":"update success"
            }
        );
    }).catch(err =>{
        if(!err.statusCode){
            err.statusCode = 500;
        }
        next(err);
    });
  }

  exports.updateSevice = (req,res,next) =>{
    const  _id = req.params.id
   var rs = Service.update(req.body,{where:{id :_id}}).then(rs =>{
        res.status(200).json(
            {
                "success": true,
                "data":"update success"
            }
        );
    }).catch(err =>{
        if(!err.statusCode){
            err.statusCode = 500;
        }
        next(err);
    });
    
  }

  exports.updateUser = (req,res,next) =>{
    const  _id = req.params.id
   var rs = User.update(req.body,{where:{id :_id}}).then(rs =>{
        res.status(200).json(
            {
                "success": true,
                "data":"update success"
            }
        );
    }).catch(err =>{
        if(!err.statusCode){
            err.statusCode = 500;
        }
        next(err);
    });
    
  }

  exports.deleteUser = (req,res,next) =>{
    const  _id = req.params.id
   var rs = User.destroy({where:{id :_id}}).then(rs =>{
        res.status(200).json(
            {
                "success": true,
                "data":"delete success"
            }
        );
    }).catch(err =>{
        if(!err.statusCode){
            err.statusCode = 500;
        }
        next(err);
    });
  }

  exports.deleteMessage = (req,res,next) =>{
    const  _id = req.params.id
   var rs = Message.destroy({where:{user_id :_id}}).then(rs =>{
        res.status(200).json(
            {
                "success": true,
                "data":"delete success"
            }
        );
    }).catch(err =>{
        if(!err.statusCode){
            err.statusCode = 500;
        }
        next(err);
    });
  }


// exports.fillUserById = (req,res,next) =>{
//   const  userId = req.params.userId;
//     userModel.findByPk(userId).then(listUser =>{
//    res.status(200).json({
//        "success":true,
//        "data":listUser
//    },);
//     }).catch(err =>{
//         if(!err.statusCode){
//            err.statusCode = 500;
//         }
//         next(err);
//     });
// }



// exports.createUser = (req,res,next) =>{
//     // console.log(data.name);
//     const _id = req.body.id;
//     const _firstName = req.body.firstName;
//     const _lastName = req.body.lastName;
//     const _user = new userModel(req.body);
//     _user.save().then(result => {
//         res.status(200).json({
//             "success":true,
//             "data":"create user success"
//         },);
//          }).catch(err =>{
//              if(!err.statusCode){
//                 err.statusCode = 500;
//              }
//              next(err);
//          });
    
//   }

//   exports.updateUser = (req,res,next) =>{
//     // console.log(data.name);
//     const _id = req.body.id;
//     const _firstName = req.body.firstName;
//     const _lastName = req.body.lastName;
//     // const _user = new Object({
//     //     id:_id,firstName:_firstName,lastName:_lastName
//     // });
//     userModel.update(req.body,{where:{id :_id}}).then(rs =>{
//         res.status(200).json(
//             {
//                 "success": true,
//                 "data":"update success"
//             }
//         );
//     }).catch(err =>{
//         if(!err.statusCode){
//             err.statusCode = 500;
//         }
//         next(err);
//     });
    
//   }