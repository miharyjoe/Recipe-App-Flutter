import 'package:first_app_flutter/recipe.dart';
import 'package:first_app_flutter/recipe_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
// 1
    return Scaffold(
// 2
      appBar: AppBar(
        title: Text(widget.title),
      ),
// 3
      body: SafeArea(
// TODO: Replace child: Container()
// 4
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext, int index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return RecipeDetail(recipe: Recipe.samples[index]);
                }));
              },
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
        ),
      ),
    );
  }
// TODO: Add buildRecipeCard() here
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
// 1
      elevation: 2.0,
// 2
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
// 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
// 4
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
// 5
            const SizedBox(
              height: 14.0,
            ),
//6
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
