import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/task_controller.dart';
import '../../models/task_model.dart';
import '../themes.dart';
import '../widgets/outputWidget.dart';
import 'addTask.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _taskController.getTasks();
    //ThemeServices().switchTheme();
  }
  var data;
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: context.theme.backgroundColor,
      appBar: _customAppBar(),
      body: Column(
        children: [
          _addTaskBar(),
          // _addDateBar(),
          const SizedBox(
            height: 6,
          ),
          _showTasks(),
        ],
      ),
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            // ThemeServices().switchTheme();
            // setState(() {
            //   initState();
            // });
          },
          icon: Icon(
            Get.isDarkMode ? Icons.shield_moon_outlined : Icons.sunny,
            size: 24,
            color: Get.isDarkMode ? Colors.white : darkPrimaryColor,
          )),
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              _taskController.deleteAllTasks();
            },
            icon: Icon(
              Icons.delete_outline_rounded,
              color: Get.isDarkMode ? Colors.white : darkPrimaryColor,
            )),
        const CircleAvatar(
          child: Icon(Icons.person_outlined),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }

  _addTaskBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                DateFormat('yMd').format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: subHeadingStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const addTask()));
              },
              child: Text(
                "+ Add Task",
                style: subTitleStyle,
              ),

          ),
        )
      ],
    );
  }

  // _addDateBar(){
  //   return Container(
  //     margin: const EdgeInsets.only(left: 20,right: 10,top: 10),
  //     child: DatePicker(
  //       DateTime.now(),
  //       widget:80,
  //       height:100,
  //         initialSelectedDate:
  //     ),
  //   );
  // }

  _showTasks(){
    return Expanded(child: Obx(() {
      if(_taskController.taskList.isEmpty){
        return const Text("No Task to do");
      }else{
        return RefreshIndicator(onRefresh: _onRefresh, child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _taskController.taskList.length,
            itemBuilder: (BuildContext context,int index){
              data = _taskController.taskList[index];
              return outputWidget(data);
            }
        ));
      }
    }),
    );
  }
  Future<void> _onRefresh() async {
    _taskController.getTasks();
  }

}
