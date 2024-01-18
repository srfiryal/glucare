class CheckHistoryModel {
  final DateTime time;
  final int value;
  final String? tag;
  final String unit;

  CheckHistoryModel({
    required this.time,
    required this.value,
    this.tag,
    required this.unit,
  });
}