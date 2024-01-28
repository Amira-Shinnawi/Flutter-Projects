import 'package:bookly_app/features/search/data/repos/search_repo_imple.dart';
import 'package:bookly_app/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../home/data/models/book_model/book_model.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key, this.bookModel});
  final BookModel? bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        getIt.get<SearchRepoImple>(),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: SearchViewBody()),
      ),
    );
  }
}
