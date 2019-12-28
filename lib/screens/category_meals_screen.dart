import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      // return meal.categories.contains(routeArgs['id']);
      return meal.categories.contains('c2');
    }).toList();
    // final title = routeArgs['title'];
    // final color = routeArgs['color'];

    final color = Colors.purple;
    final title = 'Quick & Easy';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(mealItem: categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}