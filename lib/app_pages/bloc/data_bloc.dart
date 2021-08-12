import 'dart:async';
import 'package:cricket_info/app_pages/bloc/data_event.dart';
import 'package:cricket_info/app_pages/bloc/data_state.dart';
import 'package:cricket_info/app_pages/model/data_model.dart';
import 'package:cricket_info/app_pages/network/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class DataBloc extends Bloc<DataEvent, DataState> with ChangeNotifier {

  //--------------local variables---------------

  ApiManager repository;

  DataBloc({required this.repository}) : super(DataInitial());

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {

    final currentState = state;

    //----------------event is called------------------

    if (event is FetchDataEvent) {


      if (currentState is DataInitial) {
        yield DataLoading();
        repository = ApiManager();

        //----------api called------------

        final response = await repository.getMatchesData(status: event.status, format: event.format, accessToken: event.accessToken);

        if(response.statusCode == 200){
          DataModel dataModel = DataModel.fromJson(response.data);

          yield DataSuccess(dataModel: dataModel);

        }

        else {

          yield DataFailure(errorMessage: 'Failed to fetch data');

        }


      }


    }

  }

}

