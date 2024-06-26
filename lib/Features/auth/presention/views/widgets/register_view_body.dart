import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_form_text_failed.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/snackbar.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({
    super.key,
  });

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String? email;
  String? password;
  String? username;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Form(
        key: formkey,
        child: ListView(
          children: [
            SizedBox(
              height: 300,
              width: 600,
              child: AppImages.logoImage,
            ),
            const Gap(20),
            Text(
              'Sign Up!',
              style: AppStyles.styleBold18.copyWith(fontSize: 22),
            ),
            const Gap(5),
            Text(
              'Create an new account',
              style: AppStyles.styleSemiBold11.copyWith(fontSize: 14),
            ),
            const Gap(20),
            CustomFormTextField(
                onChange: (data) {
                  email = data;
                },
                labelText: 'Email',
                hintText: 'Enter your email address'),
            const SizedBox(
              height: 20,
            ),
            CustomFormTextField(
                onChange: (data) {
                  username = data;
                },
                labelText: 'Username',
                hintText: 'Enter your username'),
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
              text: 'Sign up',
              onTap: () async {
                if (formkey.currentState!.validate()) {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email!, password: password!);

                    await userCredential.user!
                        .updateProfile(displayName: username);

                    await userCredential.user!.reload();
                    User? updatedUser = FirebaseAuth.instance.currentUser;

                    if (updatedUser != null) {
                      username = updatedUser.displayName;
                      setState(() {
                        showAuthSnackbar(
                            context, 'Signed Up Successfully', true);
                      });
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      setState(() {
                        showAuthSnackbar(context,
                            'The password provided is too weak', false);
                      });
                    } else if (e.code == 'email-already-in-use') {
                      setState(() {
                        showAuthSnackbar(
                            context, 'The email is already in use', false);
                      });
                    } else {
                      setState(() {
                        showAuthSnackbar(context,
                            'Something went wrong. Please try again', false);
                      });
                    }
                  }
                }
              },
            ),
            const Gap(10),
            const Center(
              child: Text(
                'If you already have an account',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            const Gap(5),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
