import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qlts/provider/home_inventory/inventory_config_data_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_fixed_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_image_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_detail_provider.dart';
import 'package:qlts/provider/home_search/search_data_provider.dart';
import 'package:qlts/provider/home_search/search_input_data_provider.dart';
import 'package:qlts/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440,2880),
      allowFontScaling: false,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SearchDataModel()),
          ChangeNotifierProvider(create: (_) => SearchInputDataModel()),
          ChangeNotifierProvider(create: (_) => InventoryData()),
          ChangeNotifierProvider(create: (_) => InventoryDetailData()),
          ChangeNotifierProvider(create: (_) => InventoryConfigData()),
          ChangeNotifierProvider(create: (_) => InventoryImageProvider()),
          ChangeNotifierProvider(create: (_) => InventoryFixedDataProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashPage(),
        ),
      ),
    );
  }
}
