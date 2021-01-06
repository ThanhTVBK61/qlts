import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlts/constant/constant.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_data_update_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_fixed_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_result_API_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';
import 'package:qlts/data_sources/data_sqflite/database_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_config_data_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_detail_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_fixed_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_image_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_provider.dart';
import 'package:qlts/repository/repository.dart';
import 'package:qlts/repository/repository_database.dart';
import 'package:qlts/widget_dialog/dialog_error.dart';
import 'package:qlts/widget_dialog/dialog_loader.dart';
import 'package:qlts/widget_dialog/dialog_success.dart';
import 'package:qlts/widget_home/button_widget.dart';
import 'package:qlts/widget_home/inventory/inventory_input_data.dart';
import 'package:qlts/widget_home/inventory/inventory_qrcode.dart';
import 'package:qlts/widget_background.dart';

class HomeInventory extends StatefulWidget {
  final token;

  HomeInventory({this.token});

  @override
  State<StatefulWidget> createState() => HomeInventoryState();
}

enum onOff { On, Off }

class HomeInventoryState extends State<HomeInventory> {

  TabController _tabController;

  int currentSelected;

  int _selectConnection = 0;

  List<String> _ketNoi = ['Online', 'Offline'];

  Repository repository = Repository();
  RepositoryDatabase repositoryDatabase = RepositoryDatabase(DatabaseProvider.getInstance);

  bool newState = true;

  InventoryResultAPIModel inventoryResultAPIModel;


