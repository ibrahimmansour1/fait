import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class RecipeCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String? recipeName;
  final num? recipeWeight;
  final num? recipeCal;
  bool favourite;
  StateProvider<bool>? isFavouriteProvider;
  VoidCallback? onTap;

  RecipeCardWidget(
      {super.key,
      this.favourite = false,
      this.onTap,
      this.imageUrl,
      this.recipeName,
      this.recipeWeight,
      this.recipeCal}) {
    isFavouriteProvider = StateProvider<bool>((ref) {
      return favourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 16.v),
          decoration: AppDecoration.fillBluegray80004.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
            color: theme.colorScheme.onPrimaryContainer,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImageView(
                      imagePath: imageUrl ?? ImageConstant.imgImage80x80,
                      height: 72.adaptSize,
                      width: 72.adaptSize,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(8.h)),
                  SizedBox(
                    width: 30.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipeName ?? "Salamon",
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: theme.colorScheme.tertiary,
                              ),
                            ),
                            SizedBox(height: 15.v),
                            SizedBox(
                              width: 180.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Text(
                                      "$recipeWeight grams",
                                      style:
                                          theme.textTheme.titleSmall!.copyWith(
                                        color: theme.colorScheme.tertiary,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Text(
                                      "$recipeCal cal",
                                      style:
                                          theme.textTheme.titleSmall!.copyWith(
                                        color: theme.colorScheme.tertiary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])),
                ],
              ),
              GestureDetector(
                onTap: () {
                  ref
                      .read(isFavouriteProvider!.notifier)
                      .update((state) => !state);
                },
                child: CustomImageView(
                    imagePath: ImageConstant.imgFavoriteBlueGray90020x20,
                    height: 18.v,
                    width: 20.h,
                    color: ref.watch(isFavouriteProvider!)
                        ? theme.colorScheme.primary
                        : null,
                    margin: EdgeInsets.symmetric(vertical: 27.v)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
