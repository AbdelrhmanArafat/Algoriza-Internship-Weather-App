import 'package:algoriza_weather/core/util/blocs/cubit.dart';
import 'package:algoriza_weather/core/util/blocs/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();

    WeatherCubit.get(context).getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = WeatherCubit.get(context);
    return BlocConsumer<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          drawer: Padding(
            padding: const EdgeInsets.only(top: 36),
            child: Drawer(
              backgroundColor: Colors.grey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.settings_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Favorite Location',
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const FaIcon(
                                FontAwesomeIcons.circleExclamation,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${cubit.currentWeatherModel?.location.name}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.sunny,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${cubit.currentWeatherModel?.current.tempC} °',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            '-------------------------------------------------------------------------------------',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Icon(
                                Icons.add_location_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Other Location',
                                style: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${cubit.currentWeatherModel?.location.region}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white30,
                                    fontSize: 25,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.sunny,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC} °',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueGrey,
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                'Manage Locations',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            '-------------------------------------------------------------------------------------',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.circleExclamation,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Report Wrong Location',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(
                                Icons.headset_mic_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Contact us',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${cubit.currentWeatherModel?.current.tempC.toString()}°',
                              style: const TextStyle(
                                fontSize: 70,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${cubit.currentWeatherModel?.location.name}',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.location_on_sharp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/sun.png',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Text(
                    '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}° / '
                    '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}° '
                    'Feels like ${cubit.currentWeatherModel?.forecast.forecastDay[0].day.avgTempC}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${DateFormat.E().format(DateTime.now())} , ${DateFormat.jm().format(DateTime.now())}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30,
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '3 pm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.water_drop,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '4 pm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.water_drop,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '5 pm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.avgTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.water_drop,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '6 pm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.avgTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.water_drop,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '7 pm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const Icon(
                                Icons.nightlight,
                                color: Colors.yellow,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.water_drop,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '8 pm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const Icon(
                                Icons.nightlight,
                                color: Colors.yellow,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.water_drop,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30,
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 80,
                    child: Column(
                      children: const [
                        Text(
                          'Today\'s Temperature',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Expect the same as yesterday',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30,
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Yesterday',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}° '
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Today',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 104),
                              const Icon(
                                Icons.water_drop,
                                size: 10,
                                color: Colors.grey,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.nightlight_rounded,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}° '
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Sunday',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 95),
                              const Icon(
                                Icons.water_drop,
                                size: 10,
                                color: Colors.grey,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.nightlight_rounded,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}° '
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Monday',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 90),
                              const Icon(
                                Icons.water_drop,
                                size: 10,
                                color: Colors.grey,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.nightlight_rounded,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}° '
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Tuesday',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 89),
                              const Icon(
                                Icons.water_drop,
                                size: 10,
                                color: Colors.grey,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.nightlight_rounded,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}° '
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Wednesday',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 65),
                              const Icon(
                                Icons.water_drop,
                                size: 10,
                                color: Colors.grey,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.nightlight_rounded,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}° '
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Thursday',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 80),
                              const Icon(
                                Icons.water_drop,
                                size: 10,
                                color: Colors.grey,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.nightlight_rounded,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}° '
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Friday',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 104),
                              const Icon(
                                Icons.water_drop,
                                size: 10,
                                color: Colors.grey,
                              ),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.dailyChanceOfRain}%',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.nightlight_rounded,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.maxTempC}° '
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].day.minTempC}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30,
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Sunrise',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].astro.sunrise}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Image.asset(
                                'assets/images/sunrise.png',
                                fit: BoxFit.cover,
                                width: 75,
                                height: 38,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Sunset',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].astro.sunset}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Image.asset(
                                'assets/images/sunset.png',
                                fit: BoxFit.cover,
                                width: 75,
                                height: 38,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30,
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/uv_index.png',
                                fit: BoxFit.cover,
                                width: 40,
                                height: 37,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'UV index',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].hour[0].uv}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/wind.png',
                                fit: BoxFit.cover,
                                width: 40,
                                height: 37,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Wind',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].hour[0].windkph} km/h',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/humidity.png',
                                fit: BoxFit.cover,
                                width: 40,
                                height: 37,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Humidity',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${cubit.currentWeatherModel?.forecast.forecastDay[0].hour[0].humidity} %',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
