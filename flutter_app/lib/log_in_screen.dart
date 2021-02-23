import 'package:flutter/material.dart';
import 'package:flutter_app/sign_up_screen.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 24
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                Column(
                  children: [
                    TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          } else if (value.length < 5) {
                            return 'Name should be greater than 5 characters';
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                            hintText: "Enter your username"
                        )
                    ),
                    TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                        decoration: new InputDecoration(
                            hintText: "Enter your password"
                        )
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if ((usernameController.text == "vidhi_jain") && (passwordController.text == "123456789")) {
                              print("user logged in");
                            } else {
                              print("invalid user credentials");
                            }
                          }
                        },
                        color: Colors.blue,
                        child: Text('Login', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    TextButton(
                      onPressed: () {

                      },
                      child: Text("Don't have an account?"),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen()),
                          );
                        },
                        color: Colors.blue,
                        child: Text('Sign Up', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}