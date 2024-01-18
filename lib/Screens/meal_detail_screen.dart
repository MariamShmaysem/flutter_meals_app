import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function? toggleMyFaves;
  final Function? isFave;
  const MealDetailScreen(this.toggleMyFaves,this.isFave,{super.key});
  static const routeName = '/Meal-Details';

  Widget buildSectionTitle(BuildContext context, String? text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text!,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        //height: 200.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String?;
    final selectedMeal =
        dummyMeals.firstWhere((element) => element.id! == mealId!);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}-$mealId')),
      body:
          //SingleChildScrollView(
          //child:
          Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          Expanded(
            child: buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) => Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients![index]!),
                      ),
                    )),
                itemCount: selectedMeal.ingredients!.length,
              ),
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('#${index + 1}')),
                        title: Text(selectedMeal.steps![index]!),
                      ),
                      const Divider(),
                    ],
                  )),
              itemCount: selectedMeal.steps!.length,
            ),
          ),
        ],
      ),
      //),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleMyFaves!(mealId!),
        // Navigator.of(context).pop(mealId!),
        child: Icon(isFave! (mealId) ? 
        Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
