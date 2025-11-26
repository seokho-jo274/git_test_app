class Model {
  bool aisOn;
  bool bisOn;
  bool cisOn;
  Model({required this.aisOn, required this.bisOn, required this.cisOn});
  Model copyWith({bool? aisOn, bool? bisOn, bool? cisOn}) {
    return Model(
      aisOn: aisOn ?? this.aisOn,
      bisOn: bisOn ?? this.bisOn,
      cisOn: cisOn ?? this.cisOn,
    );
  }
}

class Models {
  Model isOns;
  Models(this.isOns);
}
