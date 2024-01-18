import 'package:flutter/material.dart';
import 'package:meals/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';
  Function(Map<String?, bool?>?)? saveFilters;
  final Map<String?, bool?>? currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? _glutenFree = false;
  bool? _lactoseFree = false;
  bool? _vegan = false;
  bool? _vegetarian = false;

  @override
  void initState() {

    _glutenFree = widget.currentFilters!['gluten'];
    _lactoseFree = widget.currentFilters!['lactose'];
    _vegan = widget.currentFilters!['vegan'];
    _vegetarian = widget.currentFilters!['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(bool? value, String? title, String? description,
      void Function(bool? x)? updateValue) {
    return SwitchListTile(
      title: Text(title!),
      subtitle: Text(description!),
      value: value!,
      onChanged: updateValue!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree!,
                  'lactose': _lactoseFree!,
                  'vegan': _vegan!,
                  'vegeterian': _vegetarian!,
                };
                print("Hi I AM $selectedFilters");
                print("iH");
             
                     print(widget.saveFilters!);
                //print(widget.saveFilters!(selectedFilters));
                widget.saveFilters!(selectedFilters);
                print("BYYYYEEEE");
                //print(widget.saveFilters(selectedFilters));
                
             
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Adjust your meal selection',
                style: TextStyle(),
              )),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(_glutenFree!, 'Gluten Free',
                    'Only include gluten-free meals', (newValue) {
                  setState(() {
                    _glutenFree = newValue!;
                  });
                }),
                buildSwitchListTile(_lactoseFree!, 'Lactose Free',
                    'Only include lactose-free meals', (newValue) {
                  setState(() {
                    _lactoseFree = newValue!;
                  });
                }),
                buildSwitchListTile(
                    _vegan!, 'Vegan', 'Only include vegan meals', (newValue) {
                  setState(() {
                    _vegan = newValue!;
                  });
                }),
                buildSwitchListTile(
                    _vegetarian!, 'Vegeterian', 'Only include vegeterian meals',
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue!;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
