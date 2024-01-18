import 'package:flutter/material.dart';
import 'package:meals/Models/Meals.dart';

import '../Widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal?>? faveMeals;
  const FavoritesScreen(this.faveMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (faveMeals!.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
         return MealItem(
            faveMeals![i]!.id!,
            faveMeals![i]!.title!,
            faveMeals![i]!.imageUrl!,
            faveMeals![i]!.duration!,
            faveMeals![i]!.complexity,
            faveMeals![i]!.affordability,
          );
        },
        itemCount: faveMeals!.length,
      );
    }
  }
}
