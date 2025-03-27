import 'package:exercise_together/db_exercise/db_exercise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ExerciseSettingLogic extends GetxController {

  DBExercise dbExercise = Get.find();

  cleanExerciseData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbExercise.cleanExerciseData();
            await dbExercise.initExercises(dbExercise.dbBase);
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutExerciseUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 76,
        height: 76,
      ),
      children: [
        const Text(
            """We can record your exercise for 30 days"""),
      ],
      context: context,
    );
  }

}
