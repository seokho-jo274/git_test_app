class AModel {
  int count;
  AModel(this.count);
  AModel copyWith({int? count}) {
    return AModel(count ?? this.count);
  }
}
