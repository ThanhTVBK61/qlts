import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qlts/constant/constant.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_detail_model.dart';
import 'package:qlts/data_sources/data_qrcode/permission.dart';
import 'package:qlts/data_sources/data_sqflite/database_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_config_data_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_fixed_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_image_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_detail_provider.dart';
import 'package:qlts/repository/repository.dart';
import 'package:qlts/repository/repository_database.dart';
import 'package:qlts/widget_dialog/dialog_error.dart';
import 'package:qlts/widget_home/button_widget.dart';
import 'package:qlts/widget_home/inventory/inventory_information_update.dart';

class QRCodeInventory extends StatefulWidget {
  final token;

  QRCodeInventory({this.token});

  @override
  State<StatefulWidget> createState() => QRCodeInventoryState();
}

class QRCodeInventoryState extends State<QRCodeInventory> {
  Repository repository = Repository();
  RepositoryDatabase repositoryDatabase =
      RepositoryDatabase(DatabaseProvider.getInstance);

  List<InventoryDetail> listInventoryDetail = [];

  final picker = ImagePicker();
  InventoryDetailModel inventoryDetailModel;

  @override
  Widget build(BuildContext context) {
    var getInventoryDetailData = Provider.of<InventoryDetailData>(context);
    var getInventoryData = Provider.of<InventoryData>(context);
    var getInventoryImage = Provider.of<InventoryImageProvider>(context);

    ///Get Config
    var getInventoryConfigData = Provider.of<InventoryConfigData>(context);

    ///Get Inventory Fixed
    var getInventoryFixedData =
        Provider.of<InventoryFixedDataProvider>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///get du lieu tu camera
          Card(
            margin: EdgeInsets.only(
                right: 20 * ws, left: 20 * ws, bottom: 10 * ws, top: 10 * ws),
            shadowColor: Colors.white70,
            elevation: 10.0,
            color: Colors.white.withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16 * ws),
            ),
            child: Container(
                padding: EdgeInsets.all(10 * ws),
                child: Column(
                  children: [
                    Center(
                        child: PermissionWidget(
                      permission: Permission.camera,
                      callback: (data, clear) async {
                        if (getInventoryData.changeStatusOnline)
                          getInventoryData.updateChangeStatus();
                        if (!clear) {
                          getInventoryDetailData.clear();
                          print("*****home_inventory_qrcode: data==>> $data");
                          if (getInventoryData.currentId != -1) {
                            if (getInventoryData.online) {
                              getInventoryImage.clear();
                              inventoryDetailModel =
                                  await repository.fetchInventoryDetailQRCode(
                                      token: widget.token,
                                      inventoryId:
                                          getInventoryData.currentId.toString(),
                                      typeCode: "qrcode",
                                      value: data);
                              if (inventoryDetailModel.errorCode != SUCCESS) {
                                if (inventoryDetailModel.errorCode ==
                                    TIME_OUT) {
                                  getInventoryData.clear();
                                  getInventoryFixedData.clear();
                                  getInventoryDetailData.clear();
                                  getInventoryImage.clear();
                                  getInventoryConfigData.clear();
                                }

                                ///Show error code
                                showErrorDialog(
                                    context: this.context,
                                    errorCode: inventoryDetailModel.errorCode,
                                    errorDesc: inventoryDetailModel.errorDesc);
                              } else {
                                getInventoryDetailData
                                    .update(inventoryDetailModel, value: data);
                              }
                            } else {
                              getInventoryDetailData.updataDataQrcode(data);
                              if (getInventoryData.emptySqflite) {
                                showErrorDialog(
                                    context: context,
                                    errorDesc:
                                    EMPTY_SQFLITE);
                              } else {
                                List<String> listData =
                                    data == null ? [] : data.split(' ');
                                if(listData.length < 3){
                                  showErrorDialog(
                                      context: context,
                                      errorDesc:
                                      WRONG_QRCODE);
                                }
                                else if(listData.length >= 3){
                                  print(listData.length);
                                  String soThe = listData[0] ?? '';
                                  String maSo = listData[2] ?? '';
                                  String line = listData[1] ?? '';

                                  if (soThe == '' ||
                                      maSo == '' ||
                                      line != '|' ||
                                      line == null) {
                                    showErrorDialog(
                                        context: context,
                                        errorDesc:
                                        WRONG_QRCODE);
                                  } else {
                                    dynamic inventoryOffline =
                                        await repositoryDatabase
                                            .databaseRepositoryOffline
                                            .getDataById(
                                                soThe,
                                                maSo,
                                                getInventoryConfigData
                                                    .listDataVariantConfig);
                                    print(
                                        '---------inventoryOffline Qrcode-----------');
                                    print(inventoryOffline);
                                    print('-----Then--Update-----------');
                                    if (inventoryOffline != null) {
                                      getInventoryDetailData
                                          .updateInventoryOffline(
                                              inventoryOffline);
                                    } else {
                                      showErrorDialog(
                                          context: context,
                                          errorDesc:
                                          ERROR_NOT_FOUND);
                                    }
                                  }
                                }
                              }
                            }
                          } else {
                            showErrorDialog(
                                context: context,
                                errorDesc: LACK_OF_INVENTORY);
                          }
                        } else {
                          getInventoryDetailData.clear();
                        }
                      },
                    )),
                    Container(
                        margin: EdgeInsets.only(
                            top: 5 * ws, left: 15 * ws, right: 5 * ws),
                        child: Text(getInventoryData.changeStatusOnline
                            ? ''
                            : getInventoryDetailData.data ?? ''))
                  ],
                )),
          ),
          Visibility(
            visible: getInventoryData.online,
            child: RaisedGradientButton(
              child: Text('Chụp ảnh',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * fs)),
              onPressed: () async {
                // final picker = ImagePicker();
                final pickedFile =
                    await picker.getImage(source: ImageSource.camera);

                setState(() {
                  if (pickedFile != null) {
                    getInventoryImage.update(
                        base64.encode(File(pickedFile.path).readAsBytesSync()));
                  } else {
                    print('No image selected.');
                  }
                });
              },
            ),
          ),

          InventoryInformationUpdate(token: widget.token)
        ],
      ),
    );
  }

  Container informationDetail(InventoryDetail inventoryDetail) {
    return ((inventoryDetail.maThuocTinh == 'so_the' ||
            inventoryDetail.tenThuocTinh == 'Id Chi tiết')
        ? Container(
            margin: EdgeInsets.only(left: 20 * ws, right: 20 * ws),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 10 * ws),
                            child: Text(
                              inventoryDetail.tenThuocTinh == 'Id Chi tiết'
                                  ? 'Id Chi tiết'
                                  : 'Số thẻ',
                              style: TextStyle(
                                  color: Color(0xFF050505), fontSize: 13 * fs),
                              overflow: TextOverflow.ellipsis,
                            )),
                        Text(
                          inventoryDetail.giaTri,
                          style: TextStyle(
                            fontSize: 16 * fs,
                            color: Color(0xFF050505),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin:
                EdgeInsets.only(top: 10 * ws, left: 20 * ws, right: 20 * ws),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 10 * ws),
                    child: Text(
                      inventoryDetail.tenThuocTinh,
                      style: TextStyle(
                          color: Color(0xFF050505), fontSize: 13 * fs),
                      overflow: TextOverflow.ellipsis,
                    )),
                TextField(
                  style: TextStyle(
                    fontSize: 16 * fs,
                    color: Color(0xFF050505),
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(hintText: ""),
                  controller: TextEditingController()
                    ..text = inventoryDetail.giaTri ?? '',
                ),
              ],
            ),
          ));
  }
}
