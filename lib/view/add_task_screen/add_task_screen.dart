// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_application_exam/controller/home_screen_controller.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Add Task",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "Enter your Task",
                  hintStyle: TextStyle(color: Colors.black,fontSize: 18)
                  ),
              maxLines: 2,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  context
                      .read<HomeScreenController>()
                      .addTask(title: taskController.text);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Save Task",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black),
                    )))
          ],
        ),
      ),
    );
  }
}
