import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/manger/provider.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/theme/app_theme.dart';

import '../../widgets/custom_card_task.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider()..getUser(),
      child: Consumer<MainProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Stack(
                alignment: Alignment(0, 2.5),
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "hi".tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text("${provider.user?.name.toUpperCase()??""}",style:Theme.of(context).textTheme.titleMedium,)
                        ],
                      ),
                    ),
                  ),
                  EasyInfiniteDateTimeLine(
                      firstDate: FirebaseAuth.instance.currentUser!.metadata.creationTime!,
                      lastDate: DateTime.now().add(Duration(days: 365)),
                      focusDate: provider.selectedDate,
                      showTimelineHeader: false,
                      onDateChange: provider.setDate,
                      dayProps: EasyDayProps(
                          todayHighlightStyle: TodayHighlightStyle.withBorder,
                          todayHighlightColor: Colors.black,
                          dayStructure: DayStructure.dayStrDayNum,
                          activeDayStyle: DayStyle(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          inactiveDayStyle: DayStyle(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20))))),
                ],
              ),
              SizedBox(height: 100),
              StreamBuilder(stream: provider.getTask(), builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return  Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasError){
                  return const Text("Task has Error");
                }
                else{
                  List<TaskModel> tasks = snapshot.data!.docs.map((e) => e.data()).toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                      return CustomCardTask(taskModel: tasks[index]);
                    },),
                  );
                }
              },)
            ],
          );
        },
      ),
    );
  }
}


