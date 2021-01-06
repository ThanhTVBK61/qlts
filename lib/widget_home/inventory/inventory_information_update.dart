import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qlts/constant/constant.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_data_update_model.dart';
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
import 'package:qlts/widget_home/inventory/inventory_show_image.dart';

class InventoryInformationUpdate extends StatefulWidget {
  final token;

  InventoryInformationUpdate({this.token});

  @override
  State<StatefulWidget> createState() => InventoryInformationUpdateState();
}

class InventoryInformationUpdateState
    extends State<InventoryInformationUpdate> {
  Repository repository = Repository();
  RepositoryDatabase repositoryDatabase =
      RepositoryDatabase(DatabaseProvider.getInstance);

  int currentSelected;
  InventoryResultAPIModel inventoryResultAPIModel;

  @override
  Widget build(BuildContext context) {
    var getInventoryConfigData = Provider.of<InventoryConfigData>(context);
    var getInventoryDetailData = Provider.of<InventoryDetailData>(context);
    var getInventoryData = Provider.of<InventoryData>(context);
    var getImageData = Provider.of<InventoryImageProvider>(context);

    ///Get Inventory Fixed
    var getInventoryFixedData =
        Provider.of<InventoryFixedDataProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          margin:
              EdgeInsets.only(bottom: 20 * ws, right: 20 * ws, left: 20 * ws),
          shadowColor: Colors.white70,
          elevation: 10.0 * ws,
          color: Colors.white.withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            // height: 385.h,
            padding: EdgeInsets.only(
                bottom: 10 * ws, top: 10 * ws, right: 20 * ws, left: 20 * ws),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ///TextView: Tình trạng kiểm kê
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10 * ws, top: 15 * ws),
                      child: Text(
                        'Tình trạng kiểm kê',
                        style: TextStyle(fontSize: 13 * fs),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(right: 20 * ws),
                              child: Text(
                                  getInventoryConfigData
                                              .listDataStatusConfig.length ==
                                          0
                                      ? 'Không có tình trạng kiểm kê tài sản'
                                      : getInventoryConfigData
                                          .listDataStatusConfig[
                                              getInventoryConfigData
                                                  .currentStatus]
                                          .statusName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(0xFF050505),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16 * fs)))),
                      IconButton(
                        iconSize: 24 * ws,
                        onPressed: () {
                          if (getInventoryConfigData
                                  .listDataStatusConfig.length >
                              0) {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                ),
                                elevation: 10,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter state) {
                                    return Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 20 * ws, top: 20 * ws),
                                            child: Center(
                                              child: Text(
                                                'Tình trạng kiểm kê',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20 * fs),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 20 * ws,
                                                  right: 20 * ws),
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: ListView.builder(
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return RadioListTile(
                                                      activeColor: Colors.blue,
                                                      value: index,
                                                      groupValue:
                                                          currentSelected,
                                                      onChanged: (value) {
                                                        state(() {
                                                          currentSelected =
                                                              value;
                                                          print(
                                                              currentSelected);
                                                        });
                                                      },
                                                      title: Text(
                                                          '${getInventoryConfigData.listDataStatusConfig[index].statusName}'),
                                                    );
                                                  },
                                                  itemCount:
                                                      getInventoryConfigData
                                                          .listDataStatusConfig
                                                          .length),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding:
                                                EdgeInsets.only(top: 12 * ws),
                                            decoration: BoxDecoration(
                                                color: Colors.white),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                RaisedGradientButton(
                                                  child: Text('Chọn',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14 * fs)),
                                                  onPressed: () {
                                                    getInventoryConfigData
                                                        .updateIndexStatus(
                                                            currentSelected);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                                });
                          }
                        },
                        icon: Icon(Icons.expand_more_rounded),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin:
              EdgeInsets.only(bottom: 20 * ws, right: 20 * ws, left: 20 * ws),
          shadowColor: Colors.white70,
          elevation: 10.0,
          color: Colors.white.withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16 * ws),
          ),
          child: Container(
            // height: ((getInventoryDetailData.listInventoryDetail.length == 0 && getInventoryData.online) || (getInventoryDetailData.inventoryOffline == null && !getInventoryData.online) || (getInventoryDetailData.inventoryOffline != null && getInventoryDetailData.inventoryOffline.listDataShow.length > 0 && !getInventoryData.online))
            //     ? 60*ws
            //     : 400*ws,
            height: (getInventoryData.online
                ? (getInventoryDetailData.listInventoryDetail.length == 0
                    ? 60 * ws
                    : 400 * ws)
                : (getInventoryDetailData.inventoryOffline == null ||
                        (getInventoryDetailData.inventoryOffline != null &&
                            getInventoryDetailData
                                    .inventoryOffline.listDataShow.length ==
                                0))
                    ? 60 * ws
                    : 400 * ws),

            margin: EdgeInsets.only(top: 20 * ws, bottom: 20 * ws),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10 * ws),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20 * ws, left: 20 * ws),
                      child: Text(
                        'Thông tin tài sản',
                        style: TextStyle(
                            color: Color(0xFF050505),
                            fontWeight: FontWeight.bold,
                            fontSize: 16 * fs),
                      ),
                    )),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      getInventoryData.online
                          ? SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) => ListTile(
                                        title: Container(
                                          margin: EdgeInsets.only(
                                              top: 10 * ws,
                                              left: 20 * ws,
                                              right: 20 * ws),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10 * ws),
                                                  child: Text(
                                                    getInventoryDetailData
                                                        .listInventoryDetail[
                                                            index]
                                                        .tenThuocTinh,
                                                    style: TextStyle(
                                                        color: getInventoryDetailData
                                                                .listInventoryDetail[
                                                                    index]
                                                                .capNhat
                                                            ? Color(0xFF050505)
                                                            : Colors.grey,
                                                        fontSize: 13 * fs),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                              getInventoryDetailData
                                                          .listInventoryDetail[
                                                              index]
                                                          .kieuDuLieu ==
                                                      'date'
                                                  ? Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                                '${getInventoryDetailData.listInventoryDetail[index].giaTri ?? ''}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16 * fs,
                                                                  color: getInventoryDetailData
                                                                          .listInventoryDetail[
                                                                              index]
                                                                          .capNhat
                                                                      ? Color(
                                                                          0xFF050505)
                                                                      : Colors
                                                                          .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ))),
                                                        IconButton(
                                                            icon: Icon(Icons
                                                                .date_range_rounded),
                                                            color: getInventoryDetailData
                                                                .listInventoryDetail[
                                                            index]
                                                                .capNhat
                                                                ? Color(
                                                                0xFF050505)
                                                                : Colors.grey,
                                                            onPressed:
                                                                () async {
                                                              if (!getInventoryDetailData
                                                                  .listInventoryDetail[
                                                                      index]
                                                                  .capNhat) {
                                                                DateTime
                                                                    picked =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          0),
                                                                  lastDate:
                                                                      DateTime
                                                                          .now(),
                                                                  helpText:
                                                                      'Chọn ngày tháng',
                                                                  cancelText:
                                                                      'Cancel',
                                                                  confirmText:
                                                                      'OK',
                                                                  errorFormatText:
                                                                      'Sai định dạng! Định dạng: DD/MM/YYYY',
                                                                  errorInvalidText:
                                                                      'Ngày tháng không hợp lệ!',
                                                                );
                                                                print(picked);
                                                                getInventoryDetailData
                                                                        .listInventoryDetail[
                                                                            index]
                                                                        .giaTri =
                                                                    '$picked';
                                                              }
                                                            })
                                                      ],
                                                    )
                                                  : TextFormField(
                                                      onChanged: (value) {
                                                        TextEditingController()
                                                          ..text = value;
                                                        getInventoryDetailData
                                                            .listInventoryDetail[
                                                                index]
                                                            .giaTri = value;
                                                      },
                                                      validator: (value) {
                                                        if (getInventoryDetailData
                                                                .listInventoryDetail[
                                                                    index]
                                                                .kieuDuLieu ==
                                                            'date') {
                                                          var year =
                                                              int.parse(value);
                                                          if (year < 0)
                                                            return 'Năm không hợp lệ';
                                                          else {
                                                            var date =
                                                                new DateTime
                                                                        .now()
                                                                    .toString();
                                                            var dateParse =
                                                                DateTime.parse(
                                                                    date);
                                                            if (year >
                                                                dateParse.year)
                                                              return 'Năm không hợp lệ';
                                                          }
                                                        }
                                                        return null;
                                                      },
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      enabled:
                                                          getInventoryDetailData
                                                              .listInventoryDetail[
                                                                  index]
                                                              .capNhat,
                                                      style: TextStyle(
                                                        fontSize: 16 * fs,
                                                        color: getInventoryDetailData
                                                                .listInventoryDetail[
                                                                    index]
                                                                .capNhat
                                                            ? Color(0xFF050505)
                                                            : Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      decoration:
                                                          InputDecoration(),
                                                      keyboardType:
                                                          getInventoryDetailData
                                                                      .listInventoryDetail[
                                                                          index]
                                                                      .kieuDuLieu ==
                                                                  'text'
                                                              ? TextInputType
                                                                  .text
                                                              : TextInputType
                                                                  .number,
                                                      controller: TextEditingController()
                                                        ..text =
                                                            getInventoryDetailData
                                                                    .listInventoryDetail[
                                                                        index]
                                                                    .giaTri ??
                                                                '',
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  childCount: getInventoryDetailData
                                      .listInventoryDetail.length),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) => ListTile(
                                        title: Container(
                                          margin: EdgeInsets.only(
                                              top: 10 * ws,
                                              left: 20 * ws,
                                              right: 20 * ws),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10 * ws),
                                                  child: Text(
                                                    getInventoryDetailData
                                                            .inventoryOffline
                                                            .listDataShow[index]
                                                            .name ??
                                                        ' ',
                                                    style: TextStyle(
                                                        color: getInventoryDetailData
                                                                .inventoryOffline
                                                                .listDataShow[
                                                                    index]
                                                                .canUpdate
                                                            ? Color(0xFF050505)
                                                            : Colors.grey,
                                                        fontSize: 13 * fs),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                              getInventoryDetailData
                                                          .inventoryOffline
                                                          .listDataShow[index]
                                                          .type ==
                                                      'date'
                                                  ? Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                                '${getInventoryDetailData.inventoryOffline.listDataShow[index].giaTri ?? ''}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16 * fs,
                                                                  color: getInventoryDetailData
                                                                          .inventoryOffline
                                                                          .listDataShow[
                                                                              index]
                                                                          .canUpdate
                                                                      ? Color(
                                                                          0xFF050505)
                                                                      : Colors
                                                                          .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ))),
                                                        IconButton(
                                                            icon: Icon(Icons
                                                                .date_range_rounded),
                                                            color: getInventoryDetailData
                                                                    .inventoryOffline
                                                                    .listDataShow[
                                                                        index]
                                                                    .canUpdate
                                                                ? Color(
                                                                    0xFF050505)
                                                                : Colors.grey,
                                                            onPressed:
                                                                () async {
                                                              if (!getInventoryDetailData
                                                                  .inventoryOffline
                                                                  .listDataShow[
                                                                      index]
                                                                  .canUpdate) {
                                                                DateTime
                                                                    picked =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          0),
                                                                  lastDate:
                                                                      DateTime
                                                                          .now(),
                                                                  helpText:
                                                                      'Chọn ngày tháng',
                                                                  cancelText:
                                                                      'Cancel',
                                                                  confirmText:
                                                                      'OK',
                                                                  errorFormatText:
                                                                      'Sai định dạng! Định dạng: DD/MM/YYYY',
                                                                  errorInvalidText:
                                                                      'Ngày tháng không hợp lệ!',
                                                                );
                                                                print(picked);
                                                                getInventoryDetailData
                                                                    .inventoryOffline
                                                                    .listDataShow[
                                                                        index]
                                                                    .giaTri = '$picked';
                                                              }
                                                            })
                                                      ],
                                                    )
                                                  : TextFormField(
                                                      onChanged: (value) {
                                                        TextEditingController()
                                                          ..text = value;
                                                        getInventoryDetailData
                                                            .inventoryOffline
                                                            .listDataShow[index]
                                                            .giaTri = value;
                                                      },
                                                      validator: (value) {
                                                        if (getInventoryDetailData
                                                                .inventoryOffline
                                                                .listDataShow[
                                                                    index]
                                                                .type ==
                                                            'date') {
                                                          var year =
                                                              int.parse(value);
                                                          if (year < 0)
                                                            return 'Năm không hợp lệ';
                                                          else {
                                                            var date =
                                                                new DateTime
                                                                        .now()
                                                                    .toString();
                                                            var dateParse =
                                                                DateTime.parse(
                                                                    date);
                                                            if (year >
                                                                dateParse.year)
                                                              return 'Năm không hợp lệ';
                                                          }
                                                        }
                                                        return null;
                                                      },
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      enabled:
                                                          getInventoryDetailData
                                                              .inventoryOffline
                                                              .listDataShow[
                                                                  index]
                                                              .canUpdate,
                                                      style: TextStyle(
                                                        fontSize: 16 * fs,
                                                        color: getInventoryDetailData
                                                                .inventoryOffline
                                                                .listDataShow[
                                                                    index]
                                                                .canUpdate
                                                            ? Color(0xFF050505)
                                                            : Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      decoration:
                                                          InputDecoration(),
                                                      keyboardType:
                                                          getInventoryDetailData
                                                                      .inventoryOffline
                                                                      .listDataShow[
                                                                          index]
                                                                      .type ==
                                                                  'text'
                                                              ? TextInputType
                                                                  .text
                                                              : TextInputType
                                                                  .number,
                                                      controller: TextEditingController()
                                                        ..text = getInventoryDetailData
                                                                .inventoryOffline
                                                                .listDataShow[
                                                                    index]
                                                                .giaTri ??
                                                            '',
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  childCount:
                                      getInventoryDetailData.inventoryOffline ==
                                              null
                                          ? 0
                                          : getInventoryDetailData
                                              .inventoryOffline
                                              .listDataShow
                                              .length),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: getInventoryData.online
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            Visibility(
              visible: getInventoryData.online,
              child: RaisedGradientButton(
                child: Text(
                  'Ảnh hiện trường',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * fs),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowImage()));
                },
              ),
            ),
            RaisedGradientButton(
                child: Text(
                  'Cập nhật',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * fs),
                ),
                onPressed: () async {
                  if (getInventoryData.online) {
                    ///Update data online
                    if (getInventoryDetailData.listInventoryDetail.length ==
                        0) {
                      showErrorDialog(
                          context: this.context, errorDesc: 'Không có dữ liệu');
                    } else if (getImageData.imageBase64 == null) {
                      showErrorDialog(
                          context: this.context,
                          errorDesc: 'Chưa có ảnh hiện trường');
                    } else {
                      showLoaderDialog(context);
                      InventoryDataUpdateModel dataUpdate =
                          InventoryDataUpdateModel.getInstance(
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
                              dataUpdate: getInventoryDetailData.dataUpdate(),
                              scenePhoto: getImageData.imageBase64,
                              description: 'description');

                      inventoryResultAPIModel = await repository
                          .fetchUpdateOnline(dataUpdate: dataUpdate);

                      if (inventoryResultAPIModel.errorCode == SUCCESS) {
                        Navigator.pop(context);
                        showSuccessDialog(
                            context: this.context,
                            message: 'Thành công cập nhật dữ liệu');
                      } else {
                        if (inventoryResultAPIModel.errorCode == TIME_OUT) {
                          getInventoryData.clear();
                          getInventoryFixedData.clear();
                          getInventoryDetailData.clear();
                          getImageData.clear();
                          getInventoryConfigData.clear();
                        }
                        Navigator.pop(context);
                        showErrorDialog(
                            context: this.context,
                            errorCode: inventoryResultAPIModel.errorCode,
                            errorDesc: inventoryResultAPIModel.errorDesc);
                      }
                    }
                  } else {
                    ///Chua co du lieu
                    if ((getInventoryDetailData.inventoryOffline == null ||
                        (getInventoryDetailData.inventoryOffline != null &&
                            getInventoryDetailData
                                    .inventoryOffline.listDataShow.length ==
                                0))) {
                      showErrorDialog(
                          context: this.context, errorDesc: 'Không có dữ liệu');
                    } else {
                      /// Update vao trong co so du lieu
                      int id = await repositoryDatabase
                          .databaseRepositoryOffline
                          .update(InventoryOffline.fromDataOffline(
                              getInventoryDetailData.inventoryOffline));
                      print('----------Success----------$id------------------');
                      if (id == 1)
                        showSuccessDialog(
                            context: context,
                            message: 'Thành công cập nhật dữ liệu');
                      else {
                        showErrorDialog(
                            context: context, errorDesc: "Cập nhật thất bại");
                      }
                    }
                  }
                }),
          ],
        )
      ],
    );
  }
}
