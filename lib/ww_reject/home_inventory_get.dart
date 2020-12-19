// import 'package:flutter/material.dart';
//
// class GetInventory extends StatefulWidget {
//   final Function callback;
//   final nameInventory;
//   final currentIndex;
//
//   GetInventory(this.currentIndex, this.nameInventory, this.callback);
//
//   @override
//   State<StatefulWidget> createState() =>
//       GetInventoryState(currentIndex, this.callback);
// }
//
// class GetInventoryState extends State<GetInventory> {
//   int currentIndex;
//   Function callback;
//
//   GetInventoryState(this.currentIndex, this.callback);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 100,
//         decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//                 margin: const EdgeInsets.only(top: 10, bottom: 10),
//                 child: Text(
//                   widget.currentIndex == -1
//                       ? '*Vui lòng chọn đợt kiểm kê tài sản'
//                       : '',
//                   style: TextStyle(color: Colors.red),
//                 )),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Chọn đợt (*):'),
//                 GestureDetector(
//                   onTap: () {
//                     if (widget.nameInventory.length > 0) {
//                       Dialog inventoryDialog = Dialog(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12.0)),
//                           //this right here
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             height: 320.0,
//                             width: 320.0,
//                             child: ListView.separated(
//                               padding: const EdgeInsets.all(10),
//                               itemCount: widget.nameInventory.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       currentIndex = index;
//                                       widget.callback(index);
//                                       Navigator.pop(context);
//                                     });
//                                   },
//                                   child: Container(
//                                     height: 30,
//                                     width: 280,
//                                     // padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
//                                     // color: Colors.amber[colorCodes[index]],
//                                     child: Center(
//                                         child: Text(
//                                           widget.nameInventory[index],
//                                           maxLines: 2,
//                                         )),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder:
//                                   (BuildContext context, int index) =>
//                               const Divider(
//                                 color: Colors.black,
//                                 thickness: 0.5,
//                               ),
//                             ),
//                           ));
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) => inventoryDialog);
//                     }
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 10),
//                     margin: const EdgeInsets.only(left: 20),
//                     height: 30,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black),
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     child: Container(
//                       width: 200,
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 175,
//                             child: Text(
//                               currentIndex < 0
//                                   ? 'Chọn đợt kiểm kê'
//                                   : widget.nameInventory[currentIndex],
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Icon(Icons.arrow_drop_down, color: Colors.grey)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ));
//   }
//
// //   void _showDialog(List<String> listInventory) {
// //     Dialog inventoryDialog = Dialog(
// //         shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(12.0)), //this right here
// //         child: Container(
// //           height: 300.0,
// //           width: 300.0,
// //           child: ListView.separated(
// //             padding: const EdgeInsets.all(10),
// //             itemCount: listInventory.length,
// //             itemBuilder: (BuildContext context, int index) {
// //               return GestureDetector(
// //                 onTap: () {
// //                   setState(() {
// //                     currentInventory = index;
// //                     callback(index);
// //                     Navigator.pop(context);
// //                   });
// //                 },
// //                 child: Container(
// //                   height: 30,
// //                   width: 280,
// //                   // padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
// //                   // color: Colors.amber[colorCodes[index]],
// //                   child: Center(child: Text(listInventory[index])),
// //                 ),
// //               );
// //             },
// //             separatorBuilder: (BuildContext context, int index) =>
// //                 const Divider(
// //               color: Colors.black,
// //               thickness: 0.5,
// //             ),
// //           ),
// //         ));
// //     showDialog(
// //         context: context, builder: (BuildContext context) => inventoryDialog);
// //   }
// }