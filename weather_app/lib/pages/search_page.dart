import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffad3b),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextFormField(
            onChanged: (data) {
              cityName = data;
            },
            onFieldSubmitted: (data) {
              cityName = data;

              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: 'Enter City Name',
              label: const Text(
                'Search',
                style: TextStyle(
                  color: Color(0xffffad3b),
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffffad3b),
                  width: 2,
                ),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: Colors.black87,
                onPressed: () {
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeather(cityName: cityName!);
                  BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
