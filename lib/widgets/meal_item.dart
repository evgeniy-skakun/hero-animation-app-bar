import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal mealItem;

  const MealItem({Key key, @required this.mealItem}) : super(key: key);

  void selectMeal(ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: {'mealItem': mealItem});
  }

  get complexity {
    switch (mealItem.complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
    }
  }

  get affordability {
    switch (mealItem.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknow';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Stack(children: <Widget>[
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Hero(
                    tag: mealItem.id,
                    child: FadeInImage.assetNetwork(
                      image: mealItem.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/food_icon.gif',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    width: mediaQuery.size.width - 50,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      mealItem.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${mealItem.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$complexity'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$affordability'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned.fill(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => selectMeal(context),
              splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
              highlightColor: Colors.transparent,
            ),
          ),
        ),
      ),
    ]);
  }
}
