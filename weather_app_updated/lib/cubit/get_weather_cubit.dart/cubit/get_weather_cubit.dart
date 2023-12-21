import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_updated/models/weather_model.dart';

import '../../../services/weather_services.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit(this.weatherService) : super(WeatherInitialState());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  fetchWeatherState({required String cityName}) async {
    try {
      weatherModel =
          await weatherService.getCurrentWeather(cityName: cityName);
      emit(GetWeatherLoadingState(weatherModel: weatherModel!));
    } catch (e) {
      emit(GetWeatherFailureState(e.toString()));
    }
  }
}
