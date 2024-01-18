// import 'package:flutter/material.dart';
// import 'package:meals/Screens/categories_screen.dart';
// import 'package:meals/Screens/favorites_screen.dart';
// import 'package:meals/Widgets/main_drawer.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({super.key});

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//     initialIndex: 0,
//       child: Scaffold(appBar: AppBar(
//         title: const Text("Mariam's Meals"),
     
      
//       bottom: const TabBar(tabs: <Widget>[
//          Tab(
//           icon: Icon(Icons.category),
//           text: 'Categories',
//         ),
//           Tab(
//           icon: Icon(Icons.favorite),
//           text:'Favorites',
//         ),
//       ]),
//        ),
       
//       body: const TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
//       ),
    
//     );
//   }
// }