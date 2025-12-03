// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // ✅ 1. StateProvider 만들기 (int 하나 관리)
// final aTextprovider = StateProvider<int>((ref) => 0);

// void main() {
//   // ✅ 2. ProviderScope로 감싸야 리버팟이 동작함
//   runApp(
//     ProviderScope(
//       child: MaterialApp(
//         home: TestA(),
//       ),
//     ),
//   );
// }

// // ✅ 3. Riverpod 쓰는 화면
// class TestA extends ConsumerStatefulWidget {
//   const TestA({super.key});

//   @override
//   ConsumerState<TestA> createState() => TextAState();
// }

// class TextAState extends ConsumerState<TestA> {
//   @override
//   Widget build(BuildContext context) {
//     // ✅ 상태 읽기 (UI에서 표시)
//     final count = ref.watch(aTextprovider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('숫자: $count'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // ✅ 상태 변경 (읽을 땐 watch, 바꿀 땐 read)
//             ref.read(aTextprovider.notifier).state++;
//           },
//           child: const Text('버튼'),
//         ),
//       ),
//     );
//   }
// }
