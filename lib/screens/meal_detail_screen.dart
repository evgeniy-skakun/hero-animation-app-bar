import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meals-detail';

  const MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final Meal mealItem = routeArgs['mealItem'];
    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
      ),
      body: Hero(
        tag: mealItem.id,
        child: FadeInImage.assetNetwork(
          image: mealItem.imageUrl,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: 'assets/images/food_icon.gif',
        ),
      ),
    );
  }
}
