import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/profile_data.dart';
import 'package:bright_me/widget/confirm_popup.dart';
import 'package:bright_me/widget/white_appbar.dart';
import 'package:flutter/material.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

  handleNavigate(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

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
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          height: 220,
          child: menuBuilder(menagedata, context),
        ),
      ),
    );
  }

  Widget menuBuilder(
    List<Map<String, dynamic>> data,
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 14,
        bottom: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: lightWhite,
        boxShadow: boxShadow,
      ),
      child: Column(
        children: data.asMap().entries.map((entry) {
          final item = entry.value;
          final isLastItem = entry.key == data.length - 1;

          return GestureDetector(
            onTap: () async {
              if (item['route'] == 'logout') {
                await showDialog(
                    context: context,
                    builder: (context) => ConfirmPopUp(
                          title: 'Logout this account?',
                          confirmButtonText: 'Yes',
                          onPressedConfirm: () => Navigator.pop(context),
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
                handleNavigate(context, item['route']);
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
    );
  }
}
