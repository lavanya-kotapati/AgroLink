import 'package:flutter/material.dart';
import 'package:make_my_idea/Screens/login_page.dart';
import 'package:make_my_idea/constants/app_colors.dart';
import 'package:make_my_idea/constants/app_constants.dart';
import 'package:make_my_idea/constants/app_images.dart';
import 'package:make_my_idea/constants/text_Style_utility.dart';
import 'package:make_my_idea/global_responsive_functions.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reEnterPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          Expanded(
            child: Column(
              children: [
                Expanded(child: Container(color: AppColors.forestGreen)),
                Expanded(child: Container(color: AppColors.white)),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: buildHeight(context, 110)),
              Center(
                child: Image.asset(
                  AppImages.logo2,
                  height: buildHeight(context, 160),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome to ",
                        style: textStyleUtility().regular(
                          context,
                          75,
                          AppColors.white,
                        ),
                      ),
                      TextSpan(
                        text: AppConstants.appName,
                        style: textStyleUtility().bold(
                          context,
                          75,
                          AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: buildHeight(context, 62)),
              Container(
                height: buildHeight(context, 540),
                width: buildWidth(context, 1100),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: BoxBorder.all(color: AppColors.lightGray),
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mediumGray,
                      spreadRadius: 0.2,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: buildHeight(context, 15)),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.charcoal),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size: buildHeight(context, 22),
                        ),
                        labelText: AppConstants.enterNameText,
                        labelStyle: textStyleUtility().regular(
                          context,
                          55,
                          AppColors.charcoal,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: buildHeight(context, 25)),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.charcoal),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          size: buildHeight(context, 22),
                        ),
                        labelText: AppConstants.enterGmailText,
                        labelStyle: textStyleUtility().regular(
                          context,
                          55,
                          AppColors.charcoal,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: buildHeight(context, 25)),
                    // TextFormField(
                    //   controller: _passwordController,
                    //   decoration: InputDecoration(
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: AppColors.charcoal),
                    //     ),
                    //     prefixIcon: Icon(
                    //       Icons.password,
                    //       size: buildHeight(context, 22),
                    //     ),

                    //     labelText: AppConstants.enterPasswordText,
                    //     labelStyle: textStyleUtility().regular(
                    //       context,
                    //       55,
                    //       AppColors.charcoal,
                    //     ),
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscured, // 👈 hide text
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.charcoal),
                        ),

                        prefixIcon: Icon(
                          Icons.password,
                          size: buildHeight(context, 22),
                        ),

                        // 👇 Added suffix eye icon toggle
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.charcoal,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),

                        labelText: AppConstants.enterPasswordText,
                        labelStyle: textStyleUtility().regular(
                          context,
                          55,
                          AppColors.charcoal,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: buildHeight(context, 25)),

                    TextFormField(
                      controller: _reEnterPasswordController,
                      obscureText: true, // 👈 hide text
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.charcoal),
                        ),

                        prefixIcon: Icon(
                          Icons.password_outlined,
                          size: buildHeight(context, 22),
                        ),

                        labelText: AppConstants.reEnterPasswordText,
                        labelStyle: textStyleUtility().regular(
                          context,
                          55,
                          AppColors.charcoal,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: buildHeight(context, 30)),
                    SizedBox(
                      height: buildHeight(context, 50),
                      width: buildWidth(context, 490),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGreen,
                          shadowColor: AppColors.forestGreen,
                        ),
                        onPressed: () {},
                        child: Text(
                          "SIGN UP",
                          style: textStyleUtility().semiBold(
                            context,
                            49,
                            AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: buildHeight(context, 18)),
                    GestureDetector(
                      onTap: () {
                        // navigate to Login page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Continue to Login?  ",
                              style: textStyleUtility().regular(
                                context,
                                53,
                                AppColors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Login",
                              style: textStyleUtility().bold(
                                context,
                                53,
                                AppColors.darkGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
