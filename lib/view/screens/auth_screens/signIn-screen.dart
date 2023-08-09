import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/base/loginBtn_widget.dart';
import 'package:design/view/screens/auth_screens/register_screen.dart';
import 'package:design/view/screens/auth_screens/widget/auth_Textfield.dart';
import 'package:design/view/screens/auth_screens/widget/btn_widget.dart';
import 'package:design/view/screens/auth_screens/widget/forgotPassword_widget.dart';
import 'package:design/view/screens/main_screens/explore_screen/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // final AuthController authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool obsureText = true;
  bool emailVal = false;
  bool passwordVal = false;
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: s.height * 0.1),
                    Text(
                      'Sign In',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 34, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: s.height * 0.05),
                    AuthTxtField(
                      controller: emailController,
                      validatorTxt: 'Please enter email',
                      labelText: 'Email',
                      onchange: (value) {
                        emailVal = value.length >= 5;
                      },
                    ),
                    SizedBox(
                      height: s.height * 0.02,
                    ),
                    AuthTxtField(
                      controller: passwordController,
                      validatorTxt: 'Please enter Password',
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsureText = !obsureText;
                          });
                        },
                        icon: Icon(
                          obsureText ? Icons.visibility_off : Icons.visibility,
                          color:
                              obsureText ? Colors.black : ColorsOfApp.appColor,
                        ),
                      ),
                      onchange: (value) {
                        passwordVal = value.length >= 6;
                      },
                      obscureText: obsureText,
                    ),
                    SizedBox(
                      height: s.height * 0.02,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: s.width * 0.01,
                  ),
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                        side: const BorderSide(
                            color: ColorsOfApp.textFieldgreyColor),
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        value: checkBoxValue,
                        onChanged: (value) {
                          setState(() {
                            checkBoxValue = !checkBoxValue;
                          });
                        }),
                  ),
                  Text(
                    'Remember me',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.bottomSheet(ForgotPasswordWidget());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorsOfApp.appColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.01,
                  )
                ],
              ),
              SizedBox(
                height: s.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ButtonWidget(
                      buttonTxt: 'Sign In',
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          if (emailVal || passwordVal == true) {
                            Get.to(LandiBottomNavigationngPage());
                          }
                        }
                      },
                      buttonColor: (emailVal && passwordVal)
                          ? ColorsOfApp.appColor
                          : ColorsOfApp.textFieldgreyColor,
                    ),
                    SizedBox(
                      height: s.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'By Clicking "Sign in" You certify that agree to our',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                    // color: Colors.black,
                                    fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\nPrivacy policy',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: ColorsOfApp.appColor,
                                        fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(),
                              ),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: ColorsOfApp.appColor,
                                        fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: s.height * 0.04,
                    ),
                    Center(
                      child: Text(
                        'Or, Sign in with',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsOfApp.blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: s.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        BtnWidget(
                          img: Images.appleIcon,
                          btnText: 'Apple',
                          btnColor: ColorsOfApp.blackColor,
                        ),
                        BtnWidget(
                            img: Images.facebookIcon,
                            btnText: 'Facebook',
                            btnColor: ColorsOfApp.facebookIconColor),
                      ],
                    ),
                    SizedBox(
                      height: s.height * 0.05,
                    ),
                    LoginBtn(
                        firstText: 'New user?',
                        secondText: ' Register',
                        ontap: () {
                          Get.to(RegisterScreen());
                        }),
                    SizedBox(
                      height: s.height * 0.04,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
