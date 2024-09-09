import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/manger/auth_provider.dart';
import 'package:todo/manger/provider.dart';
import 'package:todo/theme/app_theme.dart';

import '../../manger/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> locals = ["Arabic", "English"];
  List<String> themes = ["Light", "Dark"];
  String selectedTheme = "Light";

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Column(children: [
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
                        "settings".tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "language".tr(),
                  style: TextStyle(color: themeProvider.isDarkModeEnable() ? Colors.white : AppTheme.darkThemeColor ,fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )),
                  child: DropdownButton<String>(
                      value: provider.selectedLocal,
                      style: Theme.of(context).textTheme.titleSmall,
                      isExpanded: true,
                      items: locals
                          .map<DropdownMenuItem<String>>(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        provider.changeLocal(value!);
                        if (provider.selectedLocal == "Arabic")
                          context.setLocale(Locale("ar"));
                        else {
                          context.setLocale(Locale("en"));
                        }
                        setState(() {});
                      }),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "mode".tr(),
                  style: TextStyle(color: themeProvider.isDarkModeEnable() ? Colors.white : AppTheme.darkThemeColor,fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )),
                  child: DropdownButton<String>(
                      value: selectedTheme,
                      style: Theme.of(context).textTheme.titleSmall,
                      isExpanded: true,
                      items: themes
                          .map<DropdownMenuItem<String>>(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        selectedTheme = value ?? "Light";
                        themeProvider.changeTheme(selectedTheme == "Light"
                            ? AppTheme.lightTheme
                            : AppTheme.darkTheme);
                        setState(() {});
                      }),
                )
              ],
            ),
          ),
        ]);
      },
    );
  }
}
