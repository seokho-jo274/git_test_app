// 데이터
class Model {
  int count;
  Model(this.count);
  Model copyWith({int? count}) {
    return Model(count ?? this.count);
  }
}
