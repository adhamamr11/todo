import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/manger/auth_provider.dart';
import 'package:todo/manger/provider.dart';

class SettingsScreen extends StatefulWidget {

  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> locals = ["Arabic".tr(), "English".tr()];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder:  (context, provider, child) {
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
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("language".tr(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Theme.of(context).primaryColor,width: 2,)
                  ),
                  child: DropdownButton<String>(
                      value: provider.selectedLocal.tr(),style: Theme.of(context).textTheme.titleSmall,
                      isExpanded: true,
                      items: locals.map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e))).toList(),
                      onChanged: (value){
                        provider.changeLocal(value!);
                        if(provider.selectedLocal== "Arabic")
                          context.setLocale(Locale("ar"));
                        else{
                          context.setLocale(Locale("en"));
                        }
                        setState(() {

                        });
                      }),
                )


              ],
            ),
          ),
        ]
        );
      },
    );
  }
}
