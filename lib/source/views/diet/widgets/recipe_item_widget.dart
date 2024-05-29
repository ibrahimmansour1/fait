import 'package:flutter/material.dart';

import '../views/recipe_info_screen.dart';
import 'recipe_card_widget.dart';

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: RecipeCardWidget(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (_) => const RecipeInfoScreen());
            },
          ),
        ),
      ),
    );
  }
}
