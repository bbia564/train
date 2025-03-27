import 'package:exercise_together/db_exercise/db_exercise.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../db_exercise/exercise_entity.dart';

class ExerciseEditLogic extends GetxController {
  DBExercise dbExercise = Get.find();

  List<String> subTitles = ['Dumbbell 50kg','Jogging', 'Punching bag'];
  List<String> titles = ['100 times', '10km', '2 hours'];
  List<List<double>> sizes = [
    [112, 277],
    [122, 277],
    [90, 278],
  ];

  ExerciseEntity entity = Get.arguments;

  void nextExercise() async {
    if (entity.type == 2) {
      entity.done = true;
    }
    if (entity.type < 2) {
      entity.type += 1;
    }
    await dbExercise.updateExercise(entity);
    update();
    if (entity.done) {
      Fluttertoast.showToast(msg: 'You have finished this exercise!');
      Get.back();
    }
  }

}
