import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_form_text_failed.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/snackbar.dart';
import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email;

  String? password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ListView(
        children: [
          SizedBox(
            height: 300,
            width: 600,
            child: AppImages.productItem,
          ),
          const Gap(20),
          Text(
            'Welcome!',
            style: AppStyles.styleBold18.copyWith(fontSize: 22),
          ),
          const Gap(5),
          Text(
            'please login or sign up to continue our app',
            style: AppStyles.styleSemiBold11.copyWith(fontSize: 14),
          ),
          const Gap(50),
          CustomFormTextField(
              onChange: (data) {
                email = data;
              },
              labelText: 'Email',
              hintText: 'Enter youe email address'),
          const SizedBox(
            height: 20,
          ),
          CustomFormTextField(
            obscureText: true,
            onChange: (data) {
              password = data;
            },
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
          const Gap(20),
          CustomButton(
              text: 'Login',
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email!, password: password!);
                  setState(() {
                    showAuthSnackbar(context, 'Logined Sucssfully', true);
                  });
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'invalid-email') {
                    setState(() {
                      showAuthSnackbar(
                          context, 'No user found for that email', false);
                    });
                  } else if (e.code == 'invalid-credential') {
                    setState(() {
                      showAuthSnackbar(context,
                          'Wrong password provided for that user', false);
                    });
                  } else {
                    setState(() {
                      showAuthSnackbar(context,
                          'somthing went wrong please tryagin later', false);
                    });
                  }
                }
              }),
          const Gap(10),
          const Center(
            child: Text(
              'Don\'t have an account ?',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          const Gap(5),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(kRegisterView);
            },
            child: const Center(
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
