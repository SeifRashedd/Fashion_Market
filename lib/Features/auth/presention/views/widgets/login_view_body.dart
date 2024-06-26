import 'package:fashion_market/Features/auth/presention/manger/login/login_cubit.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_form_text_failed.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/snackbar.dart';
import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email;
  String? password;
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is LoginSuccess) {
          showAuthSnackbar(context, 'Logged in Successfully', true);
        } else if (state is LoginFailure) {
          showAuthSnackbar(context, state.errMessage, false);
          setState(() {
            isLoading = false;
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 300,
                    width: 600,
                    child: AppImages.logoImage,
                  ),
                  const Gap(20),
                  Text(
                    'Welcome!',
                    style: AppStyles.styleBold18.copyWith(fontSize: 22),
                  ),
                  const Gap(5),
                  Text(
                    'Please login or sign up to continue our app',
                    style: AppStyles.styleSemiBold11.copyWith(fontSize: 14),
                  ),
                  const Gap(50),
                  CustomFormTextField(
                    onChange: (data) {
                      email = data;
                    },
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                  ),
                  const SizedBox(height: 20),
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
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).loginUser(
                          email: email!,
                          password: password!,
                        );
                      }
                    },
                  ),
                  const Gap(10),
                  const Center(
                    child: Text(
                      'Don\'t have an account?',
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
            ),
          ),
        );
      },
    );
  }
}
