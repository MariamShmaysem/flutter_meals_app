import 'package:flutter/material.dart';
import 'package:meals/Screens/categories_screen.dart';
import 'package:meals/Screens/favorites_screen.dart';

import '../Models/Meals.dart';
import '../Widgets/main_drawer.dart';

class BottomTabs extends StatefulWidget {
  final List<Meal?>? favoriteMeals;
  const BottomTabs(this.favoriteMeals, {super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  // final List<Widget> _pages = [
  //   const CategoriesScreen(),
  //   const FavoritesScreen(),
  // ];

  List<Map<String?, dynamic>?>? _pages;
  int _selectedPageIndex = 0;
  // String? title = 'Categories';
  @override
  void initState() {
        _pages = [
    {
      'page': const CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page':  FavoritesScreen(widget.favoriteMeals),
      'title': 'My Favorite',
    },
  ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      //   if (_selectedPageIndex == 0) {
      //     title = 'Categories';
      // } else if (_selectedPageIndex == 1) {
      //     title = 'My Favorites';
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages![_selectedPageIndex]!['title']!,
        ),
      ),
      drawer: const MainDrawer(),
      body: _pages![_selectedPageIndex]!['page']!,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite),
            )
          ]),
    );
  }
}
