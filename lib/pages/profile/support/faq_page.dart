import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/white_appbar.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBar(
        context,
        'FAQ',
        true,
        false,
        () {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            itemBuilder(
              "What is Bright Me and what are its main features?",
              " Bright Me is a skincare application focused on facial skin health. Its main features include facial skin condition detection (e.g., oily skin, dry skin, acne), Glow Up Plan for radiant skin, Glow Up Education for skincare knowledge, Consultation with experts, and a Community for skincare enthusiasts.",
            ),
            itemBuilder(
              ' How does the facial skin condition detection feature work?',
              "Bright Me's facial skin condition detection utilizes advanced technology to analyze your skin. It identifies various conditions like oily skin, dryness, acne, and more, providing you with insights about your skin's current state.",
            ),
            itemBuilder(
              " What is the Glow Up Plan, and what can it do for my skin ",
              "The Glow Up Plan is a premium feature designed to help you achieve a more radiant complexion. It offers personalized skincare routines and product recommendations tailored to your specific skin type and concerns.",
            ),
            itemBuilder(
              " Can I access Glow Up Education for free, and what kind of information does it provide?",
              " Yes, Glow Up Education is a free feature that provides comprehensive skincare knowledge. It offers videos covering various aspects of facial skin health, from basic care to advanced topics.",
            ),
            itemBuilder(
              " How can I schedule a Consultation with skincare experts, and is there a cost involved?",
              "You can schedule a Consultation through the app, where you can connect with experienced skincare professionals. While some Consultations may have associated costs, the pricing details will be provided within the app.",
            ),
            itemBuilder(
              " What can I expect from the Bright Me Community, and how can I join? ",
              "The Bright Me Community is a space for skincare enthusiasts to share experiences and insights. You can join by creating an account within the app. In the Community, you can engage in discussions, seek advice, and connect with like-minded individuals.",
            ),
            itemBuilder(
              " Is my personal information and skincare data secure on Bright Me? ",
              " Yes, Bright Me takes your privacy seriously. Your personal and skincare information is kept confidential and used solely for improving your skincare experience. We adhere to strict privacy and security protocols to safeguard your data.",
            ),
            itemBuilder(
              "How often should I use the facial skin condition detection feature? ",
              "You can use the facial skin condition detection feature as often as you like. Some users prefer daily checks, while others use it weekly to monitor changes in their skin",
            ),
            itemBuilder(
              " Can I cancel my Glow Up Plan subscription at any time?",
              "Yes, you have the flexibility to cancel your Glow Up Plan subscription at any time. Please refer to the app for specific instructions on managing your subscription.",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                " If you have more questions or need assistance with any of Bright Me's features, feel free to contact our support team through the app.",
                style: reguler(
                  colorFont: blackColor,
                  sizeFont: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemBuilder(
    String title,
    String content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: bold(
              colorFont: blackColor,
              sizeFont: 12,
            ),
          ),
          Text(
            content,
            style: reguler(
              colorFont: blackColor,
              sizeFont: 12,
            ),
          )
        ],
      ),
    );
  }
}
