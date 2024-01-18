import 'package:flutter/material.dart';
import 'package:meals/Models/Meals.dart';
import 'package:meals/Screens/bottom_tabs.dart';
import 'package:meals/Screens/category_meals_screen.dart';
import 'package:meals/Screens/filters_screen.dart';
import 'package:meals/Screens/meal_detail_screen.dart';
import 'package:meals/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String?, bool?>? _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal?>? _availableMeals = dummyMeals;
  List<Meal?>? _favoritedMeals = [];

  void _setFilters(Map<String?, bool?>? filtersData) {
    setState(() {
      _filters = filtersData!;
      _availableMeals = dummyMeals.where((element) {
        if (_filters!['gluten']! && !element.isGlutenFree!) {
          return false;
        }
        if (_filters!['lactose']! && !element.isLactoseFree!) {
          return false;
        }
        if (_filters!['vegan']! && !element.isVegan!) {
          return false;
        }
        if (_filters!['vegetarian']! && !element.isVegetarian!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String? mealId) {
    final existingIndex =
        _favoritedMeals!.indexWhere((element) => element!.id! == mealId!);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals!.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals!
            .add(dummyMeals.firstWhere((element) => element.id! == mealId!));
      });
    }
  }

  bool? _isMealFave(String? id) {

    return _favoritedMeals!.any((element) => element!.id! ==id!);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.pink),
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            // bodyText1: const TextStyle(
            //   color: Color.fromRGBO(20, 51, 51, 1)
            // ),
            // bodyText2: const TextStyle(
            //   color: Color.fromRGBO(20, 51, 51, 1)
            // ),
            titleMedium: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed')),
      ),

      ///home: const CategoriesScreen(), //main screen of App
      initialRoute: '/', //slash is default
      routes: {
        '/': (context) => BottomTabs(_favoritedMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals!),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(toggleFavorite,_isMealFave),
        FiltersScreen.routName: (context) =>
            FiltersScreen(_filters!, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   debugPrint(settings.arguments.toString());
      // if (settings.name == 'category-meals') {
      //   return '..';
      // }
      // else  if (settings.name == 'xxx--xxx') {
      //   return '..';
      // }
      //   return MaterialPageRoute(builder: (c) => const CategoriesScreen());
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (c) => const CategoriesScreen());
      // },
    );
  }
}
