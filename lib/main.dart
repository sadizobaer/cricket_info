import 'package:cricket_info/app_pages/bloc/data_bloc.dart';
import 'package:cricket_info/app_pages/home_page_view/home_page.dart';
import 'package:cricket_info/app_pages/network/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


void main() {

  //change status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
  ),);

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DataBloc(
              repository: ApiManager(),
            ),
          )
        ],
        child: MyApp(),
      ),
  );
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
