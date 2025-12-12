import 'package:flutter/material.dart';
import 'package:flutter_git_test/to_do_app/to_do_app_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToDoEntity extends StatefulWidget {
  const ToDoEntity({super.key, required this.index});
  final int index;

  @override
  State<ToDoEntity> createState() => ToDoEntityState();
}

class ToDoEntityState extends State<ToDoEntity> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(toDoAppViewModelProvider);
                  final item = state.numberB[widget.index];
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(toDoAppViewModelProvider.notifier)
                          .toggleFavorite(item);
                    },
                    child: Icon(
                      item.isFavorite ? Icons.star_border : Icons.star,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.read(toDoAppViewModelProvider);
            final item = state.numberB[widget.index];
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.short_text_rounded, size: 20),
                      SizedBox(width: 12),
                      Text(
                        state.numberA.description!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Consumer(
                      builder: (context, ref, child) {
                        final state = ref.read(toDoAppViewModelProvider);
                        final item = state.numberB[widget.index];
                        return TextField(
                          onChanged: (value) {
                            ref
                                .read(toDoAppViewModelProvider.notifier)
                                .toggleText(widget.index, value);
                          },
                          controller: TextEditingController(
                            text: item.description ?? "",
                          ),
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "세부 내용을 입력하세요",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
