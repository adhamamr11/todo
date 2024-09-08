import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/manger/auth_provider.dart';
import 'package:todo/ui/create_acc/create_acc_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = "LoginScreen";
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Container(
        decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            image: const DecorationImage(
                image: AssetImage("assets/logo/Rectangle 1.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.contain)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      "Login",
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: provider.emailController,
                      style: theme.textTheme.bodyMedium,
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: theme.textTheme.bodyMedium,
                          labelText: "Email",
                          labelStyle: theme.textTheme.bodyMedium,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.blue))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: provider.passwordController,
                      obscureText: provider.isSecure,
                      style: theme.textTheme.bodyMedium,
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.blue))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                   InkWell(
                     onTap: () {
                       provider.loginAccount(context);
                     },
                     child: Container(
                       padding: EdgeInsets.all(15),
                       decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.circular(15),
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Login",style: theme.textTheme.bodySmall,),
                           Icon(Icons.logout,color: Colors.white,)

                         ],
                       ),
                     ),
                   ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, CreateAccScreen.routeName);
                        },
                        child: const Text("Don't Have Account..?Create Account"))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
