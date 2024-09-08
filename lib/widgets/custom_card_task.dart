import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/manger/provider.dart';
import 'package:todo/service/firebase_functions.dart';
import 'package:todo/ui/tasks/edit_task_screen.dart';

import '../models/task_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomCardTask extends StatelessWidget {
  TaskModel taskModel;
  CustomCardTask({
    required this.taskModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Slidable(
            key: const ValueKey("test"),
            startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {
                  provider.deleteTask(taskModel.id);
                }),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      provider.deleteTask(taskModel.id);
                    },
                    backgroundColor: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    icon: Icons.delete,
                    label: "delete".tr(),
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      Navigator.pushNamed(context, EditTaskScreen.routeName,arguments: taskModel);
                    },
                    backgroundColor: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    icon: Icons.edit,
                    label: "edit".tr(),
                  )
                ]),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  VerticalDivider(
                    thickness: 4,
                    color: taskModel.isDone ? Colors.green : Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.title,
                        style: taskModel.isDone
                            ? Theme.of(context).textTheme.bodyLarge
                            : Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(taskModel.desc),
                      Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.timelapse),
                          Text(taskModel.time),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      provider.setDone(taskModel);
                    },
                    child: taskModel.isDone
                        ? Text("done..!".tr(),
                            style: Theme.of(context).textTheme.bodyLarge)
                        : Container(
                            width: 70,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
