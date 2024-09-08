import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/manger/auth_provider.dart';
import 'package:todo/ui/login/login_screen.dart';

class CreateAccScreen extends StatelessWidget {
  CreateAccScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey();

  static const String routeName = "CreateAccScreen";
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Container(
        decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            image: DecorationImage(
                image: AssetImage("assets/logo/Rectangle 1.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.contain)),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Text(
                        "Create Account",
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: provider.nameController,
                        style: theme.textTheme.bodyMedium,
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "Invalid Name";
                          }
                          else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: theme.textTheme.bodyMedium,
                            labelText: "Name",
                            labelStyle: theme.textTheme.bodyMedium,
                            errorStyle: theme.textTheme.displaySmall,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: provider.phoneController,
                        style: theme.textTheme.bodyMedium,
                        validator:  (value) {
                          if(value == null || value.trim().isEmpty || value.length < 11){
                            return "Invalid Phone";
                          }
                          else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Phone",
                            hintStyle: theme.textTheme.bodyMedium,
                            labelText: "Phone",
                            labelStyle: theme.textTheme.bodyMedium,
                            errorStyle: theme.textTheme.displaySmall,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: provider.emailController,
                        style: theme.textTheme.bodyMedium,
                        validator:  (value) {
                          if(value == null || value.trim().isEmpty){
                            return "Invalid Email";
                          }
                          else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)){
                            return "Email is not correct";
                          }
                          else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: theme.textTheme.bodyMedium,
                            labelText: "Email",
                            labelStyle: theme.textTheme.bodyMedium,
                            errorStyle: theme.textTheme.displaySmall,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: provider.passwordController,
                        obscureText: provider.isSecure,
                        style: theme.textTheme.bodyMedium,
                        validator:  (value) {
                          if(value == null || value.trim().isEmpty){
                            return "Invalid Password";
                          }
                          else if(value.length < 6){
                            return "Password must be more than 6 characters";
                          }
                          else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  provider.changeSecure();
                                },
                                icon: Icon(provider.isSecure
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            hintText: "Password",
                            hintStyle: theme.textTheme.bodyMedium,
                            labelText: "Password",
                            labelStyle: theme.textTheme.bodyMedium,
                            errorStyle: theme.textTheme.displaySmall,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if(formKey.currentState!.validate()) {
                            provider.createAccount(context);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Create Account",style: theme.textTheme.bodySmall,),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                          },
                          child: Text("You Have Account..?Login"))
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
