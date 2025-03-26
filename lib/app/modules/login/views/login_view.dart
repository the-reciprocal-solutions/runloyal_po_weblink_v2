import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:runloyal_weblink_v2/app/modules/login/controllers/login_controller.dart';
import 'package:runloyal_weblink_v2/app/style/app_colors.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 480,
              minWidth: 320,
            ),
            child: GetBuilder<LoginController>(builder: (context) {
              return Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email/phone',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          isDense: false,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: greyColor)),
                        ),
                        textCapitalization: TextCapitalization.none,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r"\s\b|\b\s")),
                        ],
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock_outline),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          isDense: false,
                          suffixIcon: IconButton(
                            icon: Icon(
                                isShowPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: primaryColor),
                            onPressed: () {
                              isShowPassword = !isShowPassword;
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        obscureText: isShowPassword,
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // onTapTxtForgotPassword();
                          },
                          child: Text('Forgot Password?'),
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          // onTapLoginOne();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 56),
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          //Get.to(LoginUsingInviteCode());
                        },
                        child: Text(
                          'Login with Invite Code',
                          style: TextStyle(color: Colors.blue.shade900),
                        ),
                      ),
                      SizedBox(height: 24),
                      /* Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              // onTapTxtSignUp();
                            },
                            child: Text('Sign Up'),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                          Expanded(child: Divider()),
                                      Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text('OR'),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: 24),
                      OutlinedButton.icon(
                        onPressed: () {
                          //onTapRowgoogle();
                        },
                        icon: Image.network(
                          'https://www.google.com/favicon.ico',
                          height: 20,
                        ),
                        label: Text('Sign in with Google'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
/*
  onTapTxtForgotPassword() {
    Get.toNamed(
      AppRoutes.resetPasswordEmailTabContainerScreen,
    );
  }

  onTapLoginOne() async {
    await controller.onLogin();
  }

  onTapTxtSignUp() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }

  onTapRowgoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
        controller.currentGoogleAccount = googleUser;
        var accessToken = "";
        googleUser.authentication.then((value) {
          logInfo("${value.accessToken}");
          accessToken = value.idToken ?? "";
          logInfo("ID TOKEN ${value.idToken}");
          controller.onGoogleLogin(value.idToken);
        });
        log("GOOGLE SUCCESS ${googleUser} ${googleUser.id} ${googleUser.email} ${googleUser.photoUrl}");
      } else {
        logInfo("ERROR GOOGLE SIGNIN DATA IS EMPTY");

        Fluttertoast.showToast(
            msg: "Please select a google account to proceed");
      }
    }).catchError((onError) {
      logInfo("ERROR GOOGLE SIGNIN ${onError.toString()}");

      Get.snackbar('Error', onError.toString());
    });
  }*/
}
