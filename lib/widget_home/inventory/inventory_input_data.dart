import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';
import 'package:qlts/provider/home_search/search_input_data_provider.dart';
import 'package:qlts/widget_home/search/search_qrcode.dart';
import 'package:qlts/repository/repository.dart';
import 'package:qlts/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InventoryInputData extends StatefulWidget {
  final token;

  InventoryInputData({this.token});

  @override
  State<StatefulWidget> createState() => InventoryInputDataState();
}

class InventoryInputDataState extends State<InventoryInputData> {
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
    return Column(
      children: [
        ///get du lieu tu camera
        Card(
          margin: const EdgeInsets.all(20),
          shadowColor: Colors.white70,
          elevation: 10.0,
          color: Colors.white.withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            height: 270,
            child: Container(
              padding: const EdgeInsets.only(
                  bottom: 10, top: 20, right: 20, left: 20),
              child: Column(
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
                                            fontSize: 13),
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
                                      fontSize: 16,
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
                                            fontSize: 13),
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
                                      fontSize: 16,
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
                                margin: const EdgeInsets.only(top: 5),
                                child: Text(
                                  'Serial',
                                  style: TextStyle(
                                      color: type == 2
                                          ? Colors.grey
                                          : Color(0xFF050505),
                                      fontSize: 13),
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
                                fontSize: 16,
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
                  GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (!validate()) {
                        setState(() {
                          error = true;
                        });
                      } else {
                        if (_serial == '') {
                          itemSearchModel = await repository.fetchSearchInput(
                              token: widget.token,
                              soThe: _soThe,
                              assetCodeNumber: _id);
                        } else {
                          itemSearchModel =
                          await repository.fetchSearchInputSerial(
                              token: widget.token, serial: _serial);
                        }
                        result.update(itemSearchModel);
                        if (result.errorCode != '200') {
                          if (result.errorCode == '498.2') {
                            print('****Camera  Timeout**set token =' '******');
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            prefs.setString('token', '');
                          }
                          _errorDialog(
                              errCode: result.errorCode, err: result.errorDesc);
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 5),
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gradient: LinearGradient(
                              colors: [Color(0xFF00A3FF), Color(0xFF0033E7)],
                              begin: Alignment.topLeft,
                              end: Alignment(0.0, 0.0))),
                      child: Center(
                        child: Text(
                          'Tra cứu',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    error ? '*Vui lòng nhập lại thông tin' : '',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ),
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10, left: 20),
                      child: Text(
                        'Thông tin tài sản',
                        style: TextStyle(
                            color: Color(0xFF050505),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                                (context, index) => ListTile(
                              title: informationDetail(result.list[index]),
                            ),
                            childCount: result.list.length),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _errorDialog({String errCode, String err}) {
    Dialog errorDialog = Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)), //this right here
        child: Container(
            height: 300.0,
            width: 200.0,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10, right: 15, left: 15, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thông báo',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(errCode == '498.2'
                          ? 'Phiên làm việc của bạn đã hết hạn.\nVui lòng ăng nhập lại'
                          : err)),
                  RaisedButton(
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                      if (errCode == '498.2') {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashPage()),
                                (Route<dynamic> route) => false);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Text('OK')),
                  )
                ],
              ),
            )));
    showDialog(
        context: context, builder: (BuildContext context) => errorDialog);
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
