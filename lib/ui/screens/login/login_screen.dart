import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c17/firebase_utils/firestore_utility.dart';
import 'package:evently_c17/l10n/app_localizations.dart';
import 'package:evently_c17/ui/model/user_dm.dart';
import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_dialogs.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/app_textfield.dart';
import 'package:evently_c17/ui/widgets/evently_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.appLogo),
              SizedBox(height: 48),
              Text(
                localization.loginHeaderMessage,
                style: AppTextStyles.blue24SemiBold,
              ),
              SizedBox(height: 24),
              AppTextField(
                hint: localization.emailHint,
                prefixIcon: SvgPicture.asset(AppAssets.icEmailSvg),
                controller: emailController,
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: localization.passwordHint,
                suffixIcon: SvgPicture.asset(AppAssets.icEyeClosedSvg),
                prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
                isPassword: true,
                controller: passwordController,
              ),
              SizedBox(height: 8),
              Text(
                localization.forgetPassword,
                textAlign: TextAlign.end,
                style: AppTextStyles.blue14SemiBold.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 48),
              buildLoginButton(),
              SizedBox(height: 48),
              InkWell(
                onTap: () {
                  Navigator.push(context, AppRoutes.register);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      localization.dontHaveAccount,
                      style: AppTextStyles.grey14Regular,
                    ),
                    Text(
                      localization.signUp,
                      style: AppTextStyles.blue14SemiBold.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text(
                localization.or,
                textAlign: TextAlign.center,
                style: AppTextStyles.blue14SemiBold,
              ),
              SizedBox(height: 32),
              EventlyButton(
                text: localization.googleLogin,
                onPress: () {},
                backgroundColor: AppColors.white,
                textStyle: AppTextStyles.blue18Medium,
                icon: Icon(Icons.g_mobiledata),
              ),
            ],
          ),
        ),
      ),
    );
  }

  EventlyButton buildLoginButton() => EventlyButton(
    text: AppLocalizations.of(context)!.login,
    onPress: () async {
      try {
        showLoading(context);
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text, //access text inside textfield
              password: passwordController.text,
            );

        UserDM.currentUser = await getUserFromFirestore(credential.user!.uid);
        Navigator.pop(context);

        ///Hide loading
        Navigator.push(context, AppRoutes.navigation);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        var message = "";
        if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided for that user.';
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
}

// saveInFirestore(){
//   Person p = Person("ahmed", "01232132");
//   Map<String, dynamic> map = {
//     "name": p.name,
//     "phone_number": p.phoneNumber
//   };
// }
// getDataFromFirestore(){
//   Map<String, dynamic> map = {
//     "name": "ahmed",
//     "phone_number": "01232132"
//   };
//   Person p =Person.fromJson();
// }
//
// class Person{
//   String name;
//   String phoneNumber;
//   Person(this.name, this.phoneNumber);
//
//    Person.fromJson(Map json){}
//
//   Map toJson(){}
// }
