import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:idcard_maker_frontend/home.dart';
import 'package:idcard_maker_frontend/pages/add_id_card.dart';
import 'package:idcard_maker_frontend/services/remote_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RemoteServices _remoteServices = RemoteServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double cwidth = MediaQuery.of(context).size.width;
    double cheight = MediaQuery.of(context).size.height;
    return ScaffoldPage(
      content: Stack(
        children: [
          SizedBox(
            width: cwidth,
            height: cheight,
            child: Image.network(
              "https://images.unsplash.com/flagged/photo-1574097656146-0b43b7660cb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWFuJTIwc2Nob29sc3xlbnwwfHwwfHw%3D&w=1000&q=80",
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            // Clip it cleanly.
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                alignment: Alignment.center,
                child: Center(
                  child: new ClipRect(
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: new Container(
                        width: 500.0,
                        height: 300.0,
                        decoration: new BoxDecoration(
                            color: Colors.white.withOpacity(0.2)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Super Admin Login',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextBox(
                                  placeholder: 'Email',
                                  controller: _emailController,
                                ),
                                TextBox(
                                  placeholder: 'Password',
                                  obscureText: true,
                                  controller: _passwordController,
                                ),
                                Button(
                                  child: Text("Log In"),
                                  onPressed: () {
                                    try {
                                      _remoteServices.superAdminLogin(
                                        _emailController.text,
                                        _passwordController.text,
                                      );
                                      Navigator.push(
                                        context,
                                        FluentPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    } catch (e) {
                                      print(e);
                                    }

                                    // material.Navigator.push(
                                    //     context,
                                    //     FluentPageRoute(
                                    //         builder: (context) =>
                                    //             AddIdCardPage()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
