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
                Text('Live'.toUpperCase(), style: tabSelectedStyle,),
                Text('Fixture'.toUpperCase(), style: tabUnselectedStyle,),
                Text('Result'.toUpperCase(), style: tabUnselectedStyle,),
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

          Expanded(
            child: ListView.builder(
              itemCount: 2,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
              return Container(
                child: Column(
                  children: [
                    SizedBox(height: 14.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('2nd Test, ', style: cardHeaderStyle,),
                        Text('Freedom Series, ', style: cardHeaderStyle,),
                        Text('Wed 14 Mar, ', style: cardHeaderStyle,),
                        Text('7:30 BDT', style: cardHeaderStyle,),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('New Zeland', style: teamScoreStyle,),
                              Text('20/5 *', style: teamScoreStyle,),
                            ],
                          ),
                          Container(
                            height: 80.h, width: 34.w,
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Image.asset('assets/temp_images/country_flag.png'),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 12.h),
                            child: Column(
                              children: [
                                Text('vs'.toUpperCase(), style: teamVsStyle,),
                                SizedBox(height: 8.h,),
                                Text('live'.toUpperCase(), style: matchStateStyle,),
                              ],
                            ),
                          ),
                          Container(
                            height: 80.h, width: 34.w,
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Image.asset('assets/temp_images/country_flag.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Bangladesh', style: teamScoreStyle,),
                              Text('20/5 *', style: teamScoreStyle,),
                            ],
                          ),
                          Icon(Icons.notifications_none, color: CardGreyColor, size: 18.sp,)
                        ],
                      ),
                    ),
                    Text('Srilanka needs 100 runs to win', style: cardHeaderStyle, maxLines: 1,),
                    SizedBox(height: 12.h,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      height: 0.7.h,
                      color: CardGreyColor,
                    )
                  ],
                ),
              );
            }),
          )

        ],
      ),

    );
  }
}
