import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_form_text_failed.dart';
import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
            const Gap(50),
            CustomFormTextField(
                onChange: (data) {},
                labelText: 'Email',
                hintText: 'Enter youe email address'),
            const SizedBox(
              height: 20,
            ),
            CustomFormTextField(
              obscureText: true,
              onChange: (data) {},
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
            const Gap(20),
            CustomButton(
              text: 'Sign up',
              onTap: () {
                GoRouter.of(context).push(kHomeView);
              },
            ),
            const Gap(10),
            const Center(
              child: Text(
                'if you already have  account ',
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
