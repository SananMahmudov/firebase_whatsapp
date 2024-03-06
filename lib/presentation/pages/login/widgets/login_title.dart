import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: 'Verify your phone number. ',
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: 'What is your phone number?',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
