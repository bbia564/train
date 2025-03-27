class ExerciseEntity {
  int id;
  int day;
  int type;
  bool done;

  ExerciseEntity({
    required this.id,
    required this.day,
    required this.type,
    required this.done,
  });

  factory ExerciseEntity.fromJson(Map<String, dynamic> json) {
    return ExerciseEntity(
      id: json['id'],
      day: json['day'],
      type: json['type'],
      done: json['done'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'type': type,
      'done': done ? 1 : 0,
    };
  }
}