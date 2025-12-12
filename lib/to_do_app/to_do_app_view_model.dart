import 'package:flutter_git_test/to_do_app/to_do_app_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class ToDoAppViewModel extends Notifier<ToDoModel> {
  @override
  ToDoModel build() {
    return ToDoModel(
      numberA: ToDoAppModel(
        title: "석호'sTasks",
        description: '세부 내용은 다음과 같습니다.',
      ),
      numberB: [],
    );
  }

  void addToDo(String text, bool favorite, String? description) {
    final newItem = ToDoItem(
      title: text,
      isDone: true,
      isFavorite: favorite,
      description: description,
    );
    state = state.copyWith(numberB: [...state.numberB, newItem]);
  }

  void toggleToDo(int index) {
    final item = state.numberB[index];
    final updated = item.copyWith(isDone: !item.isDone);
    final newList = [...state.numberB];
    newList[index] = updated;
    state = state.copyWith(numberB: newList);
  }

  void toggleText(int index, String text) {
    final item = state.numberB[index];
    final updated = item.copyWith(description: text);
    final newList = [...state.numberB];
    newList[index] = updated;
    state = state.copyWith(numberB: newList);
  }

  void toggleFavorite(ToDoItem item) {
    final index = state.numberB.indexOf(item);
    final updated = item.copyWith(isFavorite: !item.isFavorite);
    final newList = [...state.numberB];
    newList[index] = updated;
    state = state.copyWith(numberB: newList);
  }
}

//임시 보관
// 세부사항
final showDetailProvider = StateProvider<bool>((ref) => true);
// 즐겨찾기
final tempFavoriteProvider = StateProvider<bool>((ref) => true);

final toDoAppViewModelProvider = NotifierProvider<ToDoAppViewModel, ToDoModel>(
  ToDoAppViewModel.new,
);
