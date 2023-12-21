import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imple.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_imple.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<APIService>(
    APIService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      getIt.get<APIService>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImple>(
    SearchRepoImple(
      getIt.get<APIService>(),
    ),
  );
}
