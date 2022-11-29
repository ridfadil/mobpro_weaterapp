import 'package:dio/dio.dart';
import 'package:weather_api/weather_response_model.dart';

class RepositoryApi{
  Future<WeatherResponseModel> getWeather({String path=''}) async {
    try {
      var response = await Dio().get('https://goweather.herokuapp.com/weather/$path');
      return WeatherResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      return WeatherResponseModel.fromJson(e.response);
    }
  }
}