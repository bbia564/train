import 'package:get/get.dart';

import 'exercise_edit_logic.dart';

class ExerciseEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseEditLogic());
  }
}
