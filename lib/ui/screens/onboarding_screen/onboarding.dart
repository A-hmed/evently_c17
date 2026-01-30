import 'package:evently_c17/model/onboarding_model.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../data/onboarding_data.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController();
  int currentIndex = 0;
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        //leadingWidth: 20,
        leading: currentIndex > 0
            ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6),),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),//2 ?
                    onPressed: () {
                      controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios_new, color: AppColors.blue),
                  ),
              ),
            )
            : SizedBox.shrink(), // 1
        backgroundColor: AppColors.offWhite,
        title: Center(child: Image.asset("assets/images/app_logo.png")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (route) => false,
                );
              },
              child: Text("Skip", style: AppTextStyles.blue14SemiBold),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    isLast = index == modelData.length - 1;
                  });
                },
                itemCount: modelData.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(modelData[index].image),
                          Center(
                            child: SmoothPageIndicator(
                              controller: controller,
                              effect: ExpandingDotsEffect(
                                dotWidth: 10,
                                dotColor: AppColors.grey,
                                activeDotColor: AppColors.blue,
                                dotHeight: 10,
                                spacing: 5,
                                expansionFactor: 3,
                              ),
                              count: modelData.length,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            modelData[index].title,
                            style: AppTextStyles.black20SemiBold,
                          ),
                          SizedBox(height: 10),
                          Text(
                            modelData[index].subTitle,
                            style: AppTextStyles.blue14Regular,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OnboardingButton(
                      text: isLast ? "Get Started" : "Next",
                      onPress: () {
                        if (isLast) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            AppRoutes.login,
                            (route) => false,
                          );
                          //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);
                        } else {
                          controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
