import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010A17),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 33),
              const Text(
                'SIGN UP',
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
            // height: MediaQuery.of(context).size.height, // Menggunakan tinggi layar
            // width: MediaQuery.of(context).size.width, // Menggunakan lebar layar
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
                    SizedBox(height: 15),
                    Row(children: [
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Email',
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
                          return 'Email tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        'Sudah Punya Akun?  ',
                        style: GoogleFonts.lato(),
                      ),
                      InkWell(
                        child: Text(
                          'Login',
                          style: GoogleFonts.lato(
                            color: Colors.lightBlue,
                            decorationColor: Colors.blue,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                      ),
                    ]),
                    SizedBox(height: 20),
                    Obx(
                      () => controller.loading.value
                          ? CircularProgressIndicator()
                          : Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.regist();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xffC81E1E),
                                        onPrimary: Colors.white),
                                    child: Text(
                                      'Sign Up',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 95,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // child: Form(
      //     key: controller.formKey,
      //     child: Column(
      //       children: [
      //         TextFormField(
      //           controller: controller.nama_lengkapController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan Nama",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "Nama tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           // obscureText: true,
      //           controller: controller.usernameController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan Username",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "Username tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           // obscureText: true,
      //           controller: controller.passwordController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan password",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "password tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           // obscureText: true,
      //           controller: controller.emailController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan email",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "email tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           // obscureText: true,
      //           controller: controller.alamatController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan alamat",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "alamat tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         Obx(() => controller.loading.value
      //             ? CircularProgressIndicator()
      //             : ElevatedButton(
      //                 onPressed: () {
      //                   controller.regist();
      //                 },
      //                 child: Text('Register'))),
      //       ],
      //     ))
    );
  }
}
