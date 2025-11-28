class TitleModel {
  String queen;
  String shirt;

  TitleModel({required this.queen, required this.shirt});
  TitleModel copyWith({
    String? queen,
    String? shirt,
    double? cotton,
    double? greg,
  }) {
    return TitleModel(queen: queen ?? this.queen, shirt: shirt ?? this.shirt);
  }
}
