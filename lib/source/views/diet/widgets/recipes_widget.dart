import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_search_view.dart';
import '../views/diet_screen.dart';
import '../views/recipes_filter_screen.dart';
import 'recipe_item_widget.dart';

class RecipesWidget extends StatelessWidget {
  const RecipesWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
                child: CustomSearchView(
                    autofocus: false,
                    controller: searchController,
                    hintText: "Search")),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: RecipesFilterScreen(),
                        ));
              },
              child: Icon(
                Icons.filter_alt_rounded,
                color: theme.colorScheme.tertiary.withOpacity(0.5),
              ),
            )
          ],
        ),
        SizedBox(height: 20.h),
        Text("Recipes",
            style: TextStyle(
              color: theme.colorScheme.tertiary,
              fontSize: 32.fSize,
            )),
        SizedBox(height: 20.h),
        const RecipeItemWidget(),
      ],
    );
  }
}
