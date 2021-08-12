
import 'package:flutter/cupertino.dart';

@immutable
abstract class DataEvent  {
  DataEvent();

  @override
  List<Object> get props => [];
}

//---------------Data event----------------

class FetchDataEvent extends DataEvent {

  final int status, format;
  final String accessToken;

  FetchDataEvent({required this.accessToken, required this.format, required this.status});

  @override
  List<Object> get props => [accessToken, format, status];

}