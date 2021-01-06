import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qlts/constant/asset.dart';
import 'package:qlts/constant/constant.dart';
import 'package:qlts/data_sources/callAPI.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_fixed_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_result_API_model.dart';
import 'package:qlts/data_sources/data_sqflite/database_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_config_data_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_fixed_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_provider.dart';
import 'package:qlts/repository/repository.dart';
import 'package:qlts/repository/repository_database.dart';
import 'package:qlts/widget_dialog/dialog_error.dart';
import 'package:qlts/widget_dialog/dialog_loader.dart';
import 'package:qlts/widget_home/button_widget.dart';
import 'package:qlts/widget_home/inventory/inventory_type.dart';
import 'package:qlts/widget_home/search/home_search.dart';
import 'package:qlts/notification/my_notification_page.dart';
import 'package:qlts/widget_background.dart';
import 'package:qlts/widget_login/my_login_page.dart';
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
  Repository repository = Repository();
  RepositoryDatabase repositoryDatabase = RepositoryDatabase(DatabaseProvider.getInstance);
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

  static TextStyle optionStyle =
      TextStyle(fontSize: 30 * fs, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var getInventoryData = Provider.of<InventoryData>(context);
    var getInventoryConfigData = Provider.of<InventoryConfigData>(context);
    var getInventoryFixedData = Provider.of<InventoryFixedDataProvider>(context);
    return Scaffold(
      body: <Widget>[
        MyHomeContent(token),
        MyNotification(),
        Center(
          child: RaisedGradientButton(
            child: Text('Đăng xuất',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14 * fs)),
            onPressed: (){
              showDialog(context: context,
              builder: (_) => CupertinoAlertDialog(
                title: Text('Thông báo', style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14 * fs)),
                content: Text('Bạn có chắc chắn muốn đăng xuất?', style: TextStyle(
                    color: Colors.black,
                    fontSize: 14 * fs)),
                actions: [
                  FlatButton(
                    child: Text('Đóng',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14 * fs)),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('Đăng xuất',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 14 * fs)),
                    onPressed: () async {
                      showLoaderDialog(context);
                      InventoryResultAPIModel inventoryResultAPIModel = await repository.fetchLogout(token: token);
                      if(inventoryResultAPIModel.errorCode != SUCCESS){
                        if (inventoryResultAPIModel.errorCode == TIME_OUT) {
                          getInventoryData.clear();
                          getInventoryFixedData.clear();
                          getInventoryConfigData.clear();
                        }
                        Navigator.pop(context);
                        showErrorDialog(
                            context: this.context,
                            errorCode: inventoryResultAPIModel.errorCode,
                            errorDesc: inventoryResultAPIModel.errorDesc);
                      }else{
                        getInventoryData.clear();
                        getInventoryFixedData.clear();
                        getInventoryConfigData.clear();

                        ///Clear token
                        print('****Token Timeout**set token ='
                            '******');
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        prefs.setString('token', '');

                        ///Clear sqflite
                        repositoryDatabase.databaseRepositoryStatus.clear();
                        repositoryDatabase.databaseRepositoryVariant.clear();
                        repositoryDatabase.databaseRepositoryOffline.clear();

                        Navigator.pop(context);

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyLoginPage(url: URL_LOGOUT,)),
                                (Route<dynamic> route) => false);
                      }
                    },
                  )
                ],
              ));
            },
          ),
        ),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: 'Trang chủ',
              icon: Column(children: [
                SvgPicture.asset(IMAGE_HOME),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Opacity(
                        opacity: 0.0, child: SvgPicture.asset(IMAGE_DOT))),
              ]),
              activeIcon: Column(children: [
                SvgPicture.asset(IMAGE_HOME_SELECTED),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: SvgPicture.asset(IMAGE_DOT)),
              ])),
          BottomNavigationBarItem(
              label: 'Thông báo',
              icon: Column(children: [
                SvgPicture.asset(IMAGE_BELL),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Opacity(
                        opacity: 0.0, child: SvgPicture.asset(IMAGE_DOT))),
              ]),
              activeIcon: Column(children: [
                SvgPicture.asset(IMAGE_BELL_SELECTED),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: SvgPicture.asset(IMAGE_DOT)),
              ])),
          BottomNavigationBarItem(
              label: 'Tài khoản',
              icon: Column(children: [
                SvgPicture.asset(IMAGE_ACCOUNT),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Opacity(
                        opacity: 0.0, child: SvgPicture.asset(IMAGE_DOT))),
              ]),
              activeIcon: Column(children: [
                SvgPicture.asset(IMAGE_ACCOUNT_SELECTED),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: SvgPicture.asset(IMAGE_DOT)),
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
    RepositoryDatabase repositoryDatabase =
        RepositoryDatabase(DatabaseProvider.getInstance);

    var getInventoryData = Provider.of<InventoryData>(context);
    var getInventoryConfigData = Provider.of<InventoryConfigData>(context);
    var getInventoryFixedData =
        Provider.of<InventoryFixedDataProvider>(context);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
        ),
        backgroundImage(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Container(
                padding: EdgeInsets.only(top: 10 * ws),
                child: Text(
                  'Kiểm kê tài sản',
                  style: TextStyle(color: Color(0xFFF2F2F9), fontSize: 20 * fs),
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
            // actions: [
            //   Container(
            //     margin: const EdgeInsets.only(right: 5),
            //     child: IconButton(
            //       icon: Icon(Icons.dehaze_rounded),
            //       onPressed: () {},
            //     ),
            //   )
            // ]
          ),
          body: Container(
            margin: EdgeInsets.only(top: 20 * ws),
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
                    margin: EdgeInsets.only(
                        left: 20 * ws, right: 20 * ws, bottom: 70.w),
                    shadowColor: Colors.grey[50],
                    elevation: 10.0 * ws,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: 23 * ws,
                                right: 31 * ws,
                                top: 20 * ws,
                                bottom: 21 * ws),
                            child: SvgPicture.asset(IMAGE_TITLE_SEARCH)),
                        Text('Tra cứu tài sản',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20 * fs,
                                color: Color(0xFF454545)))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    showLoaderDialog(context);
                    if (getInventoryData.list.length == 0) {
                      ///gọi API danh sách kiểm kê tài sản
                      InventoryModel inventoryModel =
                          await repository.fetchGetInventory(token: token);
                      if (inventoryModel.errorCode != SUCCESS) {
                        if (inventoryModel.errorCode != SUCCESS) {
                          if (inventoryModel.errorCode == TIME_OUT) {
                            getInventoryData.clear();
                            getInventoryConfigData.clear();
                            getInventoryFixedData.clear();
                          }
                          Navigator.pop(context);

                          ///Show error code
                          showErrorDialog(
                              context: context,
                              errorCode: inventoryModel.errorCode,
                              errorDesc: inventoryModel.errorDesc);
                        }
                      } else {
                        print('--------update inventory data');

                        /// >=1 đợt kiểm kê => gọi danh sách chốt sổ
                        if (inventoryModel.listInventoryRound.length > 0) {
                          getInventoryData.update(inventoryModel);
                          getInventoryData.updateIndex(0);

                          ///Gọi API danh sách chốt sổ
                          InventoryFixedModel inventoryFixedModel =
                              await repository.fetchGetInventoryFixed(
                                  token: token,
                                  inventoryId:
                                      getInventoryData.list[0].id.toString());

                          if (inventoryFixedModel.errorCode != SUCCESS) {
                            if (inventoryFixedModel.errorCode != SUCCESS) {
                              if (inventoryFixedModel.errorCode == TIME_OUT) {
                                getInventoryData.clear();
                                getInventoryConfigData.clear();
                                getInventoryFixedData.clear();
                              }
                              Navigator.pop(context);

                              ///Show error code
                              showErrorDialog(
                                  context: context,
                                  errorCode: inventoryFixedModel.errorCode,
                                  errorDesc: inventoryModel.errorDesc);
                            }
                          } else {
                            ///list có phần tử mới update
                            if (inventoryFixedModel.listInventoryFixed.length >
                                0) {
                              getInventoryFixedData.update(inventoryFixedModel);
                              getInventoryFixedData.updateId(0);
                            }

                            if (getInventoryConfigData
                                    .listDataStatusConfig.length ==
                                0) {
                              ///lay du lieu tu sqflite
                              List<DataStatusConfig> listStatus =
                                  await repositoryDatabase
                                      .databaseRepositoryStatus
                                      .getData();
                              if (listStatus.length == 0) {
                                print('status == 0 call API');

                                ///neu SQFLite chua co du lieu => goi API, luu du lieu vao sqflite
                                InventoryDataConfigModel
                                    inventoryDataConfigModel = await repository
                                        .fetchGetDataConfigInventory(
                                            token: token);
                                if (inventoryDataConfigModel.errorCode !=
                                    SUCCESS) {
                                  ///Lỗi => hiển thị dialog thông báo lỗi
                                  if (inventoryDataConfigModel.errorCode !=
                                      SUCCESS) {
                                    if (inventoryDataConfigModel.errorCode ==
                                        TIME_OUT) {
                                      print('-----------clear----');
                                      getInventoryData.clear();
                                      getInventoryConfigData.clear();
                                      getInventoryFixedData.clear();
                                    }
                                    Navigator.pop(context);

                                    ///Show error code
                                    showErrorDialog(
                                        context: context,
                                        errorCode:
                                            inventoryDataConfigModel.errorCode,
                                        errorDesc:
                                        inventoryModel.errorDesc);
                                  }
                                } else {
                                  if (inventoryDataConfigModel
                                          .listDataStatusConfig.length >
                                      0) {
                                    getInventoryConfigData
                                        .update(inventoryDataConfigModel);
                                    getInventoryConfigData.updateIndexStatus(0);

                                    ///luu vao sqflite
                                    inventoryDataConfigModel
                                        .listDataStatusConfig
                                        .forEach((dataStatusConfig) {
                                      repositoryDatabase
                                          .databaseRepositoryStatus
                                          .insert(dataStatusConfig);
                                    });

                                    inventoryDataConfigModel
                                        .listDataVariantConfig
                                        .forEach((dataVariantConfig) {
                                      repositoryDatabase
                                          .databaseRepositoryVariant
                                          .insert(dataVariantConfig);
                                    });
                                  }

                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeInventory(token: token)));
                                }
                              } else {
                                print('status != 0 can not call API');

                                ///sqflite da co du lieu => update provider
                                List<DataVariantConfig> listVariant =
                                    await repositoryDatabase
                                        .databaseRepositoryVariant
                                        .getData();
                                print(
                                    '*****listStatus.length = ${listStatus.length}*****');
                                print(
                                    '*****listVariant.length = ${listVariant.length}*****');
                                getInventoryConfigData.updateStatus(listStatus);
                                getInventoryConfigData
                                    .updateVariant(listVariant);
                                getInventoryConfigData.updateIndexStatus(0);

                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeInventory(token: token)));
                              }
                            } else {
                              print(
                                  '**provider***getInventoryConfigData.listDataStatusConfig.length = ${getInventoryConfigData.listDataStatusConfig.length}*****');
                              print(
                                  '**provider***getInventoryConfigData.listDataVariantConfig.length = ${getInventoryConfigData.listDataVariantConfig.length}*****');
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeInventory(token: token)));
                            }
                          }
                        } else {
                          if (getInventoryConfigData
                                  .listDataStatusConfig.length ==
                              0) {
                            ///lay du lieu tu sqflite
                            List<DataStatusConfig> listStatus =
                                await repositoryDatabase
                                    .databaseRepositoryStatus
                                    .getData();
                            if (listStatus.length == 0) {
                              print('status == 0 call API');

                              ///neu SQFLite chua co du lieu => goi API, luu du lieu vao sqflite
                              InventoryDataConfigModel
                                  inventoryDataConfigModel =
                                  await repository.fetchGetDataConfigInventory(
                                      token: token);
                              if (inventoryDataConfigModel.errorCode !=
                                  SUCCESS) {
                                ///Lỗi => hiển thị dialog thông báo lỗi
                                if (inventoryDataConfigModel.errorCode !=
                                    SUCCESS) {
                                  if (inventoryDataConfigModel.errorCode ==
                                      TIME_OUT) {
                                    print('-----------clear----');
                                  }
                                  Navigator.pop(context);

                                  ///Show error code
                                  showErrorDialog(
                                      context: context,
                                      errorCode:
                                          inventoryDataConfigModel.errorCode,
                                      errorDesc:
                                      inventoryModel.errorDesc);
                                }
                              } else {
                                getInventoryConfigData
                                    .update(inventoryDataConfigModel);
                                getInventoryConfigData.updateIndexStatus(0);

                                ///luu vao sqflite
                                inventoryDataConfigModel.listDataStatusConfig
                                    .forEach((dataStatusConfig) {
                                  repositoryDatabase.databaseRepositoryStatus
                                      .insert(dataStatusConfig);
                                });

                                inventoryDataConfigModel.listDataVariantConfig
                                    .forEach((dataVariantConfig) {
                                  repositoryDatabase.databaseRepositoryVariant
                                      .insert(dataVariantConfig);
                                });
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeInventory(token: token)));
                              }
                            } else {
                              print('status != 0 can not call API');

                              ///sqflite da co du lieu => update provider
                              List<DataVariantConfig> listVariant =
                                  await repositoryDatabase
                                      .databaseRepositoryVariant
                                      .getData();
                              print(
                                  '*****listStatus.length = ${listStatus.length}*****');
                              print(
                                  '*****listVariant.length = ${listVariant.length}*****');
                              getInventoryConfigData.updateStatus(listStatus);
                              getInventoryConfigData.updateVariant(listVariant);
                              getInventoryConfigData.updateIndexStatus(0);

                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeInventory(token: token)));
                            }
                          } else {
                            print(
                                '452***provider**getInventoryConfigData.listDataStatusConfig.length = ${getInventoryConfigData.listDataStatusConfig.length}*****');
                            print(
                                '***provider**getInventoryConfigData.listDataVariantConfig.length = ${getInventoryConfigData.listDataVariantConfig.length}*****');
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeInventory(token: token)));
                          }
                        }
                      }
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.only(
                        left: 20 * ws, right: 20 * ws, bottom: 15 * ws),
                    shadowColor: Colors.grey[50],
                    elevation: 10.0 * ws,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: 25 * ws,
                                right: 34 * ws,
                                top: 21 * ws,
                                bottom: 22 * ws),
                            child:
                                SvgPicture.asset(IMAGE_TITLE_INSERT_INVENTORY)),
                        Text('Kiểm kê tài sản',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20 * fs,
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
}
