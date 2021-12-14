const Manager = require('../model/manager');
const User = require('../model/users');
const Room = require('../model/room');
const Message = require('../model/message');
const RoomBillDetail = require('../model/room_bill_detail');
const RoomBill = require('../model/room_bill');


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

    
    exports.fillAllUser = (req,res,next) =>{
        const  managerId = req.params.managerId;
            Room.findAll({where: {
                manager_id: managerId,
              },include:[
                  {
                      model:User,
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