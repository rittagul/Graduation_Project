import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:graduation_project/controllers/Auth/signup_controller.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/views/widget/auth/custombuttomauth.dart';
import 'package:graduation_project/views/widget/auth/customfaceandgoogleauth.dart';
import 'package:graduation_project/views/widget/auth/customtextformauth.dart';
import 'package:graduation_project/views/widget/auth/customtextsignuporlogin.dart';
import 'package:graduation_project/views/widget/auth/customtexttitleauth.dart';
import 'package:graduation_project/views/widget/auth/logoauth.dart';
import 'package:graduation_project/core/constant/imageLink.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    SignUpConrollerImp controller = Get.put(SignUpConrollerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            LogoAuth(),
            SizedBox(
              height: 20,
            ),
            CustomTextTitleAuth(text: "Sign Up"),
            SizedBox(
              height: 20,
            ),
            CustomTextFormAuth(
              iconData: Icons.person_outline,
              hinttext: 'User Name',
              assetname: imageLink.person_icon,
              mycontroller: controller.username,
            ),
            CustomTextFormAuth(
              iconData: Icons.email_outlined,
              hinttext: 'Email',
              assetname: imageLink.email_icon,
              mycontroller: controller.email,
            ),
            CustomTextFormAuth(
              iconData: Icons.lock_outline,
              hinttext: 'Password',
              assetname: imageLink.password_icon,
              mycontroller: controller.password,
            ),
            Transform.translate(
              offset: Offset(-30, -10),
              child: Row(
                children: [
                  Checkbox(
                    // checkColor: Colors.amber,
                    fillColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 238, 118, 118),
                    ),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text("I accept all the"),
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            CustomButtomAuth(text: "Sign up", onPressed: () {}),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: Divider(
                    color: Colors.black,
                    thickness: 1.2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text('OR'),
                ),
                SizedBox(
                  width: 120,
                  child: Divider(
                    color: Colors.black,
                    thickness: 1.2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFaceAndGoogleAuth(
                  onTap: () {},
                  iconData: Icon(
                    Icons.facebook_outlined,
                    size: 30,
                  ),
                  imageUrl: 'assets/images/facebookSvg.svg',
                ),
                SizedBox(
                  width: 40,
                ),
                CustomFaceAndGoogleAuth(
                  onTap: () {},
                  iconData: Icon(
                    FontAwesomeIcons.google,
                    size: 30,
                  ),
                  imageUrl: 'assets/images/googleSvg.svg',
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextSignUpOrLogIn(
                title: "Already have an account  ?  ",
                choiceText: "Log In ",
                onTap: () {
                  controller.goToLogin();
                }),
          ],
        ),
      ),
    );
  }
}
