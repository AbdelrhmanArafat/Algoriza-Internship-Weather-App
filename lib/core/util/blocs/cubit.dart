import 'package:algoriza_weather/core/util/blocs/states.dart';
import 'package:algoriza_weather/core/util/model/weather_model.dart';
import 'package:algoriza_weather/core/util/network/remote/dio_helper.dart';
import 'package:algoriza_weather/core/util/network/remote/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  void initDatabase() async {
    debugPrint('AppDatabaseInitialized');

    emit(AppDatabaseInitialized());
  }

  CurrentWeatherModel? currentWeatherModel;

  void getCurrentWeather() async {
    emit(GetCurrentWeatherLoading());

    Response currentWeatherResponse = await DioHelper.getData(
      url: forecast,
      query: {
        'key': 'bfbd2b19423f43a88ee131452220409',
        'q': 'cairo',
        'days': 10,
        'aqi': 'no',
        'alerts': 'no',
      },
    );

    emit(GetCurrentWeatherSuccess());

    currentWeatherModel = CurrentWeatherModel.fromJson(
      currentWeatherResponse.data,
    );

    debugPrint(currentWeatherModel!.location.name);
    debugPrint(currentWeatherModel!.location.country);
    debugPrint(currentWeatherModel!.current.condition);
  }
}
