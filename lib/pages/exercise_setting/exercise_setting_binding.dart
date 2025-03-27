import 'package:get/get.dart';

import 'exercise_setting_logic.dart';

class ExerciseSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseSettingLogic());
  }
}
