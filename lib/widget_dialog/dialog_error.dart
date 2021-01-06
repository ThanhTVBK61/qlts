import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qlts/constant/asset.dart';
import 'package:qlts/constant/constant.dart';
import 'package:qlts/data_sources/data_sqflite/database_provider.dart';
import 'package:qlts/repository/repository_database.dart';
import 'package:qlts/widget_login/my_login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showErrorDialog({BuildContext context,String errorCode, String errorDesc}) {

  RepositoryDatabase repositoryDatabase = RepositoryDatabase(DatabaseProvider.getInstance);

  Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        height: 425,
        width: 335,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 265),
                child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.clear_rounded),
                    onPressed: () async {
                      if(errorCode == TIME_OUT){

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
                                builder: (context) => MyLoginPage(url: URL_LOGOUT)),
                                (Route<dynamic> route) => false);
                      }else{
                        Navigator.pop(context);
                      }
                    })),
            SvgPicture.asset(IMAGE_ERROR),
            Container(
                margin: const EdgeInsets.only(top: 30, bottom: 5),
                child: Text(
                  'Thông báo !',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Center(
                child: Text(errorCode == TIME_OUT ? 'Phiên làm việc hết hạn.\nVui lòng đăng nhập lại': (errorCode == ERROR_INPUT? 'Dữ liệu chưa chính xác!':
                  (errorDesc.contains('unknowError') ? 'Có lỗi xảy ra. Vui lòng thực hiện lại' :
                  (errorDesc.contains('serverError')? 'Lỗi kết nối Server. Vui lòng thực hiện lại':' $errorDesc'))),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ));
  showDialog(context: context, builder: (BuildContext context) => errorDialog);
}
