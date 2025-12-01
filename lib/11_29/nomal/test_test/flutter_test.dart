import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FutureExample());
  }
}

class FutureExample extends StatefulWidget {
  const FutureExample({super.key});
  @override
  State<FutureExample> createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {
  String message = "아직 데이터 없음";

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3)); // 서버 기다리는 느낌
    return "서버에서 응답 도착!";
  }

  void loadData() async {
    String result = await fetchData(); // Future 값 꺼내기
    setState(() {
      message = result; // 화면 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Future 연습")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: loadData, child: Text("데이터 불러오기")),
          ],
        ),
      ),
    );
  }
}
