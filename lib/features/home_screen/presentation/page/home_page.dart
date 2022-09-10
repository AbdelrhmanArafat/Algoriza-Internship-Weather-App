// ignore_for_file: avoid_print

import 'package:algoriza_weather/core/util/blocs/cubit.dart';
import 'package:algoriza_weather/core/util/blocs/states.dart';
import 'package:algoriza_weather/features/weather_screen/presentation/page/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

  Color backgroundColor = Colors.lightBlue.shade200;

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() {
      print(scrollController.position.pixels);

      if (scrollController.position.pixels > 200) {
        setState(() {
          backgroundColor = Colors.lightBlue;
        });
      } else {
        setState(() {
          backgroundColor = Colors.lightBlue.shade200;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = WeatherCubit.get(context);
    return BlocConsumer<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          itemCount: 50,
          // cubit.currentWeatherModel?.forecast.forecastDay[0].hour.length,
          itemBuilder: ((context, index) => const WeatherPage()),
        );
      },
      listener: (context, state) {},
    );
  }
}
