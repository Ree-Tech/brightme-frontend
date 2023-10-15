import 'package:bright_me/bloc/auth/auth_bloc.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';

import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/loading_wigdet.dart';
import 'package:bright_me/widget/snackbar.dart';
import 'package:bright_me/widget/tap_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

String pattern =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
RegExp regExp = RegExp(pattern);

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool isObscure = false;
  bool isCheck = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextController.dispose();
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.pushReplacementNamed(context, otpRoute,
                arguments: _emailTextController.text);
          } else if (state is RegisterEror) {
            showSnackBar(context, state.text);
          }
        },
        builder: (context, state) {
          if (state is RegisterLoading) {
            return const LoadingWidget();
          }
          return SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/register.jpg",
                      height: 245,
                      width: 245,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 25,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Register",
                          style: extraBold(
                            sizeFont: 24,
                          ),
                        ),
                      ),
                    ),

                    // email flied
                    TextFormField(
                      controller: _emailTextController,
                      validator:
                          ValidationBuilder().email('Wrong Email ').build(),
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: "Email",
                        hintStyle: medium(
                          sizeFont: 14,
                          colorFont: greyColor,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        prefixIcon: const Icon(
                          Icons.alternate_email,
                          color: greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    //username flied
                    TextFormField(
                      controller: _usernameTextController,
                      validator: ValidationBuilder().build(),
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: "Username",
                        hintStyle: medium(
                          sizeFont: 14,
                          colorFont: greyColor,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        prefixIcon: const Icon(
                          Icons.person_4_outlined,
                          color: greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),

                    // passowrd flied
                    TextFormField(
                      controller: _passwordTextController,
                      validator: ValidationBuilder()
                          .minLength(6, 'Wrong Password')
                          .regExp(regExp, "does not meet password requirements")
                          .build(),
                      obscureText: isObscure,
                      decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: greyColor,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: greyColor,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: "Password",
                          hintStyle: medium(
                            sizeFont: 14,
                            colorFont: greyColor,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: greyColor,
                          ),
                          suffixIcon: IconButton(
                              color: greyColor,
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: isObscure
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.visibility_outlined))),
                    ),

                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 3, bottom: 30, left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "At least 6 characters in your password",
                              textAlign: TextAlign.start,
                              style: medium(
                                sizeFont: 14,
                                colorFont: greyColor,
                              ),
                            ),
                            Text(
                              "At least one uppercase letter",
                              textAlign: TextAlign.start,
                              style: medium(
                                sizeFont: 14,
                                colorFont: greyColor,
                              ),
                            ),
                            Text(
                              "At least one lowercase letter in your password",
                              textAlign: TextAlign.start,
                              style: medium(
                                sizeFont: 14,
                                colorFont: greyColor,
                              ),
                            ),
                            Text(
                              "Add at least one number to your password",
                              textAlign: TextAlign.start,
                              style: medium(
                                sizeFont: 14,
                                colorFont: greyColor,
                              ),
                            ),
                            Text(
                              "At least one special character in your password",
                              textAlign: TextAlign.start,
                              style: medium(
                                sizeFont: 14,
                                colorFont: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 28),
                      child: CheckboxListTile(
                        activeColor: purpleColor,
                        value: isCheck,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheck = value!;
                          });
                        },
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'By registering, I agree with',
                                  style: medium(
                                    colorFont: greyColor,
                                    sizeFont: 14,
                                  )),
                              TextSpan(
                                text: ' terms of use ',
                                style: semiBold(
                                  colorFont: purpleColor,
                                  sizeFont: 14,
                                ),
                              ),
                              TextSpan(
                                  text: 'and',
                                  style: medium(
                                    colorFont: greyColor,
                                    sizeFont: 14,
                                  )),
                              TextSpan(
                                text: ' privacy policy ',
                                style: semiBold(
                                  colorFont: purpleColor,
                                  sizeFont: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      buttonText: "Register",
                      onPressed: () {
                        if (_formKey.currentState!.validate() && isCheck) {
                          context.read<AuthBloc>().add(RegisterEvent(
                                _emailTextController.text,
                                _passwordTextController.text,
                                _usernameTextController.text,
                              ));
                        }
                      },
                    ),

                    const SizedBox(
                      height: 17,
                    ),
                    TapText(
                      text1: "Already have an account?",
                      text2: 'Login',
                      onTapFunc: () =>
                          Navigator.pushReplacementNamed(context, loginRoute),
                    ),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
