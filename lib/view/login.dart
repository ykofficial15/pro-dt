import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodt/controller/news_controller.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late String semail, spassword;
final NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 50, 15, 0),
                          child: Column(
                            children: [
                              const Text(
                                'Log in',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text(
                                'Stay updated',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              const Text(
                                'with daily incidents 24x7 by news pro',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 44.0,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(color: Colors.black),
                                labelText: "Email",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(),
                                     errorBorder: OutlineInputBorder(),
                                labelStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.mail, color: Colors.blue),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.endsWith('@gmail.com')) {
                                  return 'Please enter a valid Gmail address';
                                }
                                return null;
                              },
                              onSaved: (value) => semail = value!,
                            ),
                            const SizedBox(
                              height: 26.0,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: "Enter your password",
                                hintStyle: TextStyle(color: Colors.black),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.black),
                                      focusedErrorBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock_person_rounded,
                                    color: Colors.blue),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                              onSaved: (value) => spassword = value!,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 70.0,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        width: double.infinity,
                        child: RawMaterialButton(
                          fillColor: Colors.blue,
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          onPressed: () {
                            _submitForm();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2.5,
              top:MediaQuery.of(context).size.height * 0.15,
              child: Image.asset('assets/logo.png', height: 70, width: 70),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      if (semail == 'admin@gmail.com' && spassword == '123456') {
        controller.fetchNews('national');
       Get.to(Home());
      } else {
      Get.snackbar('Error', 'Invalid credentials');
      }
    }
  }
}
