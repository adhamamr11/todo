import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manger/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "addNewTask".tr(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextField(
                controller: provider.titleTextController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    hintText: "title".tr(), hintStyle: TextStyle(fontSize: 18)),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: provider.descTextController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    hintText: "desc".tr(), hintStyle: TextStyle(fontSize: 18)),
              ),
              SizedBox(
                height: 15,
              ),
              Text("selectDate".tr()),
              SizedBox(
                height: 15,
              ),
              InkWell(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: provider.selectedDatePiker,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)))
                        .then((value) {
                      provider.setDatePiker(value!);
                    });
                  },
                  child: Text(
                      provider.selectedDatePiker.toString().substring(0, 10))),
              SizedBox(
                height: 15,
              ),
              Text("selectTime".tr()),
              SizedBox(
                height: 15,
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
                  child: Text(
                      "${provider.selectedTimePiker.hour} : ${provider.selectedTimePiker.minute}")),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    provider.addTask();
                    Navigator.pop(context);
                  },
                  child: Text("addTask".tr(),))
            ],
          ),
        );
      },
    );
  }
}
