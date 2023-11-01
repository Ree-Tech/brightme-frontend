import 'package:bright_me/bloc/auth/auth_bloc.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/loading_wigdet.dart';
import 'package:bright_me/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordConfirmTextController =
      TextEditingController();
  final TextEditingController _otpTextController = TextEditingController();
  bool isObscure = false;
  bool isObscureConfirm = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordSucces) {
            Navigator.pushReplacementNamed(
              context,
              successChangePasswordRoute,
            );
          } else if (state is ResetPasswordEror) {
            showSnackBar(context, state.text);
          }
        },
        builder: (context, state) {
          if (state is ResetPasswordLoading) {
            return const LoadingWidget();
          }
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: darGreykColor,
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/lock.png",
                        height: 237,
                        width: 237,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 17,
                      ),
                      child: Text(
                        "Reset Password",
                        style: extraBold(
                          sizeFont: 24,
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
                      height: 12,
                    ),
                    // otp
                    TextFormField(
                      controller: _otpTextController,
                      validator: ValidationBuilder().build(),
                      keyboardType: TextInputType.number,
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
                        hintText: "4 digits of OTP verification code",
                        hintStyle: medium(
                          sizeFont: 14,
                          colorFont: greyColor,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        prefixIcon: const Icon(
                          Icons.security,
                          color: greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    // passowrd flied
                    TextFormField(
                      controller: _passwordTextController,
                      validator: ValidationBuilder()
                          .minLength(6, 'Wrong Password')
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
                    const SizedBox(
                      height: 12,
                    ),

                    //confirmPassword
                    TextFormField(
                      controller: _passwordConfirmTextController,
                      validator: ValidationBuilder()
                          .minLength(6, 'Wrong Password')
                          .build(),
                      obscureText: isObscureConfirm,
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
                          hintText: "Confirm New Password",
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
                    CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(ResetPasswordEvent(
                              _emailTextController.text,
                              _otpTextController.text,
                              _passwordTextController.text,
                              _passwordConfirmTextController.text));
                        }
                      },
                      buttonText: "Update",
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
