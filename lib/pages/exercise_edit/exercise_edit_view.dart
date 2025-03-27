import 'package:exercise_together/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'exercise_edit_logic.dart';

class ExerciseEditPage extends GetView<ExerciseEditLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${controller.entity.day + 1} day',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<ExerciseEditLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              <Widget>[
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  child: const Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ).decorated(
                    color: controller.entity.type > 0
                        ? primaryColor
                        : const Color(0xffd0d0d0),
                    borderRadius: BorderRadius.circular(17)),
                Expanded(
                    child: Container(
                  height: 2,
                )
                        .decorated(
                            color: controller.entity.type > 0
                                ? primaryColor
                                : const Color(0xffd0d0d0))
                        .marginSymmetric(horizontal: 10)),
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  child: const Text(
                    '2',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ).decorated(
                    color: controller.entity.type >= 2
                        ? primaryColor
                        : const Color(0xffd0d0d0),
                    borderRadius: BorderRadius.circular(17)),
                Expanded(
                    child: Container(
                  height: 2,
                )
                        .decorated(
                            color: controller.entity.type >= 2
                                ? primaryColor
                                : const Color(0xffd0d0d0))
                        .marginSymmetric(horizontal: 10)),
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  child: const Text(
                    '3',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ).decorated(
                    color: controller.entity.type == 3
                        ? primaryColor
                        : const Color(0xffd0d0d0),
                    borderRadius: BorderRadius.circular(17))
              ].toRow(),
              const SizedBox(
                height: 45,
              ),
              Image.asset(
                'assets/icon${controller.entity.type}.webp',
                width: controller.sizes[controller.entity.type].first,
                height: controller.sizes[controller.entity.type].last,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                controller.subTitles[controller.entity.type],
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                controller.titles[controller.entity.type],
                style: TextStyle(
                    fontSize: 33,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  controller.entity.type == 2 ? 'Done' : 'Next',
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
                  .decorated(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15))
                  .gestures(onTap: () {
                    controller.nextExercise();
              })
            ].toColumn(),
          );
        }).marginAll(20)),
      ),
    );
  }
}
