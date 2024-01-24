
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/task_controller.dart';
import '../../models/task_model.dart';
import '../themes.dart';

class outputWidget extends StatefulWidget {
  outputWidget(this.data, {super.key});
  final Task data;

  @override
  State<outputWidget> createState() => _outputWidgetState();
}

class _outputWidgetState extends State<outputWidget> {
  final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                spreadRadius: 3,
                color: Colors.lightBlueAccent,
              )
            ],
            color: Colors.lightBlueAccent,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      widget.data.title.toString(),
                      style: titleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      widget.data.notes.toString(),
                      style: subTitleStyle,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20.0),
                  //   child: Text(
                  //     widget.data.date.toString(),
                  //     style: subTitleStyle,
                  //   ),
                  // ),
                ],
              ),
              IconButton(onPressed: (){
                print("!!!!!!!!!!!!!!!!!!!");
                _taskController.deleteTasks(widget.data.title.toString());
              }, icon: const Icon(Icons.check_box_outline_blank))
            ],
          ),
      ),
    );
  }
}
