import 'dart:convert';
import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;


class RecipeApi{

  static Future<List<Recipe>> getRecipe() async{
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {"X-RapidAPI-Key": "f4e94592e7msh735425bfa4402c6p110dbfjsnf70c5bd9a3d0",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"});

    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']){
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);

  }
}

