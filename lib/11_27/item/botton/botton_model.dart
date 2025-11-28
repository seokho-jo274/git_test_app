class BottonModel {
  int count;

  BottonModel({required this.count});
  BottonModel copyWith({int? count}) {
    return BottonModel(count: count ?? this.count);
  }
}
