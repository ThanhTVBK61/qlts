import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlts/provider/home_inventory/inventory_provider.dart';
import 'package:qlts/widget_home/inventory/inventory_input_data.dart';
import 'package:qlts/widget_home/inventory/inventory_qrcode.dart';
import 'package:qlts/widget_background.dart';

class HomeInventory extends StatefulWidget {
  final token;

  HomeInventory({this.token});

  @override
  State<StatefulWidget> createState() => HomeInventoryState();
}

class HomeInventoryState extends State<HomeInventory> {
  ///Option: Tải dữ liệu online or upload dữ liệu
  bool upload = false;

  @override
  Widget build(BuildContext context) {
    var getInventoryData = Provider.of<InventoryData>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
        ),
        backgroundImage(context),
        DefaultTabController(
          length: 3,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                  title: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Kiểm kê tài sản',
                        style:
                            TextStyle(color: Color(0xFFF2F2F9), fontSize: 20),
                      )),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 110,
                  elevation: 0.0,
                  leading: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        getInventoryData.clear();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        icon: Icon(Icons.dehaze_rounded),
                        onPressed: () {},
                      ),
                    )
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 40),
                    child: TabBar(tabs: [
                      Container(
                          height: 40,
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            'Đợt kiểm kê',
                            style: TextStyle(fontSize: 15),
                          ))),
                      Container(
                          height: 40,
                          child: Center(
                              child: Text(
                            'QR Code',
                            style: TextStyle(fontSize: 15),
                          ))),
                      Container(
                          height: 40,
                          child: Center(
                              child: Text(
                            'Nhập thông tin',
                            style: TextStyle(fontSize: 14.8),
                          ))),
                    ], indicatorColor: Colors.white),
                  )),
              body: TabBarView(
                children: [
                  Column(
                    children: [
                      Card(
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        shadowColor: Colors.white70,
                        elevation: 10.0,
                        color: Colors.white.withOpacity(1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Chọn đợt kiểm kê tài sản
                              Row(
                                children: [
                                  Container(
                                    // margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      'Chọn đợt (*)',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                // margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                                // listInventory.length == 0
                                                getInventoryData.list.length ==
                                                        0
                                                    ? 'Không có đợt kiểm kê tài sản'
                                                    // : listInventory[
                                                    : getInventoryData
                                                        .list[getInventoryData
                                                            .currentIndex]
                                                        .ten,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF050505),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)))),
                                    IconButton(
                                      onPressed: () {
                                        // if (nameInventory.length > 0) {
                                        if ( getInventoryData.list.length > 0) {
                                          print(getInventoryData.list.length);
                                          double h = 180.0 + 56*8;
                                          // showModalBottomSheet(
                                          //     context: context,
                                          //     shape: RoundedRectangleBorder(
                                          //       borderRadius: BorderRadius.only(
                                          //           topLeft:
                                          //               Radius.circular(15),
                                          //           topRight:
                                          //               Radius.circular(15)),
                                          //     ),
                                          //     elevation: 10,
                                          //     builder: (_) {
                                          //       return new Container(
                                          //         // height: 500,
                                          //         padding:
                                          //             const EdgeInsets.all(20),
                                          //         child: Column(
                                          //           crossAxisAlignment:
                                          //               CrossAxisAlignment
                                          //                   .center,
                                          //           children: [
                                          //             Container(
                                          //               margin: const EdgeInsets
                                          //                   .only(bottom: 20),
                                          //               child: Text(
                                          //                 'Các đợt kiểm kê tài sản',
                                          //                 style: TextStyle(
                                          //                     fontWeight:
                                          //                         FontWeight
                                          //                             .bold,
                                          //                     fontSize: 16),
                                          //               ),
                                          //             ),
                                          //             Expanded(
                                          //               child: ListView
                                          //                   .separated(
                                          //                       itemBuilder:
                                          //                           (BuildContext
                                          //                                   context,
                                          //                               int
                                          //                                   index) {
                                          //                         return GestureDetector(
                                          //                           onTap: () {
                                          //                             getInventoryData
                                          //                                 .updateId(
                                          //                                     index);
                                          //                             Navigator.pop(
                                          //                                 context);
                                          //                           },
                                          //                           child: Center(
                                          //                               child: Text(getInventoryData
                                          //                                   .list[index]
                                          //                                   .ten)),
                                          //                         );
                                          //                       },
                                          //                       separatorBuilder: (BuildContext
                                          //                                   context,
                                          //                               int
                                          //                                   index) =>
                                          //                           const Divider(
                                          //                               color: Colors
                                          //                                   .black,
                                          //                               thickness:
                                          //                                   0.5),
                                          //                       itemCount:
                                          //                           getInventoryData
                                          //                               .list
                                          //                               .length),
                                          //             )
                                          //           ],
                                          //         ),
                                          //       );
                                          //     });
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext builder) {
                                                return Container(
                                                  height: h,
                                                  child: CupertinoActionSheet(
                                                    title: Container(
                                                      height: 40,
                                                      child: Center(
                                                        child: Text(
                                                            'Đợt kiểm kê tài sản', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
                                                      ),
                                                    ),
                                                    cancelButton:
                                                        CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Cancel'),
                                                    ),
                                                    actions: [
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 1'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 2'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 3'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 4'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 5'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 6'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 7'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 8'),
                                                      ),CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 7'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 8'),
                                                      ),CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 7'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 8'),
                                                      ),CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 7'),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: (){},
                                                        child: Text('Action 8'),
                                                      ),

                                                    ],
                                                  ),
                                                );
                                              });
                                        }
                                      },
                                      icon: Icon(Icons.expand_more_rounded),
                                    )
                                  ],
                                ),
                              ),
                              Divider(color: Colors.black),

                              ///Chọn sổ
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 15),
                                    child: Text(
                                      'Chọn sổ',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                                // listInventory.length == 0
                                                getInventoryData.list.length ==
                                                        0
                                                    ? 'Không có đợt kiểm kê tài sản'
                                                    // : listInventory[
                                                    : getInventoryData
                                                        .list[getInventoryData
                                                            .currentIndex]
                                                        .ten,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF050505),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)))),
                                    IconButton(
                                      onPressed: () {
                                        // if (nameInventory.length > 0) {
                                        if (getInventoryData.list.length > 0) {
                                          showModalBottomSheet(
                                              context: context,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                              ),
                                              elevation: 10,
                                              builder: (_) {
                                                return new Container(
                                                  // height: 500,
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(bottom: 20),
                                                        child: Text(
                                                          'Các đợt kiểm kê tài sản',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ListView
                                                            .separated(
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int
                                                                            index) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      getInventoryData
                                                                          .updateId(
                                                                              index);
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Center(
                                                                        child: Text(getInventoryData
                                                                            .list[index]
                                                                            .ten)),
                                                                  );
                                                                },
                                                                separatorBuilder: (BuildContext
                                                                            context,
                                                                        int
                                                                            index) =>
                                                                    const Divider(
                                                                        color: Colors
                                                                            .black,
                                                                        thickness:
                                                                            0.5),
                                                                itemCount:
                                                                    getInventoryData
                                                                        .list
                                                                        .length),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        }
                                      },
                                      icon: Icon(Icons.expand_more_rounded),
                                    )
                                  ],
                                ),
                              ),
                              Divider(color: Colors.black),

                              ///Kết nối: online/offline
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      'Kết nối *',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                // margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                                // listInventory.length == 0
                                                getInventoryData.list.length ==
                                                        0
                                                    ? 'Không có đợt kiểm kê tài sản'
                                                    // : listInventory[
                                                    : getInventoryData
                                                        .list[getInventoryData
                                                            .currentIndex]
                                                        .ten,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF050505),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)))),
                                    IconButton(
                                      onPressed: () {
                                        // if (nameInventory.length > 0) {
                                        if (getInventoryData.list.length > 0) {
                                          showModalBottomSheet(
                                              context: context,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                              ),
                                              elevation: 10,
                                              builder: (_) {
                                                return new Container(
                                                  // height: 500,
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(bottom: 20),
                                                        child: Text(
                                                          'Các đợt kiểm kê tài sản',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ListView
                                                            .separated(
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int
                                                                            index) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      getInventoryData
                                                                          .updateId(
                                                                              index);
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Center(
                                                                        child: Text(getInventoryData
                                                                            .list[index]
                                                                            .ten)),
                                                                  );
                                                                },
                                                                separatorBuilder: (BuildContext
                                                                            context,
                                                                        int
                                                                            index) =>
                                                                    const Divider(
                                                                        color: Colors
                                                                            .black,
                                                                        thickness:
                                                                            0.5),
                                                                itemCount:
                                                                    getInventoryData
                                                                        .list
                                                                        .length),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        }
                                      },
                                      icon: Icon(Icons.expand_more_rounded),
                                    )
                                  ],
                                ),
                              ),
                              Divider(color: Colors.black),

                              ///Upload và tải online
                              Visibility(
                                visible: true,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (upload) {
                                            setState(() {
                                              upload = false;
                                            });
                                          }
                                        },
                                        child: Container(
                                          // width: 140,
                                          height: 40,
                                          margin: const EdgeInsets.only(
                                              top: 18, right: 16),
                                          decoration: buttonState(!upload),
                                          child: Center(
                                            child: Text(
                                              'Tải dữ liệu online',
                                              style: TextStyle(
                                                  color: getTextColor(!upload),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (!upload) {
                                            setState(() {
                                              upload = true;
                                            });
                                          }
                                        },
                                        child: Container(
                                          // width: 140,
                                          height: 40,
                                          margin: const EdgeInsets.only(
                                              top: 18, left: 16),
                                          decoration: buttonState(upload),
                                          child: Center(
                                            child: Text(
                                              'Upload dữ liệu',
                                              style: TextStyle(
                                                  color: getTextColor(upload),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // QRCodeInventory(idInventory: idCurrentInventory, token: widget.token),
                  QRCodeInventory(token: widget.token),
                  InventoryInputData(),
                ],
              )),
        )
      ],
    );
  }

  BoxDecoration buttonState(bool upload) {
    return (upload
        ? BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
                colors: [Color(0xFF00A3FF), Color(0xFF0033E7)],
                begin: Alignment.topLeft,
                end: Alignment(0.0, 0.0)))
        : BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Color(0xFF2E76BB))));
  }

  Color getTextColor(bool upload) {
    return (upload ? Colors.white : Color(0xFF1265B6));
  }

  List<Widget> convertToWidget(List list) {
    List<Widget> listWidget = [];
    list.forEach((element) {
      var text = Text(element.ten);
      listWidget.add(text);
    });

    return listWidget;
  }

// void _errorDialog(String errCode, String err) {
//   Dialog errorDialog = Dialog(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0)), //this right here
//       child: Container(
//           height: 300.0,
//           width: 200.0,
//           child: Container(
//             padding: const EdgeInsets.only(
//                 top: 10, right: 15, left: 15, bottom: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Thông báo',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//                 Container(
//                     margin: const EdgeInsets.only(top: 20, bottom: 20),
//                     child: Text(errCode == '498.2'
//                         ? 'Phiên làm việc của bạn đã hết hạn.\nVui lòng ăng nhập lại'
//                         : err)),
//                 RaisedButton(
//                   textColor: Colors.white,
//                   onPressed: () {
//                     Navigator.pop(context);
//                     if (errCode == '498.2') {
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SplashPage()),
//                           (Route<dynamic> route) => false);
//                     } else {
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(color: Colors.blue),
//                       child: Text('OK')),
//                 )
//               ],
//             ),
//           )));
//   showDialog(
//       context: context, builder: (BuildContext context) => errorDialog);
// }
}
