import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_updated/cubit/get_weather_cubit.dart/cubit/get_weather_cubit.dart';
import 'package:weather_app_updated/views/search_view.dart';
import 'package:weather_app_updated/widgets/weather_info_body.dart';

import '../widgets/no_weather_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  SearchView()));
              },
              icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is GetWeatherLoadingState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const Text('oops, there is no weather information');
          }
        },
      ),
    );
  }
}
