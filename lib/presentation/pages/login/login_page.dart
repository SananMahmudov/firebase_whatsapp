import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../utils/constants/app_sizedboxs.dart';
import 'widgets/country_picker_and_phone.dart';
import 'widgets/login_title.dart';
import 'widgets/next_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('message');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  child: Text('Az'),
                ),
                PopupMenuItem(
                  child: Text('En'),
                ),
                PopupMenuItem(
                  child: Text('Ru'),
                ),
              ];
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          AppSizedboxs.h16,
          LoginTitle(),
          CountryPickerAndPhone(),
          Spacer(),
          NextButton(),
        ],
      ),
      bottomNavigationBar: const SizedBox(height: 70),
    );
  }
}
