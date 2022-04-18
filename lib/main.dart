import 'package:acs_staff/history/order_detail.dart';
import 'package:acs_staff/schedule/schedule_today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '@share/router/pages.dart';
import '@share/router/router.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (_, child) => FlutterEasyLoading(child: child),
      initialRoute: ROUTER_LOGIN,
      getPages: Routers.route,
      debugShowCheckedModeBanner: false,
    );
  }
}
