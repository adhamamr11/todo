import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/manger/provider.dart';

import '../../widgets/add_task.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  static const String routeName = "Layout";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: Selector<MainProvider, int>(
        selector: (p0, p1) => p1.selectedIndex,
        builder: (context, selectedIndex, child) {
          var provider = Provider.of<MainProvider>(context, listen: false);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(360),
                    borderSide: BorderSide(color: Colors.white, width: 4)),
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    context: context,
                    builder: (context) {
                      return Container(
                        child: ChangeNotifierProvider.value(
                            value: provider,
                            child: AddTask()),
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.add,
                  size: 28,
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 8,
                color: Colors.white,
                child: BottomNavigationBar(
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  currentIndex: selectedIndex,
                  onTap: provider.setSelectedIndex,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  items:  [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        label: "tasks".tr()),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        label: "settings".tr()),
                  ],
                ),
              ),
            ),
            body: provider.screens[selectedIndex],
          );
        },
      ),
    );
  }
}


