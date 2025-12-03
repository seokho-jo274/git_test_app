class CinemaModel {
  int columnCount;
  int rowCount;
  String total;
  CinemaModel({
    required this.columnCount,
    required this.rowCount,
    required this.total,
  });
  CinemaModel copyWith({int? columnCount, int? rowCount, String? total}) {
    return CinemaModel(
      columnCount: columnCount ?? this.columnCount,
      rowCount: rowCount ?? this.rowCount,
      total: total ?? this.total,
    );
  }
}
