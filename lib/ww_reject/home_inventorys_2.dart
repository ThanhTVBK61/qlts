// import 'package:flutter/material.dart';
// import 'package:qlts/data_sources/callAPI.dart';
// import 'package:qlts/inventorys.dart';
// import 'package:qlts/splash_page.dart';
// import 'package:qlts/widget_background.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'home_input_inventory.dart';
// import 'home_inventory_qrcode_2.dart';
//
// ///Bỏ
// ///Nhận dữ liệu danh sách các đợt kiểm kê từ API
// class HomeInventory extends StatefulWidget {
//   final token;
//
//   HomeInventory({this.token});
//
//   @override
//   State<StatefulWidget> createState() => HomeInventoryState();
// }
//
// class HomeInventoryState extends State<HomeInventory> {
//
//   int currentIndex = 0;
//
//   ///Vị trí
//   /// Id Đợt kiểm kê hiện tại
//   int idCurrentInventory = -1;
//
//   ///Option: Tải dữ liệu online or upload dữ liệu
//   bool upload = false;
//
//   /// 0: Kiểm kê, 1: QRCode, 2: Nhập thông tin
//   var option = 0;
//   String error;
//
//   List<Inventory> listInventory = [];
//   List<String> nameInventory = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     getInventory();
//   }
//
//   ///Lấy dữ liệu danh sách các đợt kiểm kê => call API
//   void getInventory() async {
//     print(
//         '******MyHomeInventorysPage**data!=null******\n${widget.token}\n******************');
//     Map<String, dynamic> body = {"token": widget.token};
//     APIResult apiResult = await ServicesRepository()
//         .post(action: 'qlts_get_inventory_round', body: body);
//     if (apiResult is APISuccess) {
//       List data = apiResult.data.values.toList();
//       if (data[0] == '200') {
//         setState(() {
//           data[2].forEach((element) {
//             var newList = element.values.toList();
//             nameInventory.add(newList[2]);
//             listInventory.add(Inventory(newList[0], newList[1], newList[2],
//                 newList[3], newList[4], newList[5], newList[6], newList[7]));
//           });
//           idCurrentInventory =  listInventory[0].id;
//         });
//       } else {
//         if (data[0] == '498.2') {
//           print('******set token =' '******');
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           prefs.setString('token', '');
//         }
//         _errorDialog(data[0], data[1]);
//       }
//       print(
//           '******MyHomeInventoryPage********\n$listInventory\n******************');
//     } else if (apiResult is APIError) {
//       print(apiResult.statusCode);
//     } else {
//       print("I don't know");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(color: Colors.white),
//         ),
//         backgroundImage(context),
//         DefaultTabController(
//           length: 3,
//           child: Scaffold(
//               backgroundColor: Colors.transparent,
//               appBar: AppBar(
//                   title: Container(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Text(
//                         'Kiểm kê tài sản',
//                         style:
//                             TextStyle(color: Color(0xFFF2F2F9), fontSize: 20),
//                       )),
//                   centerTitle: true,
//                   backgroundColor: Colors.transparent,
//                   toolbarHeight: 110,
//                   elevation: 0.0,
//                   leading: Container(
//                     margin: const EdgeInsets.only(left: 20),
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                   actions: [
//                     Container(
//                       margin: const EdgeInsets.only(right: 5),
//                       child: IconButton(
//                         icon: Icon(Icons.dehaze_rounded),
//                         onPressed: () {},
//                       ),
//                     )
//                   ],
//                   bottom: PreferredSize(
//                     preferredSize: Size(MediaQuery.of(context).size.width, 40),
//                     child: TabBar(tabs: [
//                       Container(
//                           height: 40,
//                           width: double.infinity,
//                           child: Center(
//                               child: Text(
//                             'Đợt kiểm kê',
//                             style: TextStyle(fontSize: 15),
//                           ))),
//                       Container(
//                           height: 40,
//                           child: Center(
//                               child: Text(
//                             'QR Code',
//                             style: TextStyle(fontSize: 15),
//                           ))),
//                       Container(
//                           height: 40,
//                           child: Center(
//                               child: Text(
//                             'Nhập thông tin',
//                             style: TextStyle(fontSize: 14.8),
//                           ))),
//                     ], indicatorColor: Colors.white),
//                   )),
//               body: TabBarView(
//                 children: [
//                   Column(
//                     children: [
//                       Card(
//                         margin:
//                             const EdgeInsets.only(top: 20, left: 20, right: 20),
//                         shadowColor: Colors.white70,
//                         elevation: 10.0,
//                         color: Colors.white.withOpacity(1),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Container(
//                           padding: const EdgeInsets.all(20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     margin: const EdgeInsets.only(right: 10),
//                                     child: Text(
//                                       'Chọn đợt (*)',
//                                       style: TextStyle(fontSize: 13),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.only(top: 10),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                         child: Container(
//                                             margin: const EdgeInsets.only(
//                                                 right: 20),
//                                             child: Text(
//                                                 listInventory.length == 0
//                                                     ? 'Không có đợt kiểm kê tài sản'
//                                                     : listInventory[currentIndex].ten,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     color: Color(0xFF050505),
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 16)))),
//                                     IconButton(onPressed: () {
//                                       if (nameInventory.length > 0) {
//                                         Dialog inventoryDialog = Dialog(
//                                             shape: RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.circular(12.0)),
//                                             //this right here
//                                             child: Container(
//                                               padding: const EdgeInsets.all(10),
//                                               height: 320.0,
//                                               width: 320.0,
//                                               child: ListView.separated(
//                                                 padding: const EdgeInsets.all(10),
//                                                 itemCount: nameInventory.length,
//                                                 itemBuilder: (BuildContext context, int index) {
//                                                   return GestureDetector(
//                                                     onTap: () {
//                                                       setState(() {
//                                                         currentIndex = index;
//                                                         idCurrentInventory = listInventory[currentIndex].id;
//                                                         Navigator.pop(context);
//                                                       });
//                                                     },
//                                                     child: Container(
//                                                       height: 30,
//                                                       width: 280,
//                                                       // padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
//                                                       // color: Colors.amber[colorCodes[index]],
//                                                       child: Center(
//                                                           child: Text(
//                                                             nameInventory[index],
//                                                             maxLines: 2,
//                                                           )),
//                                                     ),
//                                                   );
//                                                 },
//                                                 separatorBuilder:
//                                                     (BuildContext context, int index) =>
//                                                 const Divider(
//                                                   color: Colors.black,
//                                                   thickness: 0.5,
//                                                 ),
//                                               ),
//                                             ));
//                                         showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) => inventoryDialog);
//                                       }
//                                     }, icon: Icon(Icons.expand_more_rounded),)
//                                   ],
//                                 ),
//                               ),
//                               Divider(color: Colors.black),
//                               ///Upload và tải online
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         if (upload) {
//                                           setState(() {
//                                             upload = false;
//                                           });
//                                         }
//                                       },
//                                       child: Container(
//                                         // width: 140,
//                                         height: 40,
//                                         margin: const EdgeInsets.only(
//                                             top: 18, right: 16),
//                                         decoration: buttonState(!upload),
//                                         child: Center(
//                                           child: Text(
//                                             'Tải dữ liệu online',
//                                             style: TextStyle(
//                                                 color: getTextColor(!upload),
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         if (!upload) {
//                                           setState(() {
//                                             upload = true;
//                                           });
//                                         }
//                                       },
//                                       child: Container(
//                                         // width: 140,
//                                         height: 40,
//                                         margin: const EdgeInsets.only(
//                                             top: 18, left: 16),
//                                         decoration: buttonState(upload),
//                                         child: Center(
//                                           child: Text(
//                                             'Upload dữ liệu',
//                                             style: TextStyle(
//                                                 color: getTextColor(upload),
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   Camera(idInventory:idCurrentInventory,token: widget.token),
//                   InputInventory(),
//                 ],
//               )),
//         )
//       ],
//     );
//
//   }
//
//   BoxDecoration buttonState(bool upload) {
//     return (upload
//         ? BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//             gradient: LinearGradient(
//                 colors: [Color(0xFF00A3FF), Color(0xFF0033E7)],
//                 begin: Alignment.topLeft,
//                 end: Alignment(0.0, 0.0)))
//         : BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//             border: Border.all(color: Color(0xFF2E76BB))));
//   }
//
//   Color getTextColor(bool upload) {
//     return (upload ? Colors.white : Color(0xFF1265B6));
//   }
//
//   void _errorDialog(String errCode, String err) {
//     Dialog errorDialog = Dialog(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0)), //this right here
//         child: Container(
//             height: 300.0,
//             width: 200.0,
//             child: Container(
//               padding: const EdgeInsets.only(
//                   top: 10, right: 15, left: 15, bottom: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Thông báo',
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.bold),
//                   ),
//                   Container(
//                       margin: const EdgeInsets.only(top: 20, bottom: 20),
//                       child: Text(errCode == '498.2'
//                           ? 'Phiên làm việc của bạn đã hết hạn.\nVui lòng ăng nhập lại'
//                           : err)),
//                   RaisedButton(
//                     textColor: Colors.white,
//                     onPressed: () {
//                       Navigator.pop(context);
//                       if (errCode == '498.2') {
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SplashPage()),
//                             (Route<dynamic> route) => false);
//                       } else {
//                         Navigator.pop(context);
//                       }
//                     },
//                     child: Container(
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(color: Colors.blue),
//                         child: Text('OK')),
//                   )
//                 ],
//               ),
//             )));
//     showDialog(
//         context: context, builder: (BuildContext context) => errorDialog);
//   }
// }
//
// // ///Hiển thị danh sách các đợt kiểm kê
// //
// // class AccountInfor extends StatelessWidget {
// //   const AccountInfor({
// //     Key key,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.only(top: 20),
// //       padding: const EdgeInsets.all(20),
// //       height: 350,
// //       // width: MediaQuery.of(context).size.width - 20,
// //       decoration: BoxDecoration(border: Border.all(color: Colors.black)),
// //       child: Column(
// //         children: [
// //           Text(
// //             'Thông tin tài khoản',
// //             style: TextStyle(color: Colors.blue),
// //           ),
// //           Container(
// //             margin: const EdgeInsets.only(top: 20, bottom: 10),
// //             child: Row(
// //               children: [
// //                 Text('Số thẻ: '),
// //                 new Spacer(),
// //                 Container(
// //                   height: 30,
// //                   width: 250,
// //                   padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                   decoration: BoxDecoration(
// //                       border: Border.all(color: Colors.black),
// //                       borderRadius: BorderRadius.all(Radius.circular(3))),
// //                   child: Text(''),
// //                 )
// //               ],
// //             ),
// //           ),
// //           Row(
// //             children: [
// //               Text('ID chi tiết : '),
// //               new Spacer(),
// //               Container(
// //                 height: 30,
// //                 width: 250,
// //                 padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                 decoration: BoxDecoration(
// //                     border: Border.all(color: Colors.black),
// //                     borderRadius: BorderRadius.all(Radius.circular(3))),
// //                 child: Text(''),
// //               )
// //             ],
// //           ),
// //           Container(
// //             margin: const EdgeInsets.only(top: 10, bottom: 10),
// //             child: Row(
// //               children: [
// //                 Text('<thông tin> '),
// //                 new Spacer(),
// //                 Container(
// //                   height: 30,
// //                   width: 250,
// //                   padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                   decoration: BoxDecoration(
// //                       border: Border.all(color: Colors.black),
// //                       borderRadius: BorderRadius.all(Radius.circular(3))),
// //                   child: Text(''),
// //                 )
// //               ],
// //             ),
// //           ),
// //           Row(
// //             children: [
// //               Text('<thông tin> '),
// //               new Spacer(),
// //               Container(
// //                 height: 30,
// //                 width: 250,
// //                 padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                 decoration: BoxDecoration(
// //                     border: Border.all(color: Colors.black),
// //                     borderRadius: BorderRadius.all(Radius.circular(3))),
// //                 child: Text(''),
// //               )
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // /// Nhập thông tin tra cứu
// // class FormInputData extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() => FormInputDataState();
// // }
// //
// // class FormInputDataState extends State<FormInputData> {
// //   ///Dữ liệu nhận về từ API
// //   String soThe = '';
// //   String id = '';
// //   String serial = '';
// //
// //   ///Thông báo lỗi khi người dùng chưa nhập đủ thông tin
// //   String error = '';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Container(
// //             height: 220,
// //             padding:
// //                 const EdgeInsets.only(top: 13, right: 20, left: 20, bottom: 13),
// //             decoration: BoxDecoration(border: Border.all(color: Colors.black)),
// //             child: Column(children: [
// //               Row(
// //                 children: [
// //                   Text('Số thẻ: '),
// //                   new Spacer(),
// //                   Container(
// //                     height: 30,
// //                     width: 250,
// //                     padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                     decoration: BoxDecoration(
// //                         border: Border.all(color: Colors.black),
// //                         borderRadius: BorderRadius.all(Radius.circular(3))),
// //                     child: TextField(
// //                         onChanged: (soThe) {
// //                           setState(() {
// //                             this.soThe = soThe;
// //                           });
// //                         },
// //                         decoration: InputDecoration.collapsed(
// //                           hintText: 'Nhập số thẻ',
// //                         )),
// //                   )
// //                 ],
// //               ),
// //               Container(
// //                 margin: const EdgeInsets.only(top: 10, bottom: 10),
// //                 child: Row(
// //                   children: [
// //                     Text('ID chi tiết: '),
// //                     new Spacer(),
// //                     Container(
// //                       height: 30,
// //                       width: 250,
// //                       padding:
// //                           const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                       decoration: BoxDecoration(
// //                           border: Border.all(color: Colors.black),
// //                           borderRadius: BorderRadius.all(Radius.circular(3))),
// //                       child: TextField(
// //                         onChanged: (newId) {
// //                           setState(() {
// //                             this.id = newId;
// //                           });
// //                         },
// //                         decoration: InputDecoration.collapsed(
// //                           hintText: 'Nhập mã số',
// //                         ),
// //                         keyboardType: TextInputType.number,
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //               Row(
// //                 children: [
// //                   Text('Serial: '),
// //                   new Spacer(),
// //                   Container(
// //                     height: 30,
// //                     width: 250,
// //                     padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                     decoration: BoxDecoration(
// //                         border: Border.all(color: Colors.black),
// //                         borderRadius: BorderRadius.all(Radius.circular(3))),
// //                     child: TextField(
// //                       onChanged: (newSerial) {
// //                         setState(() {
// //                           this.serial = newSerial;
// //                         });
// //                       },
// //                       decoration: InputDecoration.collapsed(
// //                         hintText: 'Nhập số serial number',
// //                       ),
// //                       keyboardType: TextInputType.number,
// //                     ),
// //                   )
// //                 ],
// //               ),
// //
// //               ///Text hiển thị khi người dùng chưa nhập đủ thông tin
// //               Container(
// //                 margin: const EdgeInsets.only(top: 5),
// //                 child: Text(
// //                   this.error,
// //                   style: TextStyle(color: Colors.red),
// //                 ),
// //               ),
// //
// //               ///Button gửi lên API
// //               Container(
// //                 padding: const EdgeInsets.only(top: 10),
// //                 child: RaisedButton(
// //                   color: Colors.blue,
// //                   shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.all(Radius.circular(20.0))),
// //
// //                   ///Gọi API
// //                   onPressed: () {
// //                     if (checkInformation()) {
// //                       setState(() {
// //                         this.error = '';
// //                       });
// //                     } else {
// //                       setState(() {
// //                         this.error = '*Vui lòng nhập đầy đủ thông tin';
// //                       });
// //                     }
// //                   },
// //                   child: Text(
// //                     'Tra cứu',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                 ),
// //               )
// //             ])),
// //         Container(
// //           margin: const EdgeInsets.only(top: 20),
// //           padding: const EdgeInsets.all(20),
// //
// //           // width: MediaQuery.of(context).size.width - 20,
// //           decoration: BoxDecoration(border: Border.all(color: Colors.black)),
// //           child: Column(
// //             // mainAxisSize: MainAxisSize.max,
// //             children: [
// //               Text(
// //                 'Thông tin tài khoản',
// //                 style: TextStyle(color: Colors.blue),
// //               ),
// //               Container(
// //                 margin: const EdgeInsets.only(top: 20, bottom: 10),
// //                 child: Row(
// //                   children: [
// //                     Text('Số thẻ: '),
// //                     new Spacer(),
// //                     Container(
// //                       height: 30,
// //                       width: 250,
// //                       padding:
// //                           const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                       decoration: BoxDecoration(
// //                           border: Border.all(color: Colors.black),
// //                           borderRadius: BorderRadius.all(Radius.circular(3))),
// //                       child: Text(this.soThe),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //               Row(
// //                 children: [
// //                   Text('ID chi tiết : '),
// //                   new Spacer(),
// //                   Container(
// //                     height: 30,
// //                     width: 250,
// //                     padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                     decoration: BoxDecoration(
// //                         border: Border.all(color: Colors.black),
// //                         borderRadius: BorderRadius.all(Radius.circular(3))),
// //                     child: Text(this.id),
// //                   )
// //                 ],
// //               ),
// //               Container(
// //                 margin: const EdgeInsets.only(top: 10, bottom: 10),
// //                 child: Row(
// //                   children: [
// //                     Text('<thông tin> '),
// //                     new Spacer(),
// //                     Container(
// //                       height: 30,
// //                       width: 250,
// //                       padding:
// //                           const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                       decoration: BoxDecoration(
// //                           border: Border.all(color: Colors.black),
// //                           borderRadius: BorderRadius.all(Radius.circular(3))),
// //                       child: Text(''),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //               Row(
// //                 children: [
// //                   Text('<thông tin> '),
// //                   new Spacer(),
// //                   Container(
// //                     height: 30,
// //                     width: 250,
// //                     padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
// //                     decoration: BoxDecoration(
// //                         border: Border.all(color: Colors.black),
// //                         borderRadius: BorderRadius.all(Radius.circular(3))),
// //                     child: Text(''),
// //                   )
// //                 ],
// //               ),
// //             ],
// //           ),
// //         )
// //       ],
// //     );
// //   }
// //
// //   ///Kiểm tra nếu người dùng thiếu thông tin
// //   bool checkInformation() {
// //     return (this.soThe != '' || this.id != '' || this.serial != '');
// //   }
// // }
// //
// // ///QRCode
