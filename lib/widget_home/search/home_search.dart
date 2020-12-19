import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlts/provider/home_search/search_data_provider.dart';
import 'package:qlts/provider/home_search/search_input_data_provider.dart';
import 'package:qlts/widget_home/search/search_input_data.dart';
import 'search_qrcode.dart';
import 'package:qlts/widget_background.dart';

class HomeSearch extends StatefulWidget {
  final token;

  HomeSearch({this.token});

  @override
  State<StatefulWidget> createState() => HomeSearchState();
}

class HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    var qrcodeData = Provider.of<SearchDataModel>(context);
    var inputData = Provider.of<SearchInputDataModel>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
        ),
        backgroundImage(context),
        DefaultTabController(
          length: 2,
          child: Scaffold(
              resizeToAvoidBottomPadding: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                  title: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Tra cứu tài sản',
                        style:
                            TextStyle(color: Color(0xFFF2F2F9), fontSize: 20),
                      )),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 110,
                  elevation: 0.0,
                  leading: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        qrcodeData.clear();
                        inputData.clear();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        icon: Icon(Icons.dehaze_rounded),
                        onPressed: () {},
                      ),
                    )
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 40),
                    child: TabBar(tabs: [
                      Container(
                          height: 40,
                          child: Center(
                              child: Text(
                            'QR Code',
                            style: TextStyle(fontSize: 16),
                          ))),
                      Container(
                          height: 40,
                          child: Center(
                              child: Text(
                            'Nhập thông tin',
                            style: TextStyle(fontSize: 16),
                          ))),
                    ], indicatorColor: Colors.white),
                  )),
              body: TabBarView(
                children: [
                  SearchQRCode(token: widget.token),
                  SearchInputData(token: widget.token),
                ],
              )),
        )
      ],
    );
  }
}
