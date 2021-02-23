import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
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
                  'Sign up',
                  style: TextStyle(
                      fontSize: 24
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    TextFormField(
                        controller: fullNameController,
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
                            hintText: "Enter your full name"
                        )
                    ),
                    TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          } else if (value.length != 10) {
                            return 'Phone number should be 10 digits only';
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                            hintText: "Enter your phone number"
                        )
                    ),
                    TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          } else if (value.length < 5) {
                            return 'Email should be greater than 5 characters';
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                            hintText: "Enter your email address"
                        )
                    ),
                    TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          } else if (value.length < 8) {
                            return 'Password should be greater than 8 characters';
                          } else if (value != confirmPasswordController.text) {
                            return 'Password and confirm password are not same';
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                            hintText: "Enter your password"
                        )
                    ),
                    TextFormField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          } else if (value.length < 8) {
                            return 'Password should be greater than 8 characters';
                          } else if (value != passwordController.text) {
                            return 'Password and confirm password are not same';
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                        decoration: new InputDecoration(
                            hintText: "Enter your Confirm Password"
                        )
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {

                          }
                        },
                        color: Colors.blue,
                        child: Text('Register', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    TextButton(
                      onPressed: () {

                      },
                      child: Text("Already have an account."),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.blue,
                        child: Text('Login', style: TextStyle(color: Colors.white),),
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