import 'package:exercise_together/db_exercise/exercise_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBExercise extends GetxService {
  late Database dbBase;

  Future<DBExercise> init() async {
    await createExerciseDB();
    return this;
  }

  createExerciseDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'exercise.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createExerciseTable(db);
      await initExercises(db);
    });
  }

  createExerciseTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS exercise (id INTEGER PRIMARY KEY, day INTEGER, type INTEGER, done INTEGER)');
  }

  initExercises(Database db) async {
    for (var i = 0; i < 30; i++) {
      await db.insert('exercise', {
        'day': i,
        'type': 0,
        'done': 0,
      });
    }
  }

  updateExercise(ExerciseEntity entity) async {
    await dbBase.update(
        'exercise',
        {
          'type': entity.type,
          'done': entity.done ? 1 : 0,
        },
        where: 'id = ?',
        whereArgs: [entity.id]);
  }

  cleanExerciseData() async {
    await dbBase.delete('exercise');
  }

  Future<List<ExerciseEntity>> getExerciseAllData() async {
    var result = await dbBase.query('exercise', orderBy: 'id ASC');
    return result.map((e) => ExerciseEntity.fromJson(e)).toList();
  }
}
