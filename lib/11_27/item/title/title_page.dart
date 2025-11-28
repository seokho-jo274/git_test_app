import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      //
    );
  }
}

Widget images(String image) {
  return Row(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/100/100'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      //
    ],
  );
}
