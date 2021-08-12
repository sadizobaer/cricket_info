import 'package:cricket_info/app_pages/home_page_view/completed_matches.dart';
import 'package:cricket_info/app_pages/home_page_view/fixture_matches.dart';
import 'package:cricket_info/app_pages/home_page_view/live_matches.dart';
import 'package:cricket_info/utility/color_constants.dart';
import 'package:cricket_info/utility/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String accessToken = '437214169d9be2a73e91d22f76f68b52';
  String selected = 'Live';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: Container(
          padding: EdgeInsets.only(top: 30.h),
          child: Container(
            height: 40.h, width: 100.w,
            child: Image.asset('assets/icons/logo.png'),
          ),
        ),
        
      ),
      backgroundColor: BackgroundColor,
      body: Column(
        children: [
          Container(
            height: 34.h, width: 360.w,
            margin: EdgeInsets.only(top: 4.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppbarLeftColor,
                  AppbarRightColor,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){_onTabChanged('Live');},
                    child: Text('Live'.toUpperCase(),
                      style: (selected == 'Live') ? tabSelectedStyle : tabUnselectedStyle,),),
                InkWell(
                  onTap: (){_onTabChanged('Fixture');},
                    child: Text('Fixture'.toUpperCase(),
                        style: (selected == 'Fixture') ? tabSelectedStyle : tabUnselectedStyle,),),
                InkWell(
                  onTap: (){_onTabChanged('Result');},
                    child: Text('Result'.toUpperCase(),
                        style: (selected== 'Result') ? tabSelectedStyle : tabUnselectedStyle,),),
              ],
            ),
          ),
          Container(
            height: 28.h, width: 360.w,
            decoration: BoxDecoration(
              color: HeaderColor,
            ),
            child: Center(child: Text('international'.toUpperCase(), style: headerStyle,)),
          ),

          //list of matches
          _redirectToView(selected),

        ],
      ),
    );
  }

  _onTabChanged(String value){
    setState(() {
      selected = value;
      print(selected);
    });
  }

  _redirectToView(String value){

    if(value == 'Live'){return LiveMatches(token: accessToken,);}

    if(value == 'Fixture'){return FixtureMatches(token: accessToken,);}

    if(value == 'Result'){return CompletedMatches(token: accessToken,);}

  }

}
