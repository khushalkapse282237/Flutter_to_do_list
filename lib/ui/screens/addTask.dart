import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_to_do_app/main.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/task_controller.dart';
import '../../models/task_model.dart';
import '../themes.dart';
import 'myHomePage.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<StatefulWidget> createState() => addTaskState();
}

class addTaskState extends State<addTask> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _title = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  DateTime _date = DateTime.now();
  var _startTime = TimeOfDay.now();
  var _endTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: _addingTheTask(),
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      title: Text(
        "Add a Task",
        style: headingStyle,
      ),
      elevation: 0,
      actions: const [
        CircleAvatar(
          child: Icon(Icons.person_outlined),
        ),
        SizedBox(
          width: 6,
        )
      ],
    );
  }

  _addingTheTask() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //tite,note,date,startime,endtime,repeat,rewind
            Text(
              "Title",
              style: subHeadingStyle,
            ),
            TextField(
              controller: _title,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter task's title",
                hintStyle: subTitleStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Get.isDarkMode ? Colors.white : darkPrimaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: lightPrimaryColor,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Notes",
              style: subHeadingStyle,
            ),
            TextField(
              controller: _notes,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter task's notes",
                hintStyle: subTitleStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Get.isDarkMode ? Colors.white : darkPrimaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: lightPrimaryColor,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Date",
              style: subHeadingStyle,
            ),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: DateFormat('yMd').format(_date),
                hintStyle: subTitleStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Get.isDarkMode ? Colors.white : darkPrimaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: lightPrimaryColor,
                    width: 2,
                  ),
                ),
              ),
              onTap: () async {
                DateTime? datePicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030));
                _date = datePicker!;
                debugPrint("$_date");
                setState(() {});
              },
            ),
            const SizedBox(height: 10),
            Text(
              "Start-Time",
              style: subHeadingStyle,
            ),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: "${_startTime.hour}:${_startTime.minute}",
                hintStyle: subTitleStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Get.isDarkMode ? Colors.white : darkPrimaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: lightPrimaryColor,
                    width: 2,
                  ),
                ),
              ),
              onTap: () async {
                TimeOfDay? timePicker = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial);
                if (timePicker != null) {
                  _startTime = timePicker;
                  debugPrint(
                      "Start Time : ${_startTime.hour}:${_startTime.minute}");
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 10),
            Text(
              "End-Time",
              style: subHeadingStyle,
            ),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: "${_endTime.hour}:${_endTime.minute}",
                hintStyle: subTitleStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Get.isDarkMode ? Colors.white : darkPrimaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: lightPrimaryColor,
                    width: 2,
                  ),
                ),
              ),
              onTap: () async {
                TimeOfDay? timePicker = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial);
                if (timePicker != null) {
                  _endTime = timePicker;
                  debugPrint("End Time : ${_endTime.hour}:${_endTime.minute}");
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  _validateData();
                  // _showNotifications();
                },
                child: Text(
                  "Create",
                  style: subHeadingStyle,
                ))
          ],
        ),
      ),
    );
  }

  _validateData() {
    if (_title.text.isNotEmpty && _notes.text.isNotEmpty) {
      _addTaskToDo();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } else {
      debugPrint("############Something wrong happened############");
    }
  }

  _addTaskToDo() async {
    try {
      int value = await _taskController.addTask(
        task: Task(
          title: _title.text.toString(),
          notes: _notes.text.toString(),
          // date: DateFormat.yMd().format(_date),
          // startTime : DateFormat.jms().format(_startTime as DateTime),
          // endTime : DateFormat.jms().format(_endTime as DateTime),
        ),
      );
      print("Value: $value");
    } catch (e) {
      if (kDebugMode) {
        print("not clear addtodo");
      }
    }
  }
//
//   _showNotifications() {
//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails("Task-Notifications", "Task-Notifications",
//             priority: Priority.max, importance: Importance.max);
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails
//     );
//     flutterLocalNotificationsPlugin.show(0, "Task is Added", "This is body", notificationDetails);
//   }
}
