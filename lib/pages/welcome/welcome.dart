// ignore_for_file: avoid_unnecessary_containers

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/main.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_state.dart';

import '../../common/values/colors.dart';
import 'bloc/welcome_events.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(
              top: 40.h,
            ),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      1,
                      context,
                      "Next",
                      "First See Learning",
                      "Forget about a for of paper all knowlwdge in one learning!",
                      "assets/images/reading.png",
                    ),
                    _page(
                      2,
                      context,
                      "Next",
                      "Connect With Everyone",
                      "Always keep in touch with your tutors and friend. Let's get connected!",
                      "assets/images/boy.png",
                    ),
                    _page(
                      3,
                      context,
                      "Get Started",
                      "Always Fascinated Learning",
                      "Anywhere anytime. The time is at your discretion to study whenever you want",
                      "assets/images/man.png",
                    ),
                  ],
                ),
                Positioned(
                  bottom: 60.h,
                  child: DotsIndicator(
                    position: state.page.toDouble(),
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      color: AppColors.primaryThirdElementText,
                      activeColor: AppColors.primaryElement,
                      size: const Size.square(8.0),
                      activeSize: const Size(15, 8),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String buttonName,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
          ),
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              // animation
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              // Move on to a new page
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("SignIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 80.h,
              left: 30.w,
              right: 30.w,
            ),
            width: 250.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
