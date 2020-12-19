import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlts/data_sources/callAPI.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_model.dart';
import 'package:qlts/provider/home_inventory/inventory_provider.dart';
import 'package:qlts/repository/repository.dart';
import 'package:qlts/splash_page.dart';
import 'package:qlts/widget_home/inventory/inventory_type.dart';
import 'package:qlts/widget_home/search/home_search.dart';
import 'package:qlts/notification/my_notification_page.dart';
import 'package:qlts/widget_background.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  final data;
  final token;

  MyHomePage({this.data, this.token});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String token;

  @override
  void initState() {
    super.initState();

    saveToken();
  }

  void saveToken() async {
    if (widget.data != null) {
      String token1 = widget.data.substring(
          widget.data.lastIndexOf('"token": "') + 10, widget.data.length - 2);
      String email = widget.data.substring(
          widget.data.lastIndexOf('"email": "') + 10,
          widget.data.lastIndexOf('"token": "') - 3);
      Map<String, String> body = {
        "token": token1,
        "email": email,
        'tokenfirebase': 'abcdef'
      };

      ///Call API
      APIResult apiRes =
          await ServicesRepository().post(action: 'qlts_login', body: body);
      if (apiRes is APISuccess) {
        var list = apiRes.data.values.toList();
        setState(() {
          token = list[2];
        });
        print('******MyHomePage**data!=null******\n$token\n******************');

        ///Save SharePrefernce
        SharedPreferences prefs = await _prefs;
        prefs.setString('token', token);
      } else if (apiRes is APIError) {
        print(apiRes.statusCode);
      } else {
        print("I don't know");
      }
    } else {
      setState(() {
        token = widget.token;
      });
      print('******MyHomePage**data==null******\n$token\n******************');
    }
  }

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        MyHomeContent(token),
        MyNotification(),
        Center(
          child: Text(
            'Tài khoản',
            style: optionStyle,
          ),
        ),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: 'Trang chủ',
              icon: Column(children: [
                Image.asset('assets/images/home.png'),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Opacity(
                        opacity: 0.0,
                        child: Image.asset('assets/images/dot.png'))),
              ]),
              activeIcon: Column(children: [
                Image.asset('assets/images/home_selected.png'),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Image.asset('assets/images/dot.png')),
              ])),
          BottomNavigationBarItem(
              label: 'Thông báo',
              icon: Column(children: [
                Image.asset('assets/images/bell.png'),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Opacity(
                        opacity: 0.0,
                        child: Image.asset('assets/images/dot.png'))),
              ]),
              activeIcon: Column(children: [
                Image.asset('assets/images/bell_selected.png'),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Image.asset('assets/images/dot.png')),
              ])),
          BottomNavigationBarItem(
              label: 'Tài khoản',
              icon: Column(children: [
                Image.asset('assets/images/account.png'),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Opacity(
                        opacity: 0.0,
                        child: Image.asset('assets/images/dot.png'))),
              ]),
              activeIcon: Column(children: [
                Image.asset('assets/images/account_selected.png'),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Image.asset('assets/images/dot.png')),
              ]))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF1265B6),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: _onItemTapped,
      ),
    );
  }
}

//MyHomeContent: Giao diện trang chủ
class MyHomeContent extends StatelessWidget {
  final token;

  MyHomeContent(this.token);

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    var getInventoryData = Provider.of<InventoryData>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          // decoration: BoxDecoration(color: Colors.white),
        ),
        backgroundImage(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Kiểm kê tài sản',
                    style: TextStyle(color: Color(0xFFF2F2F9), fontSize: 20),
                  )),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              // leading: Container(
              //   margin: const EdgeInsets.only(left: 20),
              //   child: IconButton(
              //     icon: Icon(Icons.arrow_back),
              //     onPressed: () {
              //       // Navigator.pop(context);
              //     },
              //   ),
              // ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    icon: Icon(Icons.dehaze_rounded),
                    onPressed: () {},
                  ),
                )
              ]),
          body: Container(
            margin: const EdgeInsets.only(top: 25),
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeSearch(token: token)));
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    shadowColor: Colors.grey[50],
                    elevation: 10.0,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 23, right: 31, top: 20, bottom: 21),
                            child: Image.asset(
                                'assets/images/search_inventory/title_search.png',
                                // width: 56,
                                // height: 59
                            )
                        ),
                        Text('Tra cứu tài sản',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF454545)))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    InventoryModel inventoryModel = await repository.fetchGetInventory(token: token);
                    getInventoryData.update(inventoryModel);
                    if(getInventoryData.errorCode != '200'){
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
                                        child: Text(getInventoryData.errorCode == '498.2'
                                            ? 'Phiên làm việc của bạn đã hết hạn.\nVui lòng ăng nhập lại'
                                            : getInventoryData.errorDesc)),
                                    RaisedButton(
                                      textColor: Colors.white,
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        if (getInventoryData.errorCode == '498.2') {
                                          print('go to SplashPage');
                                          print('******set token =' '******');
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.setString('token', '');
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => SplashPage()),
                                                  (Route<dynamic> route) => false);
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
                    }else{
                      getInventoryData.updateId(0);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeInventory(token: token)));
                    }

                  },
                  child: Card(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    shadowColor: Colors.grey[50],
                    elevation: 10.0,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 25, right: 34, top: 21, bottom: 22),
                            child: Image.asset(
                                'assets/images/insert_inventory/title_insert_inventory.png',
                                // width: 53,
                                // height: 57
                            )),
                        Text('Kiểm kê tài sản',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF454545)))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
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
  //                               (Route<dynamic> route) => false);
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
