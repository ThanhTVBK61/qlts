import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlts/constant/constant.dart';
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
    ///Search Input Data
    var searchInput = Provider.of<SearchInputDataModel>(context);
    ///Search QrCode
    var searchData = Provider.of<SearchDataModel>(context);
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
                  shape: Border(bottom: BorderSide(color: Colors.white)),
                  title: Container(
                      padding: EdgeInsets.only(top: 10*ws),
                      child: Text(
                        TITLE_SEARCH,
                        style:
                            TextStyle(color: Color(0xFFF2F2F9), fontSize: 20*fs),
                      )),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 110*ws,
                  elevation: 0.0,
                  leading: Container(
                    margin: EdgeInsets.only(left: 20*ws),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        searchInput.clear();
                        searchData.clear();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // actions: [
                  //   Container(
                  //     margin:  EdgeInsets.only(right: 5*ws),
                  //     child: IconButton(
                  //       icon: Icon(Icons.dehaze_rounded),
                  //       onPressed: () {},
                  //     ),
                  //   )
                  // ],
                  bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 40*ws),
                    child: TabBar(
                        indicatorWeight: 3,
                        tabs: [
                      Container(
                          height: 40*ws,
                          child: Center(
                              child: Text(
                                TABBAR_TITLE_QRCODE,
                            style: TextStyle(fontSize: 16*fs),
                          ))),
                      Container(
                          height: 40*ws,
                          child: Center(
                              child: Text(
                                TABBAR_TITLE_INPUT,
                            style: TextStyle(fontSize: 16*fs),
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
