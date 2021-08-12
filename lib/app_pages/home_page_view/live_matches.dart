import 'package:cricket_info/app_pages/bloc/data_bloc.dart';
import 'package:cricket_info/app_pages/bloc/data_event.dart';
import 'package:cricket_info/app_pages/bloc/data_state.dart';
import 'package:flutter/material.dart';
import 'package:cricket_info/utility/color_constants.dart';
import 'package:cricket_info/utility/text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveMatches extends StatefulWidget {
  final String token;
  LiveMatches({required this.token});

  @override
  _LiveMatchesState createState() => _LiveMatchesState();
}

class _LiveMatchesState extends State<LiveMatches> {

  DataBloc? dataBloc;
  
  @override
  void initState() {
    dataBloc = context.read<DataBloc>();
    dataBloc!.add(
      FetchDataEvent(accessToken: widget.token, format: 6, status: 3),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                child: CircularProgressIndicator(color: AppbarRightColor, strokeWidth: 2,),
              ),
            );
          } else if (state is DataFailure) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(child: Text('${state.errorMessage}')),
            );
          } else if (state is DataSuccess) {

            return Expanded(
              child: state.dataModel.response!.items!.length == 0 ?
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(child: Text('No data for Live sessions'),),
              ) :
              ListView.builder(
                  itemCount: state.dataModel.response!.items!.length,
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
                          SizedBox(height: 8.h,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Flexible(
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
                                        height: 26.h, width: 30.w,
                                        padding: EdgeInsets.only(bottom: 8.h),
                                        child: Image.asset('assets/temp_images/country_flag.png',
                                          fit: BoxFit.fill,),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text('vs'.toUpperCase(), style: teamVsStyle,),
                                ),

                                Flexible (
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 26.h, width: 30.w,
                                          padding: EdgeInsets.only(bottom: 8.h),
                                          child: Image.asset('assets/temp_images/country_flag.png',
                                            fit: BoxFit.fill,),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('Bangladesh', style: teamScoreStyle,),
                                            Text('20/5 *', style: teamScoreStyle,),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                                Icon(Icons.notifications_none, color: CardGreyColor, size: 18.sp,)
                              ],
                            ),
                          ),
                          Text('Completed'.toUpperCase(), style: matchStateStyle,),
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
            );
          }
          return Container();
        });
  }
}
