import 'package:bright_me/config/color_theme.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> orderData = [
  {
    'title': 'Active',
    'Icon': const Icon(
      Icons.access_time_sharp,
      color: purpleColor,
    ),
  },
  {
    'title': 'Done',
    'Icon': const Icon(
      Icons.download_done,
      color: purpleColor,
    ),
  },
  {
    'title': 'Cancelled',
    'Icon': Image.asset("assets/images/tabler_basket-cancel.png"),
  },
];

List<Map<String, dynamic>> consulData = [
  {
    'title': 'Active',
    'Icon': const Icon(
      Icons.access_time_sharp,
      color: purpleColor,
    ),
  },
  {
    'title': 'Done',
    'Icon': const Icon(
      Icons.download_done,
      color: purpleColor,
    ),
  },
  {
    'title': 'Cancelled',
    'Icon': Image.asset("assets/images/tabler_message-cancel.png"),
  },
];

List<Map<String, dynamic>> paymentData = [
  {
    'title': 'GlowUp Plan',
    'subtitle': 'Purchased for annual plan',
    'time': '20 min ago',
    'image': "assets/images/vscode-icons_file-type-progress.png",
  },
  {
    'title': 'Shop',
    'subtitle': 'Purchased Rp 125,000 in total',
    'time': '1 day ago',
    'image': "assets/images/heroicons_shopping-bag-solid.png",
  },
  {
    'title': 'Personal Consul',
    'subtitle': 'Purchased Rp 135,000 for consultation',
    'time': '1 day ago',
    'image': "assets/images/maki_doctor.png",
  },
];
