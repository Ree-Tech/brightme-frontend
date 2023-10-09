import "package:bright_me/config/color_theme.dart";
import "package:bright_me/config/font_theme.dart";
import "package:bright_me/config/route_name.dart";
import "package:bright_me/widget/custom_button.dart";
import "package:bright_me/widget/tap_text.dart";
import "package:flutter/material.dart";
import "package:form_validator/form_validator.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool isObscure = false;

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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/login.jpg",
                  height: 245,
                  width: 245,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 25,
                  ),
                  child: Text(
                    "Login",
                    style: extraBold(
                      sizeFont: 24,
                    ),
                  ),
                ),

                // email flied
                TextFormField(
                  controller: _emailTextController,
                  validator: ValidationBuilder().email('Wrong Email ').build(),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    prefixIcon: const Icon(
                      Icons.alternate_email,
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
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 11, bottom: 30, right: 3),
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, submitEmailRoute),
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: medium(
                          sizeFont: 14,
                          colorFont: purpleColor,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  buttonText: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, otpRoute);
                    }
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  child: Row(children: <Widget>[
                    const Expanded(
                        child: Divider(
                      color: greyColor,
                    )),
                    Text(
                      "or with Google",
                      style: medium(sizeFont: 12, colorFont: greyColor),
                    ),
                    const Expanded(
                        child: Divider(
                      color: greyColor,
                    )),
                  ]),
                ),

                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 48),
                        shape: const StadiumBorder(),
                        side: const BorderSide(color: purpleColor, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google.jpg",
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Google",
                          style: semiBold(
                            sizeFont: 16,
                            colorFont: darGreykColor,
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 17,
                ),
                TapText(
                  text1: "Not registered yet? ",
                  text2: 'Create an Account',
                  onTapFunc: () => Navigator.pushNamed(context, registerRoute),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
