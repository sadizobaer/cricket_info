import 'package:dio/dio.dart';


class ApiManager{
  Dio dio = Dio();

  //------------------api function---------------------

  Future getMatchesData({required int status, required int format, required String accessToken}) async {

    final response = await dio.post(
      "https://rest.entitysport.com/v2/matches/?status=$status&format=$format&token=$accessToken",
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Vary': 'Accept',
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    return response;
  }
}