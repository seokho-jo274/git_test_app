class TastaModel {
  int count;
  TastaModel(this.count);
  TastaModel copyWith(int? count) {
    return TastaModel(count ?? this.count);
  }
}
