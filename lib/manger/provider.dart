
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';
import 'package:todo/service/firebase_functions.dart';
import 'package:todo/ui/settings/settings_screen.dart';
import 'package:todo/ui/tasks/edit_task_screen.dart';
import 'package:todo/ui/tasks/tasks_screen.dart';

import '../ui/login/login_screen.dart';

class MainProvider extends ChangeNotifier{

  int selectedIndex = 0;
  List<Widget> screens = [
    TasksScreen(),SettingsScreen(),EditTaskScreen()
  ];
  DateTime selectedDate = DateTime.now();
  DateTime selectedDatePiker = DateTime.now();
  TimeOfDay selectedTimePiker = TimeOfDay.now();

  TextEditingController titleTextController = TextEditingController();
  TextEditingController descTextController = TextEditingController();

  UserModel? user;

  String selectedLocal = "English";

  void setSelectedIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }

  void setDate(DateTime dayDate){
    selectedDate = dayDate;
    notifyListeners();
  }

  void setDatePiker(DateTime dayDate) {
    selectedDatePiker = dayDate;

  }


  void addTask()async{
    TaskModel taskModel = TaskModel(
        title: titleTextController.text,
        desc: descTextController.text,
        date: DateUtils.dateOnly(selectedDatePiker).millisecondsSinceEpoch,
        time: "${selectedTimePiker.hour} : ${selectedTimePiker.minute}",
        isDone: false
    );
    await FirebaseFunctions.addTask(taskModel);
    titleTextController.clear();
    descTextController.clear();

  }

  Stream<QuerySnapshot<TaskModel>> getTask(){
    return FirebaseFunctions.getTask(selectedDate);
  }


  void deleteTask(String id){
    FirebaseFunctions.deleteTask(id);
    notifyListeners();
  }


  void setDone(TaskModel task){
    FirebaseFunctions.setDone(task);
    notifyListeners();
  }

  void setTime(TimeOfDay time){
    selectedTimePiker = time;
    notifyListeners();
  }

  void logoutAccount(BuildContext context){
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
  }

  getUser()async{
    user = await FirebaseFunctions.getUser();
    notifyListeners();
  }

  void changeLocal(String lang){
    if(selectedLocal == lang){
      return;
    }
    selectedLocal = lang;
    notifyListeners();
  }

}