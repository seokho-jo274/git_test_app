import 'package:flutter/material.dart';
import 'package:flutter_git_test/to_do_app/to_do_app_view_model.dart';
import 'package:flutter_git_test/to_do_app/to_do_entity/to_do_entity.dart';
import 'package:flutter_git_test/to_do_app/to_do_theme/to_do_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ToDoAppPage(),
        themeMode: ThemeMode.dark,
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    ),
  );
}

class ToDoAppPage extends StatefulWidget {
  const ToDoAppPage({super.key});

  @override
  State<ToDoAppPage> createState() => _ToDoAppPageState();
}

class _ToDoAppPageState extends State<ToDoAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(toDoAppViewModelProvider);
            return Text(
              state.numberA.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(toDoAppViewModelProvider);
          return state.numberB.isEmpty
              ? nelltext()
              : Expanded(child: newtext());
        },
      ),
      floatingActionButton: button(context),
    );
  }

  // 할일 없음
  Widget nelltext() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: NetworkImage('https://picsum.photos/100')),

          SizedBox(height: 12),
          Text(
            '아직 할 일이 없음',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Consumer(
            builder: (context, ref, child) => Text(
              '할 일을 추가하고 ${ref.watch(toDoAppViewModelProvider).numberA.title}에서\n할 일을 추적하세요',
              style: TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // 새 할일 추가됨
  Widget newtext() {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(toDoAppViewModelProvider);
        return ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: state.numberB.length,
          itemBuilder: (context, index) {
            final item = state.numberB[index];
            return Container(
              padding: EdgeInsets.only(right: 16, left: 16),
              margin: EdgeInsets.only(bottom: 8, top: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(toDoAppViewModelProvider.notifier)
                            .toggleToDo(index);
                      },
                      child: Icon(
                        item.isDone
                            ? Icons.circle_outlined
                            : Icons.check_circle,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ToDoEntity(index: index),
                            ),
                          );
                        },
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 18,
                            decoration: item.isDone
                                ? TextDecoration.none
                                : TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(toDoAppViewModelProvider.notifier)
                            .toggleFavorite(item);
                      },
                      child: Icon(
                        item.isFavorite ? Icons.star_border : Icons.star,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// 모달버튼
Widget button(BuildContext context) {
  final TextEditingController controller = TextEditingController();
  final TextEditingController subcontroller = TextEditingController();
  FocusNode node = FocusNode();
  return FloatingActionButton(
    backgroundColor: Theme.of(context).colorScheme.secondary,
    foregroundColor: Theme.of(context).colorScheme.onSecondary,
    shape: CircleBorder(),
    onPressed: () {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        context: context,
        builder: (context) {
          return Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(showDetailProvider);
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[300]),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 0,
                            right: 20,
                            top: 12,
                            bottom: 0,
                          ),
                          child: TextField(
                            style: TextStyle(fontSize: 14),
                            controller: controller,
                            focusNode: node,
                            autofocus: true,
                            onTap: () {
                              ref.read(showDetailProvider.notifier).state =
                                  true;
                            },
                            decoration: InputDecoration(
                              hintText: '새 할 일',

                              fillColor: Colors.grey[300],
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        if (!state)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 20,
                              top: 12,
                              bottom: 0,
                            ),
                            child: TextField(
                              focusNode: node,
                              controller: subcontroller,
                              decoration: InputDecoration(
                                hintText: '세부사항',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              if (state)
                                Consumer(
                                  builder: (context, ref, child) {
                                    final show = ref.watch(showDetailProvider);
                                    return GestureDetector(
                                      onTap: () {
                                        ref
                                                .read(
                                                  showDetailProvider.notifier,
                                                )
                                                .state =
                                            !show;
                                      },
                                      child: Icon(
                                        Icons.short_text_rounded,
                                        size: 24,
                                      ),
                                    );
                                  },
                                ),
                              SizedBox(width: 20),
                              Consumer(
                                builder: (context, ref, child) {
                                  final star = ref.watch(tempFavoriteProvider);
                                  return GestureDetector(
                                    onTap: () {
                                      ref
                                              .read(
                                                tempFavoriteProvider.notifier,
                                              )
                                              .state =
                                          !star;
                                    },
                                    child: Icon(
                                      star ? Icons.star_border : Icons.star,
                                      size: 24,
                                    ),
                                  );
                                },
                              ),
                              Spacer(),

                              GestureDetector(
                                onTap: () {
                                  final text = controller.text;
                                  final description = subcontroller.text;
                                  final favorite = ref.read(
                                    tempFavoriteProvider,
                                  );
                                  if (text.isNotEmpty) {
                                    ref
                                        .read(toDoAppViewModelProvider.notifier)
                                        .addToDo(text, favorite, description);
                                    controller.clear();
                                    Navigator.pop(context);
                                  } else {
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('할 일을 입력해주세요'),
                                        backgroundColor: Colors.deepOrange
                                            .withValues(alpha: 0.8),
                                        behavior: SnackBarBehavior.floating,
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
                                child: Text('저장'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    },
    child: Icon(Icons.add, color: Colors.white, size: 24),
  );
}
