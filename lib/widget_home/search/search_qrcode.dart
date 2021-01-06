import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qlts/constant/constant.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';
import 'package:qlts/data_sources/data_qrcode/permission.dart';
import 'package:qlts/provider/home_inventory/inventory_config_data_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_fixed_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_provider.dart';
import 'package:qlts/provider/home_search/search_data_provider.dart';
import 'package:qlts/provider/home_search/search_input_data_provider.dart';
import 'package:qlts/repository/repository.dart';
import 'package:qlts/widget_dialog/dialog_error.dart';
import 'package:qlts/widget_dialog/dialog_loader.dart';

class SearchQRCode extends StatefulWidget {
  final token;

  SearchQRCode({this.token});

  @override
  State<StatefulWidget> createState() => SearchQRCodeState();
}

class SearchQRCodeState extends State<SearchQRCode> {
  Repository repository = Repository();
  ItemSearchModel itemSearchModel;
  String type = 'qrcode';

  @override
  Widget build(BuildContext context) {
    var result = Provider.of<SearchDataModel>(context);
    ///Search Input Data
    var searchInput = Provider.of<SearchInputDataModel>(context);
    ///Get Config
    var getInventoryConfigData = Provider.of<InventoryConfigData>(context);
    ///Get Inventory Round
    var getInventoryData = Provider.of<InventoryData>(context);
    ///Get Inventory Fixed
    var getInventoryFixedData = Provider.of<InventoryFixedDataProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///get du lieu tu camera
          Card(
            margin: EdgeInsets.all(20*ws),
            shadowColor: Colors.white70,
            elevation: 10.0*ws,
            color: Colors.white.withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
                child: Container(
                    padding: EdgeInsets.all(10*ws),
                    child: Column(
                      children: [
                        PermissionWidget(
                          permission: Permission.camera,
                          callback: (data, clear) async {
                            if (!clear) {
                              result.clear();
                              result.updateDataQrCode(data);
                              print("*****home_search_qrcode: data==>> $data");
                              showLoaderDialog(context);
                              itemSearchModel =
                                  await repository.fetchSearchQRCode(
                                      token: widget.token,
                                      type: type,
                                      value: data);
                              if (itemSearchModel.errorCode != SUCCESS) {
                                if (itemSearchModel.errorCode == TIME_OUT) {
                                  getInventoryData.clear();
                                  getInventoryFixedData.clear();
                                  getInventoryConfigData.clear();
                                  searchInput.clear();
                                  result.clear();
                                }
                                Navigator.pop(context);
                                ///Show error code
                                if(itemSearchModel.errorCode == '203'){
                                  showErrorDialog(context: this.context, errorDesc: ERROR_NOT_FOUND);
                                }else{
                                  showErrorDialog(context: this.context, errorCode: itemSearchModel.errorCode, errorDesc: itemSearchModel.errorDesc);
                                }
                              }else{
                                Navigator.pop(context);
                                result.update(this.itemSearchModel);
                              }
                            }
                            else {
                              result.clear();
                            }
                          },
                        ),
                        Container(
                            margin:
                            EdgeInsets.only(top: 5*ws, left: 15*ws, right: 5*ws),
                            child: Text(result.data ?? ''))
                      ],
                    ))),
          ),

          Card(
            margin: EdgeInsets.only(bottom: 20*ws, right: 20*ws, left: 20*ws),
            shadowColor: Colors.white70,
            elevation: 10.0,
            color: Colors.white.withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              height: result.list.length == 0
                  ? 90*ws
                  : 400*ws,
              margin: EdgeInsets.only(top: 20*ws, bottom: 20*ws),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10*ws),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20*ws, left: 20*ws),
                        child: Text(
                          'Thông tin tài sản',
                          style: TextStyle(
                              color: Color(0xFF050505),
                              fontWeight: FontWeight.bold,
                              fontSize: 16*fs),
                        ),
                      )),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                                  (context, index) => ListTile(
                                title: _informationDetail(
                                    this.context,
                                    result
                                        .list[index],
                                    index),
                              ),
                              childCount: result
                                  .list.length),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Expanded(
          //   child: Container(
          //     margin: const EdgeInsets.only(top: 10),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //             margin: const EdgeInsets.only(right: 10),
          //             child: Container(
          //               margin: const EdgeInsets.only(bottom: 10, left: 20),
          //               child: Text(
          //                 'Thông tin tài sản',
          //                 style: TextStyle(
          //                     color: Color(0xFF050505),
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 16*fs),
          //               ),
          //             )),
          //         Expanded(
          //           child: CustomScrollView(
          //             slivers: [
          //               SliverList(
          //                 delegate: SliverChildBuilderDelegate(
          //                     (context, index) => ListTile(
          //                           title: informationDetail(
          //                               dataProvider.list[index]),
          //                         ),
          //                     childCount: dataProvider.list.length),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

///Sử dụng cho cả tìm kiếm bằng nhập thông tin=> hiển thị thông tin chi tiết đợt kiểm kê
Container _informationDetail(
    BuildContext context, Result result, int index) {
  return Container(
    margin: EdgeInsets.only(top: 10*ws, left: 20*ws, right: 20*ws),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 10*ws),
            child: Text(
              result.tenThuocTinh,
              style: TextStyle(color: Color(0xFF050505), fontSize: 13*fs),
              overflow: TextOverflow.ellipsis,
            )),
        TextField(
          enabled: false,
          style: TextStyle(
            fontSize: 16*fs,
            color: Color(0xFF050505),
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(),
          keyboardType: result.kieuDuLieu == 'text'
              ? TextInputType.text
              : TextInputType.number,
          controller: TextEditingController()
            ..text = result.giaTri ?? '',
        ),
      ],
    ),
  );
}
