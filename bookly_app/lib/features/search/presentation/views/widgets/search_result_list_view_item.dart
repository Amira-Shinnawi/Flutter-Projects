import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets_data.dart';

class SearchResultListViewItem extends StatelessWidget {
  const SearchResultListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,
                              extra: state.books[index]);
                      },
                      child: SearchListView(
                        bookModel: state.books[index],
                      ),
                    ),
                  );
                }),
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if(state is SearchLoading) {
          return const CustomLoadingIndicator();
        }else{
          return Center(
            child: Image.asset(
              AssetsData.logo,
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.height * .6,
              fit: BoxFit.contain,
            ),
          );

        }
      },
    );
  }
}
