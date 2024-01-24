import '../db/database_helper.dart';
import '../models/task_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{
  final RxList<Task> taskList = <Task>[].obs;


  Future<int> addTask({Task? task}){
    return DBHelper.insert(task);
  }

  Future<void> getTasks() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void deleteTasks(String title) async {
    print("int task controller");
    await DBHelper.delete(title);
    getTasks();
  }

  void deleteAllTasks() async {
    await DBHelper.deleteAll();
    getTasks();
  }

  void markTaskAsCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}