import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> accountData = [
  {
    'title': 'Edit Profil',
    'Icon': Image.asset("assets/images/icon_editprofile.jpg"),
    'route': editProfileRoute,
  },
  {
    'title': 'Change Password',
    'Icon': Image.asset("assets/images/icon_editpassword.jpg"),
    'route': submitEmailRoute,
  },
  {
    'title': 'Manage Account',
    'Icon': Image.asset("assets/images/icon_menage_acoount.jpg"),
    'route': manageAccountRoute,
  },
];
List<Map<String, dynamic>> settingData = [
  {
    'title': 'Language',
    'Icon': const Icon(
      Icons.language,
      color: purpleColor,
      size: 24,
    ),
    'route': 'showModal',
  },
];

List<Map<String, dynamic>> supporrtData = [
  {
    'title': 'FAQ',
    'Icon': Image.asset("assets/images/icon_faq.jpg"),
    'route': faqRoute,
  },
  {
    'title': 'Help Center',
    'Icon': Image.asset("assets/images/icon_callcenter.jpg"),
    'route': helpCenterRoute,
  },
];
List<Map<String, dynamic>> aboutData = [
  {
    'title': 'Privacy Policy',
    'Icon': Image.asset("assets/images/icon_policy.jpg"),
    'route': 'none',
  },
  {
    'title': 'Terms of Use',
    'Icon': Image.asset("assets/images/icon_term.jpg"),
    'route': 'none',
  },
  {
    'title': 'App Version',
    'Icon': Image.asset("assets/images/icon_appversion.jpg"),
    'route': appVersionRoute,
  },
];

List<Map<String, dynamic>> menagedata = [
  {
    'title': 'Switch Account',
    'Icon': Image.asset("assets/images/icon_switch_account.jpg"),
    'route': switchAccountRoute,
  },
  {
    'title': 'Logout',
    'Icon': Image.asset("assets/images/icon_logout.jpg"),
    'route': 'logout',
  },
  {
    'title': 'Request Account Deletion',
    'Icon': Image.asset("assets/images/icon_delete_account.jpg"),
    'route': 'delete',
  },
];
