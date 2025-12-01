class Model1201 {
  int count1;
  int count2;

  Model1201({required this.count1, required this.count2});
  Model1201 copyWith({int? count1, int? count2}) {
    return Model1201(
      count1: count1 ?? this.count1,
      count2: count2 ?? this.count2,
    );
  }
}
