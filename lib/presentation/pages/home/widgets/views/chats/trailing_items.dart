import 'package:firebase_wp/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_colors.dart';
import '../../tab/counter.dart';

class TrailingItems extends StatelessWidget {
  const TrailingItems({
    super.key,
    required this.time,
    required this.messageCount,
  });

  final String time;
  final int messageCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time,
          style: AppTextStyles.grey12W400.copyWith(
            color: messageCount > 0 ? AppColors.primary : null,
          ),
        ),
        if (messageCount > 0) ...[
          const Spacer(),
          Counter(
            number: messageCount,
            dotColor: AppColors.primary,
            textColor: AppColors.white,
          ),
        ]
      ],
    );
  }
}
