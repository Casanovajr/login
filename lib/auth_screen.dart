import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/constants.dart';
import 'package:login/widgets/login_form.dart';
import 'package:login/widgets/sign_up_form.dart';
import 'package:login/widgets/socal_buttons.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;

late AnimationController _animationController;
late Animation<double> _animationTextRotate;

void setUpAnimation() {
  AnimationController(vsync: this, duration: defaultDuration);


_animationTextRotate =
 Tween<double>(begin: 0, end: 90).animate(_animationTextRotate);
}


@override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Login
          AnimatedPositioned(
            duration: defaultDuration,
            width: _size.width * 0.88, // 88%
            height: _size.height,
            left: _isShowSignUp ? -_size.width * 0.76 : 0, // 76%
            child: GestureDetector(
              onTap: () {
                //Just for test we use it
                setState(() {
                  _isShowSignUp = !_isShowSignUp;
                });
              },
              child: Container(
              color: login_bg,
              child: const LoginForm(),
              ),
            ),
          ),

             //Sign Up
          AnimatedPositioned(
            duration: defaultDuration,
            height: _size.height,
            width: _size.width * 0.88,
            left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
            child: Container(
            color: signup_bg,
            child: const SignUpForm(),
            ),
          ),

          //Lets add the logo
          //As you can see our logo is not on center

          AnimatedPositioned(
            duration: defaultDuration,
            top: _size.height * 0.1, //10%
            left: 0,
            right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white60,
              child: _isShowSignUp
              ? SvgPicture.asset(
                "assets/animation_logo.svg",
                color: signup_bg,
              )
                : SvgPicture.asset(
                "assets/animation_logo.svg",
                color: login_bg,
                ),
            ),
          ),



            AnimatedPositioned(
              duration: defaultDuration,
            width: _size.width,
            bottom: _size.height * 0.1, //10%
            right: _isShowSignUp
            ? -_size.width * 0.06
            : _size.width * 0.06, // Now it's center
            child: const SocalButtns(),
          ),

          //Login Text
          AnimatedPositioned(
            duration: defaultDuration,
            bottom:
             _isShowSignUp ? _size.height / 2 : _size.height * 0.3, // 30%
            left: _size.width * 0.44 - 80, // 0.88/2 = 0.44
            //width of our text container is 160 so 160/2 = 80
            //0.88/2 = 0.44 (Width of our login is 88%)
            child: Container(
              //We need to know the width of this
              //so that we can animate it we want
              //At firts make the text on center
              width: 160,
              //color: Colors.red,
              //As you csn see the font size is also smaller when sign up show
              //We dont have AnimatedTextStyle
              //But
              child: AnimatedDefaultTextStyle(
              duration: defaultDuration,
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: _isShowSignUp ? 20 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              ),
              child: Transform.rotate(
                angle: -90 * pi / 180,
                child: Text(
                  "Log In".toUpperCase(),
                 ),
              ),
              ),
            ),
          )
        ],
      ),

    );
  }
}