  @override
  Widget build(BuildContext context) {
    var getInventoryData = Provider.of<InventoryData>(context);
    var getInventoryFixedData =
        Provider.of<InventoryFixedDataProvider>(context);
    var getInventoryConfigData = Provider.of<InventoryConfigData>(context);

    ///Get Inventory Detail
    var getInventoryDetailData = Provider.of<InventoryDetailData>(context);

    ///Get Inventory Image
    var getInventoryImage = Provider.of<InventoryImageProvider>(context);

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
                  shape: Border(bottom: BorderSide(color: Colors.white)),
                  title: Container(
                      padding:  EdgeInsets.only(top: 10*ws),
                      child: Text(
                        TITLE_INVENTORY,
                        style:
                            TextStyle(color: Color(0xFFF2F2F9), fontSize: 20*fs),
                      )),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 110*ws,
                  // toolbarHeight: 42,
                  elevation: 0.0,
                  leading: Container(
                    margin:  EdgeInsets.only(left: 20*ws),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        getInventoryData.clear();
                        getInventoryFixedData.clear();
                        getInventoryDetailData.clear();
                        getInventoryImage.clear();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // actions: [
                  //   Container(
                  //     margin: EdgeInsets.only(right: 5*ws),
                  //     child: IconButton(
                  //       icon: Icon(Icons.dehaze_rounded),
                  //       onPressed: () {},
                  //     ),
                  //   )
                  // ],
                  bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 40*ws),
                    child: TabBar(
                        indicatorWeight: 3,
                        onTap: (_){
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        tabs: [
                      Container(
                          height: 40*ws,
                          width: double.infinity,
                          child: Center(
                              child: Text(
                                TABBAR_TITLE_INVENTORY_HOME,
                            style: TextStyle(fontSize: 15*fs),
                          ))),
                      Container(
                          height: 40*ws,
                          child: Center(
                              child: Text(
                                TABBAR_TITLE_QRCODE,
                            style: TextStyle(fontSize: 15*fs),
                          ))),
                      Container(
                          height: 40*ws,
                          child: Center(
                              child: Text(
                                TABBAR_TITLE_INPUT,
                            style: TextStyle(fontSize: 15*fs),
                          ))),
                    ], indicatorColor: Colors.white),
                  )),
              body: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Card(
                        margin:
                             EdgeInsets.only(top: 20*ws, left: 20*ws, right: 20*ws),
                        shadowColor: Colors.white70,
                        elevation: 10.0*ws,
                        color: Colors.white.withOpacity(1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          padding:  EdgeInsets.only(top: 20*ws, bottom: 10*ws, left: 20*ws, right: 20*ws),
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
                                      style: TextStyle(fontSize: 13*fs),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            margin:  EdgeInsets.only(
                                                right: 20*ws),
                                            child: Text(
                                                getInventoryData.list.length ==
                                                        0
                                                    ? 'Không có đợt kiểm kê tài sản'
                                                    : getInventoryData
                                                        .list[getInventoryData
                                                            .currentIndex]
                                                        .ten,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF050505),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16*fs)))),
                                    IconButton(
                                      onPressed: () {
                                        /// Kiểm tra
                                        if (getInventoryData.list.length > 0) {
                                          print(getInventoryData.list.length);
                                          currentSelected =
                                              getInventoryData.currentIndex;
                                          showModalBottomSheet(
                                              context: context,
                                              backgroundColor: Colors.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                              ),
                                              elevation: 10*ws,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(builder:
                                                    (BuildContext context,
                                                        StateSetter state) {
                                                  return Container(
                                                    child: Column(
                                                      // mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 50*ws,
                                                          child: Center(
                                                            child: Text(
                                                              'Các đợt kiểm kê tài sản',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20*fs),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                 EdgeInsets
                                                                        .only(
                                                                    left: 20*ws,
                                                                    right: 20*ws),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .white),
                                                            // child: SizedBox(
                                                            //   height: 220*ws,
                                                              child: ListView
                                                                  .builder(
                                                                      itemBuilder:
                                                                          (BuildContext
                                                                                  context,
                                                                              int
                                                                                  index) {
                                                                        return RadioListTile(
                                                                          activeColor:
                                                                              Colors.blue,
                                                                          value:
                                                                              index,
                                                                          groupValue:
                                                                              currentSelected,
                                                                          onChanged:
                                                                              (value) {
                                                                            state(
                                                                                () {
                                                                              currentSelected =
                                                                                  value;
                                                                              print(currentSelected);
                                                                            });
                                                                          },
                                                                          title: Text(
                                                                              '${getInventoryData.list[index].ten}'),
                                                                        );
                                                                      },
                                                                      itemCount:
                                                                          getInventoryData
                                                                              .list
                                                                              .length),
                                                          ),
                                                        ),
                                                        Container(
                                                            // height: 50*ws,
                                                            width: double
                                                                .infinity,
                                                            padding:
                                                                 EdgeInsets
                                                                        .only(
                                                                    top: 12*ws),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .white),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                RaisedGradientButton(
                                                                  child: Text(
                                                                      'Chọn',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight: FontWeight.w700,
                                                                          fontSize: 14*fs)),
                                                                  onPressed:
                                                                      () async {
                                                                    if (currentSelected !=
                                                                        getInventoryData
                                                                            .currentIndex) {
                                                                      getInventoryData
                                                                          .updateIndex(currentSelected);

                                                                      ///Sau khi chọn đợt kiểm kê => sẽ gọi API danh sách chốt sổ
                                                                      showLoaderDialog(
                                                                          context);

                                                                      ///Gọi API danh sách chốt sổ
                                                                      InventoryFixedModel
                                                                          inventoryFixedModel =
                                                                          await repository.fetchGetInventoryFixed(
                                                                              token: widget.token,
                                                                              inventoryId: getInventoryData.currentId.toString());

                                                                      if (inventoryFixedModel.errorCode !=
                                                                          SUCCESS) {
                                                                        if (inventoryFixedModel.errorCode !=
                                                                            SUCCESS) {
                                                                          if (inventoryFixedModel.errorCode ==
                                                                              TIME_OUT) {
                                                                            getInventoryData.clear();
                                                                            getInventoryConfigData.clear();
                                                                            getInventoryFixedData.clear();
                                                                            getInventoryDetailData.clear();
                                                                            getInventoryImage.clear();
                                                                          }
                                                                          Navigator.pop(context);

                                                                          ///Show error code
                                                                          showErrorDialog(
                                                                              context: context,
                                                                              errorCode: inventoryFixedModel.errorCode,
                                                                              errorDesc: inventoryFixedModel.errorDesc);
                                                                        }
                                                                      } else {
                                                                        ///list có phần tử mới update
                                                                        getInventoryFixedData
                                                                            .update(inventoryFixedModel);
                                                                        if (inventoryFixedModel.listInventoryFixed.length >
                                                                            0) {
                                                                          getInventoryFixedData.updateId(0);
                                                                        }
                                                                        Navigator.pop(
                                                                            context);
                                                                      }
                                                                      Navigator.pop(
                                                                          context);
                                                                    } else {
                                                                      Navigator.pop(
                                                                          context);
                                                                    }
                                                                  },
                                                                ),
                                                              ],
                                                            ))
                                                      ],
                                                    ),
                                                  );
                                                });
                                              });
                                          // showCupertinoModalPopup(
                                          //     context: context,
                                          //     builder: (BuildContext builder) {
                                          //       return Container(
                                          //         height: h,
                                          //         child: CupertinoActionSheet(
                                          //           title: Container(
                                          //             height: 40,
                                          //             child: Center(
                                          //               child: Text(
                                          //                   'Đợt kiểm kê tài sản', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20*fs),),
                                          //             ),
                                          //           ),
                                          //           cancelButton:
                                          //               CupertinoActionSheetAction(
                                          //             onPressed: () {
                                          //               Navigator.pop(context);
                                          //             },
                                          //             child: Text('Cancel'),
                                          //           ),
                                          //           actions: [
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 1'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 2'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 3'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 4'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 5'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 6'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 7'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 8'),
                                          //             ),CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 7'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 8'),
                                          //             ),CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 7'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 8'),
                                          //             ),CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 7'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 8'),
                                          //             ),
                                          //
                                          //           ],
                                          //         ),
                                          //       );
                                          //     });
                                        }
                                      },
                                      icon: Icon(Icons.expand_more_rounded),
                                    )
                                  ],
                                ),
                              ),

                              ///Gianh cho kiem ke offline
                              Divider(color: Colors.black),

                              ///Chọn sổ
                              Row(
                                children: [
                                  Container(
                                    margin:  EdgeInsets.only(
                                        right: 10*ws, top: 15*ws),
                                    child: Text(
                                      'Chọn sổ',
                                      style: TextStyle(fontSize: 13*fs),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            margin:  EdgeInsets.only(
                                                right: 20*ws),
                                            child: Text(
                                                getInventoryFixedData
                                                            .listInventoryFixed
                                                            .length ==
                                                        0
                                                    ? 'Không có danh sách chốt sổ'
                                                    : getInventoryFixedData
                                                        .listInventoryFixed[
                                                            getInventoryFixedData
                                                                .currentIndex]
                                                        .ten,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF050505),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16*fs)))),
                                    IconButton(
                                      onPressed: () {
                                        if (getInventoryFixedData
                                                .listInventoryFixed.length >
                                            0) {
                                          print(getInventoryFixedData
                                              .listInventoryFixed.length);
                                          // double h = 180.0 + 56*8;
                                          currentSelected =
                                              getInventoryFixedData
                                                  .currentIndex;
                                          showModalBottomSheet(
                                              context: context,
                                              backgroundColor: Colors.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                              ),
                                              elevation: 10*ws,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(builder:
                                                    (BuildContext context,
                                                        StateSetter state) {
                                                  return Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                               EdgeInsets
                                                                      .only(
                                                                  bottom: 20*ws,
                                                                  top: 20*ws),
                                                          child: Center(
                                                            child: Text(
                                                              'Danh sách chốt sổ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20*fs),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                 EdgeInsets
                                                                        .only(
                                                                    left: 20*ws,
                                                                    right: 20*ws),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .white),
                                                            child: ListView
                                                                .builder(
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                context,
                                                                            int
                                                                                index) {
                                                                      return RadioListTile(
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            index,
                                                                        groupValue:
                                                                            currentSelected,
                                                                        onChanged:
                                                                            (value) {
                                                                          state(
                                                                              () {
                                                                            currentSelected =
                                                                                value;
                                                                            print(currentSelected);
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            '${getInventoryFixedData.listInventoryFixed[index].ten}'),
                                                                      );
                                                                    },
                                                                    itemCount: getInventoryFixedData
                                                                        .listInventoryFixed
                                                                        .length),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: double
                                                                .infinity,
                                                            padding:
                                                                 EdgeInsets
                                                                        .only(
                                                                    top: 12*ws),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .white),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                RaisedGradientButton(
                                                                  child: Text(
                                                                      'Chọn',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight: FontWeight.w700,
                                                                          fontSize: 14*fs)),
                                                                  onPressed:
                                                                      () {
                                                                    getInventoryData
                                                                        .updateIndex(
                                                                            currentSelected);
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ],
                                                            ))
                                                      ],
                                                    ),
                                                  );
                                                });
                                              });
                                          // showCupertinoModalPopup(
                                          //     context: context,
                                          //     builder: (BuildContext builder) {
                                          //       return Container(
                                          //         height: h,
                                          //         child: CupertinoActionSheet(
                                          //           title: Container(
                                          //             height: 40,
                                          //             child: Center(
                                          //               child: Text(
                                          //                   'Đợt kiểm kê tài sản', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20*fs),),
                                          //             ),
                                          //           ),
                                          //           cancelButton:
                                          //               CupertinoActionSheetAction(
                                          //             onPressed: () {
                                          //               Navigator.pop(context);
                                          //             },
                                          //             child: Text('Cancel'),
                                          //           ),
                                          //           actions: [
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 1'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 2'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 3'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 4'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 5'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 6'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 7'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 8'),
                                          //             ),CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 7'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 8'),
                                          //             ),CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 7'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 8'),
                                          //             ),CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 7'),
                                          //             ),
                                          //             CupertinoActionSheetAction(
                                          //               onPressed: (){},
                                          //               child: Text('Action 8'),
                                          //             ),
                                          //
                                          //           ],
                                          //         ),
                                          //       );
                                          //     });
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
                                    margin: EdgeInsets.only(right: 10*ws),
                                    child: Text(
                                      'Kết nối *',
                                      style: TextStyle(fontSize: 13*fs),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                right: 20*ws),
                                            child: Text(
                                                getInventoryData.online
                                                    ? 'Online'
                                                    : 'Offline',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF050505),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16*fs)))),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                  Radius.circular(15),
                                                  topRight:
                                                  Radius.circular(15)),
                                            ),
                                            elevation: 10*ws,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                  StateSetter state) {
                                                return Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Container(
                                                        height: 50*ws,
                                                        child: Center(
                                                          child: Text(
                                                            'Kết nối *',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize: 20*fs),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          padding:
                                                          EdgeInsets
                                                              .only(
                                                              left: 20*ws,
                                                              right: 20*ws),
                                                          decoration:
                                                          BoxDecoration(
                                                              color: Colors
                                                                  .white),
                                                          // child: SizedBox(
                                                          //   height: 220*ws,
                                                          child: ListView
                                                              .builder(
                                                              itemBuilder:
                                                                  (BuildContext
                                                              context,
                                                                  int
                                                                  index) {
                                                                return RadioListTile(
                                                                  activeColor:
                                                                  Colors.blue,
                                                                  value:
                                                                  index,
                                                                  groupValue:
                                                                  _selectConnection,
                                                                  onChanged:
                                                                      (value) {
                                                                    state(
                                                                            () {
                                                                          _selectConnection =
                                                                              value;
                                                                          print(_selectConnection);
                                                                        });
                                                                  },
                                                                  title: Text(
                                                                      '${_ketNoi[index]}'),
                                                                );
                                                              },
                                                              itemCount:
                                                              _ketNoi.length),
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: 50*ws,
                                                          width: double
                                                              .infinity,
                                                          padding:
                                                          EdgeInsets
                                                              .only(
                                                              top: 12*ws),
                                                          decoration:
                                                          BoxDecoration(
                                                              color: Colors
                                                                  .white),
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              RaisedGradientButton(
                                                                child: Text(
                                                                    'Chọn',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Colors.white,
                                                                        fontWeight: FontWeight.w700,
                                                                        fontSize: 14*fs)),
                                                                onPressed:
                                                                    () async {
                                                                  if ((_selectConnection == 1 &&
                                                                      getInventoryData
                                                                          .online) || (_selectConnection == 0 &&
                                                                      !getInventoryData
                                                                          .online)) {
                                                                    getInventoryData
                                                                        .updateOnlineState(!getInventoryData.online);

                                                                    Navigator.pop(
                                                                        context);
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ))
                                                    ],
                                                  ),
                                                );
                                              });
                                            });
                                      },
                                      icon: Icon(Icons.expand_more_rounded),
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                  visible: !getInventoryData.online,
                                  child: Divider(color: Colors.black)),

                              ///Upload và tải online
                              Visibility(
                                visible: !getInventoryData.online,
                                child: Container(
                                  margin: EdgeInsets.only(top: 20*ws),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RaisedGradientButton(
                                          child: Text(
                                        'Tải dữ liệu offline',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14*fs),
                                      ),
                                      ///Goi API lay du lieu luu vao sqlite
                                      onPressed: () async {
                                            ///call API get data offline
                                        if(getInventoryData.currentId == -1){
                                          showErrorDialog(context: context, errorDesc: 'Không có đợt kiểm kê tài sản');
                                        }else if(getInventoryFixedData.currentId == -1){
                                          showErrorDialog(context: context,errorDesc: 'Thiếu danh sách chốt sổ');
                                        }else{
                                          showLoaderDialog(context);
                                          InventoryOfflineModel inventoryOfflineModel = await repository.fetchGetDataOfflineInventory(token: widget.token,inventoryId: getInventoryData.currentId.toString(),fixedId: getInventoryFixedData.currentId.toString());
                                          if(inventoryOfflineModel.errorCode != SUCCESS){
                                            if(inventoryOfflineModel.errorCode == TIME_OUT){
                                              getInventoryData.clear();
                                              getInventoryConfigData.clear();
                                              getInventoryFixedData.clear();
                                              getInventoryDetailData.clear();
                                              getInventoryImage.clear();
                                            }
                                            Navigator.pop(context);
                                            showErrorDialog(context: context, errorCode: inventoryOfflineModel.errorCode, errorDesc: inventoryOfflineModel.errorDesc);
                                          }else{
                                            ///Thanh cong => check list.length > 0 => update Sqlite
                                            if(inventoryOfflineModel.listInventoryOffline.length > 0){
                                              ///clear csdl
                                                repositoryDatabase.databaseRepositoryOffline.clear();
                                                getInventoryData.emptySqflite = false;
                                              ///luu vao sqflite
                                              print('**********length*****${inventoryOfflineModel.listInventoryOffline.length}');
                                              for(int i =0; i< inventoryOfflineModel.listInventoryOffline.length;i++){
                                                int currentRow = await repositoryDatabase.databaseRepositoryOffline.insertData(inventoryOfflineModel.listInventoryOffline[i]);
                                                ///insert that bai
                                                if(currentRow < 0){
                                                  repositoryDatabase.databaseRepositoryOffline.clear();
                                                  showErrorDialog(context: context, errorDesc: 'Tải dữ liệu thất bại');
                                                  break;
                                                }
                                              }
                                              Navigator.pop(context);
                                              showSuccessDialog(context: context, message: 'Thành công tải dữ liệu!');
                                            }else{
                                              print('inventoryOfflineModel.listInventoryOffline.length < 0');
                                              Navigator.pop(context);
                                              showErrorDialog(context: context, errorDesc: 'Không có dữ liệu kiểm kê offline');
                                            }
                                          }
                                        }

                                      },),
                                      RaisedGradientButton(
                                          child: Text(
                                        'Upload dữ liệu',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14*fs),
                                      ), onPressed: () async {

                                        showLoaderDialog(context);
                                        Map<String, dynamic> res = await repositoryDatabase.databaseRepositoryOffline.getDataUpload();
                                        print('-------------------$res');
                                        ///Upload data
                                        if (res == null || res == {}) {
                                          Navigator.pop(context);
                                          showErrorDialog(
                                              context: this.context, errorDesc: 'Không có dữ liệu');
                                        }
                                        // else if (getInventoryImage.imageBase64 == null) {
                                        //   Navigator.pop(context);
                                        //   showErrorDialog(
                                        //       context: this.context,
                                        //       errorDesc: 'Chưa có ảnh hiện trường');
                                        // }
                                        else {
                                          InventoryDataUpload inventoryDataUpload =
                                          InventoryDataUpload.getInstance(
                                              token: widget.token,
                                              inventoryId:
                                              getInventoryData.currentId.toString(),
                                              assetId: getInventoryDetailData.idChiTietQLTS
                                                  .toString(),
                                              statusCode: getInventoryConfigData
                                                  .listDataStatusConfig.length >
                                                  0
                                                  ? getInventoryConfigData
                                                  .listDataStatusConfig[
                                              getInventoryConfigData.currentStatus]
                                                  .statusCode
                                                  : '',
                                              dataUpload: res,
                                              scenePhoto: getInventoryImage.imageBase64,
                                              description: 'description');

                                          inventoryResultAPIModel = await repository
                                              .fetchUploadData(inventoryDataUpload: inventoryDataUpload);

                                          if (inventoryResultAPIModel.errorCode == SUCCESS) {
                                            Navigator.pop(context);
                                            showSuccessDialog(context: this.context, message: 'Thành công upload dữ liệu!');
                                          } else {
                                            if (inventoryResultAPIModel.errorCode == TIME_OUT) {
                                              getInventoryData.clear();
                                              getInventoryFixedData.clear();
                                              getInventoryDetailData.clear();
                                              getInventoryImage.clear();
                                              getInventoryConfigData.clear();
                                            }
                                            Navigator.pop(context);
                                            showErrorDialog(
                                                context: this.context,
                                                errorCode: inventoryResultAPIModel.errorCode,
                                                errorDesc: inventoryResultAPIModel.errorDesc);
                                          }
                                        }
                                      },),
                                    ],
                                  ),
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
                  InventoryInputData(token: widget.token),
                ],
              )),
        )
      ],
    );
  }
}
