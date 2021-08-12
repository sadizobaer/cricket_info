import 'package:cricket_info/app_pages/model/data_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DataState  {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {
  @override
  List<Object> get props => [];
}

//--------------------success state-----------------

class DataSuccess extends DataState {
  final DataModel dataModel;

  DataSuccess({required this.dataModel});

  @override
  List<Object> get props => [dataModel];
}

//--------------------failure state-----------------

class DataFailure extends DataState {
  final String errorMessage;
  const DataFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}