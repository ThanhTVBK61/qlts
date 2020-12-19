import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';
import 'package:qlts/data_sources/data_qrcode/permission.dart';
import 'package:qlts/provider/home_search/search_data_provider.dart';
import 'package:qlts/repository/repository.dart';
import 'package:qlts/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    var dataProvider = Provider.of<SearchDataModel>(context);
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
              height: 300,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      PermissionWidget(
                        permission: Permission.camera,
                        callback: (data, clear) async {
                          if (!clear) {
                            print("*****home_search_qrcode: data==>> $data");
                            itemSearchModel =
                                await repository.fetchSearchQRCode(
                                    token: widget.token,
                                    type: type,
                                    value: data);
                            dataProvider.update(this.itemSearchModel,
                                newData: data);
                            if (dataProvider.errorCode != '200') {
                              if (dataProvider.errorCode == '498.2') {
                                print('****Camera  Timeout**set token ='
                                    '******');
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('token', '');
                              }
                              _errorDialog(
                                  errCode: dataProvider.errorCode,
                                  err: dataProvider.errorDesc);
                            }
                          } else {
                            dataProvider.clear();
                          }
                        },
                      ),
                      Container(
                          margin:
                              const EdgeInsets.only(top: 5, left: 15, right: 5),
                          child: Text(dataProvider.data ?? ''))
                    ],
                  ))),
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
                                  title: informationDetail(
                                      dataProvider.list[index]),
                                ),
                            childCount: dataProvider.list.length),
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
}

///Sử dụng cho cả tìm kiếm bằng nhập thông tin
Container informationDetail(Result result) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              result.tenThuocTinh,
              style: TextStyle(color: Color(0xFF050505), fontSize: 13),
              overflow: TextOverflow.ellipsis,
            )),
        Text(result.giaTri ?? '',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF050505),
              fontWeight: FontWeight.bold,
            )),
        Divider(
          thickness: 0.5,
          color: Colors.black,
        )
      ],
    ),
  );
}
