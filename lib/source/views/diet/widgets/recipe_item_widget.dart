import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../views/recipe_info_screen.dart';
import 'recipe_card_widget.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

Stream<List<dynamic>> streamCsvData(String path) async* {
  final csvData = await rootBundle.loadString(path);
  const CsvToListConverter csvConverter = CsvToListConverter();
  List<List<dynamic>> data = csvConverter.convert(csvData);
  for (var row in data) {
    yield row;
  }
}

class RecipeItemWidget extends StatefulWidget {
  const RecipeItemWidget({super.key});

  @override
  _RecipeItemWidgetState createState() => _RecipeItemWidgetState();
}

class _RecipeItemWidgetState extends State<RecipeItemWidget> {
  List<Map<String, dynamic>> recipes = [];
  bool isLoading = false;
  int pageSize = 50; // Number of recipes to load per page
  int currentPage = 0;
  StreamSubscription<List<dynamic>>? csvSubscription;
  List<String>? headers;

  @override
  void initState() {
    super.initState();
    _loadNextPage();
  }

  @override
  void dispose() {
    csvSubscription?.cancel();
    super.dispose();
  }

  Future<void> _loadNextPage() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    csvSubscription = streamCsvData('assets/recipes.csv')
        .skip(currentPage * pageSize)
        .take(pageSize)
        .listen((row) {
      if (headers == null) {
        headers = List<String>.from(row);
      } else {
        Map<String, dynamic> recipe = {};
        for (int i = 0; i < headers!.length; i++) {
          recipe[headers![i]] = row[i];
        }
        setState(() {
          recipes.add(recipe);
        });
      }
    });

    await csvSubscription?.asFuture();
    setState(() {
      isLoading = false;
      currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return recipes.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _loadNextPage();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  log(recipe.toString());
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RecipeCardWidget(
                      imageUrl: parseFirstImageUrl(recipe['Images']),
                      recipeName: recipe['Name'],
                      recipeWeight: (recipe['Calories'] / 2),
                      recipeCal: recipe['Calories'],
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          builder: (_) => RecipeInfoScreen(
                            textForPreparation: recipe['RecipeInstructions'],
                            fatsPercentage: recipe['fatsPercentage'],
                            carbohydratesPercentage:
                                recipe['carbohydratesPercentage'],
                            proteinsPercentage: recipe['proteinsPercentage'],
                            proteinGrams: recipe['ProteinContent'],
                            carbsGrams: recipe['CarbohydrateContent'],
                            fibersGrams: recipe['FiberContent'],
                            sugarsGrams: recipe['SugarContent'],
                            fatsGrams: recipe['FatContent'],
                            saturatedFatGrams: recipe['SaturatedFatContent'],
                            unSaturatedFatGrams: recipe['unSaturatedFatGrams'],
                            category: recipe['RecipeCategory'],
                            timeForPreparation: recipe['PrepTime'],
                            cookTime: recipe['CookTime'],
                            ingredients: _parseIngredients(
                                recipe['RecipeIngredientParts']),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
  }

  String parseFirstImageUrl(String imagesString) {
    // Remove 'c(' at the start and the closing ')' at the end
    final cleanedString =
        imagesString.replaceFirst('c(', '').replaceFirst(')', '');
    // Split the cleaned string by ', ' to get a list of image URLs
    List<String> urls = cleanedString.split(', ');
    // Return the first URL if available
    return urls.isNotEmpty ? urls[0].replaceAll('"', '') : '';
  }

  List<String> _parseIngredients(String ingredientsString) {
    // Remove 'RecipeIngredientParts: c(' and the closing ')'
    final cleanedString = ingredientsString
        .replaceFirst('RecipeIngredientParts: c(', '')
        .replaceFirst(')', '');
    // Split the cleaned string by ', ' to get a list of ingredients
    return cleanedString.split(', ');
  }
}
