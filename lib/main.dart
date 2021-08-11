import 'package:cricket_info/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {

  //change status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
  ),);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 720),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
          initialRoute: '/homePage',

          routes: {
            '/homePage': (_) => HomePage(),
          }

      ),
    );
  }
}
