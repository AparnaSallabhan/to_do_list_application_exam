import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreenController with ChangeNotifier {
  var taskCollection = FirebaseFirestore.instance.collection("to do list");

  Future<void> addTask({required String title, bool status = false}) async {
    try {
      final task = {"title": title, "status": status};
      await taskCollection.add(task);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTask(var id) async {
    await taskCollection.doc(id).delete();
  }

  Future<void> isCompleted(var id, bool value,String title) async {
    final newStatus = {
      "title":title,
      "status": value};
    await taskCollection.doc(id).set(newStatus);
  }
}
