import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/manger/provider.dart';
import 'package:todo/models/task_model.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  static const routeName = "edit";

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return ChangeNotifierProvider(
        create: (context) => MainProvider()..getUser(),
        child: Consumer<MainProvider>(builder: (context, provider, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text("To Do List"),
              elevation: 0,
            ),
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  color: Colors.blue,
                ),
                Card(
                  color: Colors.white,
                  elevation: 24,
                  margin: EdgeInsets.only(
                      top: 50, right: 20, left: 20, bottom: 100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Form(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "editTask",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        TextField(
                          controller: provider.titleTextController,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                              hintText: arg.title, hintStyle: TextStyle(fontSize: 18)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: provider.descTextController,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                              hintText: arg.desc, hintStyle: TextStyle(fontSize: 18)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("selectTime".tr(),style:Theme.of(context).textTheme.titleSmall,),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: provider.selectedTimePiker)
                                  .then((value) {
                                provider.setTime(value!);
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  arg.time,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            )),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "saveChanges",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  )),
                )
              ],
            ),
          );
        }));
  }
}
