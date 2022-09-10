import 'dart:io';
import 'package:algoriza_weather/core/util/blocs/cubit.dart';
import 'package:algoriza_weather/core/util/network/remote/dio_helper.dart';
import 'package:algoriza_weather/features/home_screen/presentation/page/home_page.dart';
import 'package:algoriza_weather/features/weather_screen/presentation/page/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  DioHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit()..initDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.lightBlue[200],
          appBarTheme: AppBarTheme(
            color: Colors.lightBlue[200],
            elevation: 0,
          ),
        ),
        home: const WeatherPage(),
      ),
    );
  }
}
