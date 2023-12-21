import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/success_body.dart';
import '../models/weather_model.dart';
import 'initial_body.dart';

class HomePage extends StatelessWidget {

  HomePage({super.key});
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: ((context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return SuccessBody(weatherData:state.weatherModel);
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text('Something wrong please try again'),
            );
          } else {
            return const InitialBody();
          }
        }),
      ),
    );
  }
}
