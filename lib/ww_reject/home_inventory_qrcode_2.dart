// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:qlts/inventorys.dart';
// import 'package:qlts/permission.dart';
//
// import 'data_sources/callAPI.dart';
//
// class Camera extends StatefulWidget {
//   final idInventory;
//   final token;
//
//   Camera({this.idInventory, this.token});
//
//   @override
//   State<StatefulWidget> createState() => CameraState();
// }
//
// class CameraState extends State<Camera> {
//   String soThe = '';
//   String id = '';
//   String idChiTiet = '';
//   String error = '';
//
//   List<InventoryDetail> listInventoryDetail = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return
//        Column(
//           children: [
//             ///get du lieu tu camera
//             Card(
//               margin: const EdgeInsets.all(20),
//               shadowColor: Colors.white70,
//               elevation: 10.0,
//               color: Colors.white.withOpacity(1),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Container(
//                   height: 250,
//                   child: Center(
//                       child: PermissionWidget(
//                     permission: Permission.camera,
//                     callback: (data, clear) {
//                       if(!clear){
//                         print("*****home_inventory_qrcode: data==>> $data");
//                         if (widget.idInventory != -1) {
//                           getInventoryScan(data);
//                         }
//                       }else{
//                         setState(() {
//                           listInventoryDetail.clear();
//                         });
//                       }
//
//                     },
//                   ))),
//             ),
//
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(top: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                         Container(
//                           margin: const EdgeInsets.only(right: 10),
//                           child: widget.idInventory != -1
//                               ? Container(
//                                   margin:
//                                       const EdgeInsets.only(bottom: 10, left: 20),
//                                   child: Text(
//                                     'Thông tin tài sản',
//                                     style: TextStyle(
//                                         color: Color(0xFF050505),
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   ),
//                                 )
//                               : Center(
//                                   child: Text(
//                                     '*Vui lòng chọn đợt kiểm kê!',
//                                     style: TextStyle(
//                                         color: Colors.red,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                     ),
//                     Expanded(
//                       child: CustomScrollView(
//                         slivers: [
//                           SliverList(
//                             delegate: SliverChildBuilderDelegate(
//                                 (context, index) => ListTile(
//                                       title: informationDetail(
//                                           listInventoryDetail[index]),
//                                     ),
//                                 childCount: listInventoryDetail.length),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         );
//
//   }
//
//   Container informationDetail(InventoryDetail inventoryDetail) {
//     return ((inventoryDetail.maThuocTinh == 'so_the' || inventoryDetail.tenThuocTinh == 'Id Chi tiết')?
//         Container(
//           margin: const EdgeInsets.only(left: 20, right: 20),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                           margin: const EdgeInsets.only(bottom: 10),
//                           child: Text(inventoryDetail.tenThuocTinh == 'Id Chi tiết'?'Id Chi tiết':'Số thẻ',
//                             style: TextStyle(
//                                 color: Color(0xFF050505),
//                                 fontSize: 13
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           )),
//                       Text(
//                         inventoryDetail.giaTri,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFF050505),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Divider(color: Colors.black),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//     :Container(
//       margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//               margin: const EdgeInsets.only(bottom: 10),
//               child: Text(
//                 inventoryDetail.tenThuocTinh,
//                 style: TextStyle(color: Color(0xFF050505), fontSize: 13),
//                 overflow: TextOverflow.ellipsis,
//               )),
//           TextField(
//             style: TextStyle(
//               fontSize: 16,
//               color: Color(0xFF050505),
//               fontWeight: FontWeight.bold,
//             ),
//             decoration: InputDecoration(hintText: ""),
//             controller: TextEditingController()
//               ..text = inventoryDetail.giaTri ?? '',
//           ),
//         ],
//       ),
//     ));
//   }
//
//   void getInventoryScan(String data) async {
//     print(
//         "***********Home Inventory Scan with ID = ${widget.idInventory}**********");
//
//     Map<String, dynamic> body = {
//       "token": widget.token,
//       "inventory_id": widget.idInventory.toString(),
//       "type_code": "qrcode",
//       "value": data
//     };
//
//     print(
//         '****** My Home Inventory Scan ****body****\n$body\n*******body***********');
//
//     APIResult apiResult = await ServicesRepository()
//         .post(action: 'qlts_get_inventory_scan', body: body);
//
//     if (apiResult is APISuccess) {
//       print("****** My Home Inventory Scan****Success****");
//       List data = apiResult.data.values.toList();
//       if (data[0] == '200') {
//         setState(() {
//           idChiTiet = data[3];
//           for (int index = 0; index < data[5].length; index++) {
//             var newList = data[5][index].values.toList();
//             if (index == 0) {
//               listInventoryDetail
//                   .add(InventoryDetail('', 'Id Chi tiết', '', data[3], '', ''));
//             }
//             listInventoryDetail.add(InventoryDetail(newList[1], newList[2],
//                 newList[3], newList[4], newList[5], newList[6]));
//           }
//         });
//         print(
//             '****** My Home Inventory Scan ***listInventoryDetail*****\n$listInventoryDetail\n*********listInventoryDetail*********');
//       } else {
//         setState(() {
//           error = data[1];
//         });
//       }
//       print(
//           '****** My Home Inventory Scan ***apidata*****\n${apiResult.data}\n*********apidata*********');
//     } else if (apiResult is APIError) {
//       print("****** My Home Inventory Scan****Error****");
//       print(apiResult.statusCode);
//     } else {
//       print("I don't know");
//     }
//   }
// }
