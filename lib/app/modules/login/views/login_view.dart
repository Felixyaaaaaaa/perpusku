import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _obscurePassword = true;
    // TextEditingController _usernameController = TextEditingController();
    // String? _usernameErrorText;

    return Scaffold(
      backgroundColor: Color(0xFF3010A17),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 33),
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Inter-bold',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/logo.png',
                  height: 131,
                ),
                SizedBox(height: 50),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      Row(children: [
                        Text(
                          'Username',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Username',
                          hintStyle: GoogleFonts.lato(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal:
                                  25.0), // Sesuaikan dengan kebutuhan Anda
                          // errorText: _usernameController.text.isEmpty ? 'Masukkan Username' : null,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      // _usernameErrorText != null
                      //     ? Text(
                      //   _usernameErrorText!,
                      //   style: TextStyle(color: Colors.red),
                      // )
                      //     : SizedBox(),
                      Row(children: [
                        Text(
                          'Password',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Password',
                          hintStyle: GoogleFonts.lato(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 25.0,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 50),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.login();
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffC81E1E),
                                onPrimary: Colors.white,
                              ),
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Atau',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.REGISTER),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffC81E1E),
                                onPrimary: Colors.white,
                              ),
                              child: Text('Sign Up',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 125),
                    ],
                  ),
                ),
              ),
            ),
            // Form(
            //     key: controller.formKey,
            //     child: Column(
            //       children: [
            //         TextFormField(
            //           controller: controller.usenameController,
            //           decoration: InputDecoration(
            //             hintText: "Masukan Username",
            //           ),
            //           validator: (value) {
            //             if (value!.length < 2) {
            //               return "username tidak boleh kosong";
            //             }
            //             return null;
            //           },
            //         ),
            //         TextFormField(
            //           // obscureText: true,
            //           controller: controller.passwordController,
            //           decoration: InputDecoration(
            //             hintText: "Masukan Password",
            //           ),
            //           validator: (value) {
            //             if (value!.length < 2) {
            //               return "password tidak boleh kosong";
            //             }
            //             return null;
            //           },
            //         ),
            //         Obx(() => controller.loading.value
            //             ? CircularProgressIndicator()
            //             : ElevatedButton(
            //             onPressed: () {
            //               controller.login();
            //             },
            //             child: Text('Login'))),
            //         ElevatedButton(
            //             onPressed: () => Get.toNamed(Routes.REGISTER),
            //             child: Text('Open Register')),
            //       ],
            //     )),
          ],
        ),
      ),
    );
  }
}

class p extends StatefulWidget {
  const p({super.key});

  @override
  State<p> createState() => _pState();
}

class _pState extends State<p> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
