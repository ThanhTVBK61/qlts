// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'inventorys.dart';
//
// ///Bỏ
//
// class InputInventory extends StatefulWidget{
//
//   final token;
//   InputInventory({this.token});
//   @override
//   State<StatefulWidget> createState() => InputInventoryState();
//
// }
//
// class InputInventoryState extends State<InputInventory>{
//
//   List<InventoryDetail> listInventoryDetail = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ///get du lieu tu camera
//         Card(
//           margin: const EdgeInsets.all(20),
//           shadowColor: Colors.white70,
//           elevation: 10.0,
//           color: Colors.white.withOpacity(1),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Container(
//               height: 250,
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Row(
//                       children: [
//                           Expanded(flex:10,child: informationDetail('Số thẻ','Nhập số thẻ')),
//                           Spacer(flex: 1),
//                           Expanded(flex:10,child: informationDetail('Id Chi tiết','Nhập mã số')),
//                       ],
//                     ),
//                   ),
//                   Expanded(flex:1,child: informationDetail('Serial','Nhập số serial number')),
//                   GestureDetector(
//                     onTap: () {
//
//                     },
//                     child: Container(
//                       width: 140,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                           gradient: LinearGradient(
//                               colors: [Color(0xFF00A3FF), Color(0xFF0033E7)],
//                               begin: Alignment.topLeft,
//                               end: Alignment(0.0, 0.0))),
//                       child: Center(
//                         child: Text(
//                           'Kiểm kê',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//           ),
//         ),
//
//         Expanded(
//           child: Container(
//             margin: const EdgeInsets.only(top: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   // margin: const EdgeInsets.only(top: 10),
//                   child:Container(
//                     margin: const EdgeInsets.only(bottom: 10,left: 20),
//                     child: Text(
//                       'Thông tin tài sản',
//                       style: TextStyle(color: Color(0xFF050505),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16
//                       ),
//                     ),
//                   )
//                 ),
//                 ///List thong tin
//                 // Expanded(
//                 //   child: CustomScrollView(
//                 //     slivers: [
//                 //       SliverList(
//                 //         delegate: SliverChildBuilderDelegate(
//                 //                 (context, index) => ListTile(
//                 //               title: informationDetail(
//                 //                   listInventoryDetail[index]),
//                 //             ),
//                 //             childCount: listInventoryDetail.length),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
// }
//
// Container informationDetail(String title, String hide) {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             child: Text(title,
//               style: TextStyle(
//                   color: Color(0xFF050505),
//                   fontSize: 13
//               ),
//               overflow: TextOverflow.ellipsis,
//             )),
//         TextField(
//           style: TextStyle(
//             fontSize: 16,
//             color: Color(0xFF050505),
//             fontWeight: FontWeight.bold,
//           ),
//           decoration: InputDecoration(hintText: hide, hintStyle: TextStyle(color: Color(0xFF9E9E9E))),
//         ),
//         // Divider(color: Colors.black),
//       ],
//     ),
//   );
// }