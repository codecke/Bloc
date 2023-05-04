// ignore_for_file: sized_box_for_whitespace, unnecessary_brace_in_string_interps, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    elevation: 0,
    title: Center(
      child: Text(
        "Log In",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 20.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    backgroundColor: Colors.white,
  );
}

// We need context for accessing blocs
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons("google"),
          _reusableIcons("apple"),
          _reusableIcons("facebook"),
        ],
      ),
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.w,
      child: Image.asset(
        "assets/icons/$iconName.png",
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.7),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField(
  String hintText,
  String textType,
  String iconName,
  void Function(String value)? func
) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.primaryFourthElementText),
    ),
    child: Row(
      children: [
        Container(
          width: 18.w,
          height: 18.h,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        Container(
          width: 260.w,
          height: 50.h,
          child: TextField(
            onChanged: (value)=> func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgetPassword(String text) {
  return Container(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.sp,
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: buttonType == "Login" ? 40.h : 20.h,
      ),
      padding: EdgeInsets.all(15),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color:
              buttonType == "Login" ? AppColors.primaryElement : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: buttonType == "Register"
                ? AppColors.primaryFourthElementText
                : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
              color: Colors.grey.withOpacity(0.1),
            ),
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: buttonType == "Login" ? Colors.white : AppColors.primaryText,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
