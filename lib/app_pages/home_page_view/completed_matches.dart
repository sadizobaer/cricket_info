import 'package:cricket_info/app_pages/bloc/data_bloc.dart';
import 'package:cricket_info/app_pages/bloc/data_event.dart';
import 'package:cricket_info/app_pages/bloc/data_state.dart';
import 'package:flutter/material.dart';
import 'package:cricket_info/utility/color_constants.dart';
import 'package:cricket_info/utility/text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CompletedMatches extends StatefulWidget {
  final String token;
  CompletedMatches({required this.token});

  @override
  _CompletedMatchesState createState() => _CompletedMatchesState();
}

class _CompletedMatchesState extends State<CompletedMatches> {

  DataBloc? dataBloc;

  @override
  void initState() {
    dataBloc = context.read<DataBloc>();
    dataBloc!.add(
      FetchDataEvent(accessToken: widget.token, format: 3, status: 2),
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

                    var tempDate = DateFormat.yMMMMEEEEd('en_US').format(DateTime.parse('${state.dataModel.response!.items![index].dateStart}'));
                    var tempDate1 = tempDate.split(',')[0].substring(0,3);
                    var tempDate2 = tempDate.split(',')[1].split(' ')[2];
                    var tempDate3 = tempDate.split(',')[1].split(' ')[1].substring(0,3);
                    String date = tempDate1.toString() + ' ' + tempDate2.toString() + ' ' + tempDate3.toString();

                    return Container(
                      child: Column(
                        children: [
                          SizedBox(height: 14.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${state.dataModel.response!.items![index].subtitle}, ', style: cardHeaderStyle,),
                              Text('${state.dataModel.response!.items![index].competition!.title}, ', style: cardHeaderStyle,),
                              Text('$date, ', style: cardHeaderStyle,),
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
                                          Text('${state.dataModel.response!.items![index].teama!.name}', style: teamScoreStyle,),
                                          Text('${state.dataModel.response!.items![index].teama!.scoresFull}', style: teamScoreStyle,),
                                        ],
                                      ),
                                      Container(
                                        height: 30.h, width: 36.w,
                                        padding: EdgeInsets.only(bottom: 8.h),
                                        child: Image.network('${state.dataModel.response!.items![index].teama!.logoUrl}',
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
                                          height: 30.h, width: 36.w,
                                          padding: EdgeInsets.only(bottom: 8.h),
                                          child: Image.network('${state.dataModel.response!.items![index].teamb!.logoUrl}',
                                            fit: BoxFit.fill,),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('${state.dataModel.response!.items![index].teamb!.name}', style: teamScoreStyle,),
                                            Text('${state.dataModel.response!.items![index].teama!.scoresFull}', style: teamScoreStyle,),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(right: 12.w),
                              child: Text('${state.dataModel.response!.items![index].statusStr}'.toUpperCase(), style: matchStateStyle,)),
                          SizedBox(height: 4.h,),
                          Text('${state.dataModel.response!.items![index].result}', style: cardHeaderStyle, maxLines: 1,),
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
