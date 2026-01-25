import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c17/firebase_utils/firestore_utility.dart';
import 'package:evently_c17/ui/model/user_dm.dart';
import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_dialogs.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/evently_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_routes.dart';
import '../../utils/constants.dart';
import '../../widgets/app_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppAssets.appLogo),
                  SizedBox(height: 48),
                  Text(
                    "Create your account",
                    style: AppTextStyles.blue24SemiBold,
                  ),
                  SizedBox(height: 24),
                  AppTextField(
                    hint: "Enter your name",
                    prefixIcon: SvgPicture.asset(AppAssets.icPersonSvg),
                    controller: nameController,
                    validator: (text) {
                      if (text?.isEmpty == true) return "Please valid name";
                      return null;
                    },
                  ),
                  AppTextField(
                    hint: "Address",
                    prefixIcon: SvgPicture.asset(AppAssets.icPersonSvg),
                    controller: addressController,
                    validator: (text) {
                      if (text?.isEmpty == true) return "Please valid address";
                      return null;
                    },
                  ),
                  AppTextField(
                    hint: "phone number",
                    prefixIcon: SvgPicture.asset(AppAssets.icPersonSvg),
                    controller: phoneController,
                    validator: (text) {
                      if (text?.isEmpty == true || text!.length < 11)
                        return "Please valid phone number";
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    hint: "Enter your email",
                    prefixIcon: SvgPicture.asset(AppAssets.icEmailSvg),
                    controller: emailController,
                    validator: (text) {
                      if (text?.isEmpty == true) return "Please valid email";
                      var isValid = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(text!);
                      if(!isValid) return "this email is in invalid form";
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    hint: "Enter your password",
                    suffixIcon: SvgPicture.asset(AppAssets.icEyeClosedSvg),
                    prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.isEmpty == true)
                        return "Please enter valid password";
                      if (text.length < 6) {
                        return "Your password is weak";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    hint: "Confirm your password",
                    suffixIcon: SvgPicture.asset(AppAssets.icEyeClosedSvg),
                    prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
                    validator: (text) {
                      if (text == null || text.isEmpty == true)
                        return "Please enter valid password";
                      if (text != passwordController.text)
                        return "Password does not match";
                      return null;
                    },
                  ),
                  SizedBox(height: 48),
                  buildRegisterButton(),
                  SizedBox(height: 48),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: AppTextStyles.grey14Regular,
                        ),
                        Text(
                          "Login",
                          style: AppTextStyles.blue14SemiBold.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Or",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.blue14SemiBold,
                  ),
                  SizedBox(height: 32),
                  buildGoogleSignInButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  EventlyButton buildRegisterButton() => EventlyButton(
    text: "Register",
    onPress: () async {
      if (!formKey.currentState!.validate()) return;
      try {
        showLoading(context);
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text, //access text inside textfield
              password: passwordController.text,
            );

        UserDM.currentUser = UserDM(
          id: credential.user!.uid,
          name: nameController.text,
          email: emailController.text,
          address: addressController.text,
          phoneNumber: phoneController.text,
        );

        createUserInFirestore(UserDM.currentUser!);

        Navigator.pop(context);

        ///Hide loading
        Navigator.push(context, AppRoutes.navigation);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        var message = "";
        if (e.code == 'weak-password') {
          message = "The password provided is too weak.";
        } else if (e.code == 'email-already-in-use') {
          message = "The account already exists for that email.";
        } else {
          message = e.message ?? AppConstants.defaultErrorMessage;
        }
        showMessage(context, message, title: "Error", posText: "ok");
      } catch (e) {
        showMessage(
          context,
          AppConstants.defaultErrorMessage,
          title: "Error",
          posText: "ok",
        );
      }
    },
  );

  EventlyButton buildGoogleSignInButton() {
    return EventlyButton(
      text: "Sign up with Google",
      onPress: () async {
        //Todo: Implement google sign in
      },
      backgroundColor: AppColors.white,
      textStyle: AppTextStyles.blue18Medium,
      icon: Icon(Icons.g_mobiledata),
    );
  }
}
