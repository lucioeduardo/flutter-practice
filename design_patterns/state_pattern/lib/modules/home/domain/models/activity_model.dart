class ActivityModel {
  final String description;

  ActivityModel({
    required this.description,
  });

  factory ActivityModel.fromMap({required Map<String, dynamic> map}) {
    return ActivityModel(
      description: map['activity'],
    );
  }
}
