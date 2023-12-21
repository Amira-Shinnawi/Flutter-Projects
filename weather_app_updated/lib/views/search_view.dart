import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_updated/cubit/get_weather_cubit.dart/cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  String? cityName;

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
             onChanged: (value) {
              cityName = value;
            },
            onFieldSubmitted: (value) {
              cityName = value;
              BlocProvider.of<GetWeatherCubit>(context)
                  .fetchWeatherState(cityName: cityName!);
              BlocProvider.of<GetWeatherCubit>(context).cityName = cityName;

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
                  BlocProvider.of<GetWeatherCubit>(context)
                      .fetchWeatherState(cityName: cityName!);
                  BlocProvider.of<GetWeatherCubit>(context).cityName = cityName;
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
