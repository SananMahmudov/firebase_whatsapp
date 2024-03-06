import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class GlobalDivider extends StatelessWidget {
  const GlobalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: .1,
      child: ColoredBox(
        color: AppColors.grey,
      ),
    );
  }
}
