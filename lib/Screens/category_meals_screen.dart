import 'package:flutter/material.dart';
import 'package:meals/Models/Meals.dart';
import 'package:meals/Widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryTitle;
  // final String categoryId;
  final List<Meal?>? availableMeals;
  const CategoryMealsScreen(this.availableMeals,{super.key});
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal?>? displayedMeals;
  var _dataLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_dataLoaded) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments! as Map<String?, String?>;
      categoryTitle = routeArgs['title']!;
      final categoryid = routeArgs['id']!;
      displayedMeals = widget.availableMeals!.where(((meal) {
        return meal!.categories!.contains(categoryid);
      })).toList();
      _dataLoaded = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String? mealId) {
    setState(() {
      displayedMeals!.removeWhere((element) => element!.id! == mealId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle.toString())),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
              displayedMeals![i]!.id!,
              displayedMeals![i]!.title!,
              displayedMeals![i]!.imageUrl!,
              displayedMeals![i]!.duration!,
              displayedMeals![i]!.complexity,
              displayedMeals![i]!.affordability,
              //_removeMeal
              );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
