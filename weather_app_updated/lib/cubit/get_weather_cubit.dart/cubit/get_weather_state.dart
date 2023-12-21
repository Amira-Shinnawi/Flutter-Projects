part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class WeatherInitialState extends GetWeatherState {}

final class GetWeatherLoadingState extends GetWeatherState {
  WeatherModel weatherModel;
  GetWeatherLoadingState({required this.weatherModel});
}

final class GetWeatherFailureState extends GetWeatherState {
  final String errorMessage;

  GetWeatherFailureState(this.errorMessage);
}
