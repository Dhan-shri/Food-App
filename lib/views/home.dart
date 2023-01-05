import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/models/recipe_api.dart';
import 'package:food_recipe/views/widgets/recipe_card.dart';
import '../models/recipe.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;
  @override
  void initState(){
    super.initState();

    getRecipes();

  }

  Future<void> getRecipes() async{
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10,),
            Text("Food Recipe"),
          ],
        ),
      ),
      body: _isLoading
      ? const Center(child: CircularProgressIndicator(),)
      : ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index){
            return RecipeCard(title: _recipes[index].name, cookTime: _recipes[index].totalTime, rating:_recipes[index].rating.toString(), thumbnailUrl: _recipes[index].images);
          })
    );
  }
}
