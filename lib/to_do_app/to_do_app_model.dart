// 상태 관리
class ToDoModel {
  ToDoAppModel numberA;
  List<ToDoItem> numberB;
  ToDoModel({required this.numberA, required this.numberB});
  ToDoModel copyWith({ToDoAppModel? numberA, List<ToDoItem>? numberB}) {
    return ToDoModel(
      numberA: numberA ?? this.numberA,
      numberB: numberB ?? this.numberB,
    );
  }
}

// 기본 값
class ToDoAppModel {
  final String title;
  final String? description;

  ToDoAppModel({required this.title, required this.description});
}

// 할일 목록
class ToDoItem {
  final String title;
  final String? description;
  final bool isDone;
  final bool isFavorite;
  ToDoItem({
    required this.title,
    required this.description,
    required this.isDone,
    required this.isFavorite,
  });
  ToDoItem copyWith({
    String? title,
    String? description,
    bool? isDone,
    bool? isFavorite,
  }) {
    return ToDoItem(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
