import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/app_textfield.dart';
import 'package:evently_c17/ui/widgets/evently_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.appLogo),
              Text("Create your account", style: AppTextStyles.blue24SemiBold),
              SizedBox(height: 16),
              AppTextField(
                hint: "Enter your name",
                prefixIcon: SvgPicture.asset(AppAssets.icPersonSvg),
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: "Enter your email",
                prefixIcon: SvgPicture.asset(AppAssets.icEmailSvg),
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: "Enter your password",
                prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
                isPassword: true,
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: "Confirm your password",
                prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
                isPassword: true,
              ),
              SizedBox(height: 48),
              EventlyButton(text: "Register", onPress: () {}),
              SizedBox(height: 48),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: AppTextStyles.grey14Regular,
                      ),
                      TextSpan(
                        text: "Sign in",
                        style: AppTextStyles.blue14SemiBold.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Or",
                style: AppTextStyles.blue14SemiBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              EventlyButton(
                text: "Login with google",
                onPress: () {},
                backgroundColor: AppColors.white,
                icon: Icon(Icons.mail, color: AppColors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
