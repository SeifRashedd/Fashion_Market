import 'package:fashion_market/Features/auth/presention/manger/register/register_cubit.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_form_text_failed.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/snackbar.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
       if (state is RegisterLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is RegisterSuccess) {
          showAuthSnackbar(context, 'Register Successfully', true);
        } else if (state is RegisterFailure) {
          showAuthSnackbar(context, state.errMessage  , false);
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
                         BlocProvider.of<RegisterCubit>(context).registerUser(
                          username: username!,
                          email: email!,
                          password: password!,
                        );
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
          ),
        );
      },
    );
  }
}
