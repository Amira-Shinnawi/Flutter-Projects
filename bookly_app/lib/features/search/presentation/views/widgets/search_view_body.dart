import 'package:bookly_app/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/style.dart';
import 'search_result_list_view_item.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({
    super.key,
  });
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(
                  onPressed: () {
                    BlocProvider.of<SearchCubit>(context)
                        .fetchSearchBooks(subName: myController.text);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Search Results',
                  style: Styles.textStyle18,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Expanded(child: SearchResultListViewItem()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
