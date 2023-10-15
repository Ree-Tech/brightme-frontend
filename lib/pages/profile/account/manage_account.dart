import 'package:bright_me/bloc/auth/auth_bloc.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/profile_data.dart';
import 'package:bright_me/widget/confirm_popup.dart';
import 'package:bright_me/widget/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBar(
        context,
        'Manage Account',
        true,
        false,
        () {},
      ),
      body: Container(
        height: 180,
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 40,
          left: 30,
          right: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: lightWhite,
          boxShadow: boxShadow,
        ),
        child: Column(
          children: menagedata.asMap().entries.map((entry) {
            final item = entry.value;
            final isLastItem = entry.key == menagedata.length - 1;

            return GestureDetector(
              onTap: () async {
                if (item['route'] == 'logout') {
                  await showDialog(
                      context: context,
                      builder: (context) => BlocListener<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is Unauthenticated) {
                                Navigator.pushReplacementNamed(
                                    context, loginRoute);
                              }
                            },
                            child: ConfirmPopUp(
                                title: 'Logout this account?',
                                confirmButtonText: 'Yes',
                                onPressedConfirm: () {
                                  context.read<AuthBloc>().add(LogoutEvent());
                                }),
                          ));
                } else if (item['route'] == 'delete') {
                  await showDialog(
                      context: context,
                      builder: (context) => ConfirmPopUp(
                            title:
                                "We're sorry to see you go. With this action, your data will be permanently removed.",
                            confirmButtonText: 'Confirm',
                            onPressedConfirm: () => Navigator.pop(context),
                          ));
                } else {
                  Navigator.pushNamed(context, item['route']);
                }
              },
              child: Column(
                children: [
                  ListTile(
                    leading: item['Icon'],
                    title: Text(
                      item['title'],
                      style: reguler(
                        sizeFont: 14,
                        colorFont: darGreykColor,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: darGreykColor,
                      size: 16,
                    ),
                  ),
                  if (!isLastItem)
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
