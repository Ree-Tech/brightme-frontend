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

class SubmitEmailPage extends StatefulWidget {
  const SubmitEmailPage({super.key});

  @override
  State<SubmitEmailPage> createState() => _SubmitEmailPageState();
}

class _SubmitEmailPageState extends State<SubmitEmailPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is EmailResetPasswordSuccess) {
              Navigator.pushReplacementNamed(context, resetPasswordRoute);
            } else if (state is EmailResetPasswordEror) {
              showSnackBar(context, state.text);
            }
          },
          builder: (context, state) {
            if (state is EmailResetPasswordLoading) {
              return const LoadingWidget();
            }
            return SingleChildScrollView(
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
                    Image.asset("assets/images/forgot_pass.png"),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 17,
                      ),
                      child: Text(
                        "Forgot Password?",
                        style: extraBold(
                          sizeFont: 24,
                        ),
                      ),
                    ),
                    Text(
                      "Don't worry. It happened. Please enter the address associated with your account",
                      style: medium(
                        sizeFont: 16,
                        colorFont: greyColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32, bottom: 54),
                      child: TextFormField(
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
                    ),
                    CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(EmailResetPasswordEvent(
                              _emailTextController.text));
                        }
                      },
                      buttonText: "Submit",
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
