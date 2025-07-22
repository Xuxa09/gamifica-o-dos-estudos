class HabitModel {
  final String name;
  final bool bad_good;
  final String type_habit; //quantidade tarefa ou time
  final List<String> frequency;

  HabitModel(
      {required this.name,
      required this.bad_good,
      required this.frequency,
      required this.type_habit});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'badGood': bad_good,
      'typeHabit': type_habit,
      'frequency': frequency,
    };
  }

  factory HabitModel.fromJson(Map<String, dynamic> map) {
    return HabitModel(
      name: map['name'] ?? '',
      bad_good: map['badGood'] ?? true,
      type_habit: map['typeHabit'] ?? '',
      frequency: List<String>.from(map['frequency'] ?? []),
    );
  }


}
