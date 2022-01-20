import 'package:flutter/material.dart';
import 'package:happy_cooking_app/models/recipe.dart';
import 'package:happy_cooking_app/models/recipe_api.dart';
import 'package:happy_cooking_app/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipe;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipe = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Food Recipe')
          ],
        )),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipe.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipe[index].name,
                      cookTime: _recipe[index].totalTime,
                      rating: _recipe[index].rating.toString(),
                      thumbnailUrl: _recipe[index].images);
                },
              ));
  }
}
