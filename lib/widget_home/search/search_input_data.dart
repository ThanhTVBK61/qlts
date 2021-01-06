import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlts/constant/constant.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';
import 'package:qlts/provider/home_inventory/inventory_config_data_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_fixed_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_provider.dart';
import 'package:qlts/provider/home_search/search_data_provider.dart';
import 'package:qlts/provider/home_search/search_input_data_provider.dart';
import 'package:qlts/widget_dialog/dialog_error.dart';
import 'package:qlts/repository/repository.dart';
import 'package:qlts/widget_dialog/dialog_loader.dart';
import 'package:qlts/widget_home/button_widget.dart';

class SearchInputData extends StatefulWidget {
  final token;

  SearchInputData({this.token});

  @override
  State<StatefulWidget> createState() => SearchInputDataState();
}

class SearchInputDataState extends State<SearchInputData> {
  String _soThe = '';
  String _id = '';
  String _serial = '';
  int type = -1;

  bool error = false;

  ItemSearchModel itemSearchModel;
  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    var result = Provider.of<SearchInputDataModel>(context);
    ///Search QrCode
    var searchData = Provider.of<SearchDataModel>(context);
    ///Get Config
    var getInventoryConfigData = Provider.of<InventoryConfigData>(context);
    ///Get Inventory Round
    var getInventoryData = Provider.of<InventoryData>(context);
    ///Get Inventory Fixed
    var getInventoryFixedData = Provider.of<InventoryFixedDataProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin:  EdgeInsets.all(20*ws),
            shadowColor: Colors.white70,
            elevation: 10.0*ws,
            color: Colors.white.withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              height: 280*ws,
              padding: EdgeInsets.only(
                  bottom: 10*ws, top: 20*ws, right: 20*ws, left: 20*ws),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        ///So the
                        Expanded(
                            flex: 10,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Text(
                                    'Số thẻ',
                                    style: TextStyle(
                                        color: type == 1
                                            ? Colors.grey
                                            : Color(0xFF050505),
                                        fontSize: 13*fs),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  TextField(
                                    enabled: type != 1,
                                    onChanged: (data) {
                                      setState(() {
                                        _soThe = data;
                                        error = false;
                                        if (data != '') {
                                          if (type != 2) type = 2;
                                        } else {
                                          if (empty()) type = -1;
                                        }
                                      });
                                    },
                                    style: TextStyle(
                                      fontSize: 16*fs,
                                      color: Color(0xFF050505),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                        hintText: 'Nhập số thẻ',
                                        hintStyle: TextStyle(
                                            color: Color(0xFF9E9E9E))),
                                  ),
                                ],
                              ),
                            )),
                        Spacer(flex: 1),

                        /// Id
                        Expanded(
                            flex: 10,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Text(
                                    'Id Chi tiết',
                                    style: TextStyle(
                                        color: type == 1
                                            ? Colors.grey
                                            : Color(0xFF050505),
                                        fontSize: 13*fs),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  TextField(
                                    enabled: type != 1,
                                    onChanged: (data) {
                                      setState(() {
                                        _id = data;
                                        error = false;
                                        if (data != '') {
                                          if (type != 2) type = 2;
                                        } else {
                                          if (empty()) type = -1;
                                        }
                                      });
                                    },
                                    style: TextStyle(
                                      fontSize: 16*fs,
                                      color: Color(0xFF050505),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                        hintText: 'Nhập mã số',
                                        hintStyle: TextStyle(
                                            color: Color(0xFF9E9E9E))),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),

                  ///Serial
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 5*ws),
                                child: Text(
                                  'Serial',
                                  style: TextStyle(
                                      color: type == 2
                                          ? Colors.grey
                                          : Color(0xFF050505),
                                      fontSize: 13*fs),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            TextField(
                              enabled: type != 2,
                              onChanged: (data) {
                                setState(() {
                                  _serial = data;
                                  error = false;
                                  if (data != '') {
                                    if (type != 1) type = 1;
                                  } else {
                                    if (empty()) type = -1;
                                  }
                                });
                              },
                              style: TextStyle(
                                fontSize: 16*fs,
                                color: Color(0xFF050505),
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                  hintText: 'Nhập số serial number',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF9E9E9E))),
                            ),
                          ],
                        ),
                      )),

                  ///Click search
                    RaisedGradientButton(
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          result.clear();
                          if (!validate()) {
                            setState(() {
                              error = true;
                            });
                          } else {
                            showLoaderDialog(context);
                            if (_serial == '') {
                              itemSearchModel = await repository.fetchSearchInput(
                                  token: widget.token,
                                  soThe: _soThe.trim(),
                                  assetCodeNumber: _id.trim());
                            } else {
                              itemSearchModel =
                                  await repository.fetchSearchInputSerial(
                                  token: widget.token, serial: _serial.trim());
                            }
                            if (itemSearchModel.errorCode != SUCCESS) {

                              if (itemSearchModel.errorCode == TIME_OUT) {
                                getInventoryData.clear();
                                getInventoryFixedData.clear();
                                getInventoryConfigData.clear();
                                searchData.clear();
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
                              result.update(itemSearchModel);
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Text(
                          'Tra cứu',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14*fs,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                  Visibility(
                    visible: error,
                    child: Text(
                      '*Vui lòng nhập lại thông tin',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),

          Card(
            margin: EdgeInsets.only(bottom: 20*ws, right: 20*ws, left: 20*ws),
            shadowColor: Colors.white70,
            elevation: 10.0*ws,
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

        ],
      ),
    );
  }

  bool validate() {
    if ((_soThe != '' && _id != '' && _serial == '') ||
        (_soThe == '' && _id == '' && _serial != '')) return true;
    return false;
  }

  bool empty() {
    if (_id != '' || _soThe != '' || _serial != '') return false;
    return true;
  }
}

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

