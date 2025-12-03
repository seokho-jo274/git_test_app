import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: RecipeViewPage(), debugShowCheckedModeBanner: false),
  );
}

class RecipeViewPage extends StatelessWidget {
  const RecipeViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.favorite),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recipes', style: TextStyle(fontSize: 20)),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: List.generate(4, (index) {
                return icons(index);
              }),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: List.generate(3, (text) => texts(text)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget icons(int index) {
  IconData con;
  String type;
  switch (index) {
    case 0:
      con = Icons.house;
      type = 'All';
      break;
    case 1:
      con = Icons.local_cafe;
      type = 'coffee';
      break;
    case 2:
      con = Icons.fastfood;
      type = 'burger';
      break;
    default:
      con = Icons.local_pizza;
      type = 'Pizza';
      break;
  }
  return Container(
    margin: EdgeInsets.only(right: 40),
    width: 50,
    height: 70,
    decoration: BoxDecoration(
      border: Border.all(width: 0.5),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //
        Icon(con),
        Text(type),
      ],
    ),
  );
}

Widget texts(int text) {
  String tex;
  String image;
  switch (text) {
    case 0:
      tex = 'made coffee';
      image = 'http://picsum.photos/300/300';
    case 1:
      tex = 'made Burger';
      image = 'http://picsum.photos/301/301';
    default:
      tex = 'made Pizza';
      image = 'http://picsum.photos/3002/302';
  }
  return Column(
    children: [
      ClipRRect(
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              tex,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Have you ever made your own $tex? Once you've tried a\n homemade $tex, you'll never go back.",
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    ],
  );
}
