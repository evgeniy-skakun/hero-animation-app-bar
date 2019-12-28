import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final MaterialColor color;
  final String id;

  const CategoryItem({Key key, this.title, this.color, this.id}) : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {'title': title, 'id': id, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
          onTap: () => selectCategory(context),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: FittedBox(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: const Offset(0.0, 3.0),
            blurRadius: 3,
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            color.withOpacity(0.8),
            color[400],
            color[500],
            color[800],
            color[900],
          ],
        ),
      ),
    );
  }
}
