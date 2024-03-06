import 'package:firebase_wp/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_texts.dart';
import 'counter.dart';
import 'status_dot.dart';

class CustomTab extends StatelessWidget {
  const CustomTab.chats({
    super.key,
    this.title = AppTexts.chats,
    required this.number,
  })  : isSeenStatus = null,
        isStatus = false;

  const CustomTab.status({
    super.key,
    this.title = AppTexts.status,
    required this.isSeenStatus,
  })  : number = null,
        isStatus = true;

  const CustomTab.calls({
    super.key,
    this.title = AppTexts.calls,
    required this.number,
  })  : isStatus = false,
        isSeenStatus = null;

  final String title;
  final int? number;
  final bool? isSeenStatus;
  final bool isStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.tabBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 6),
          isStatus
              ? StatusDot(isSeenStatus: isSeenStatus ?? false)
              : Counter(
                  number: number ?? 0,
                  textColor: AppColors.primary,
                  dotColor: AppColors.white,
                ),
        ],
      ),
    );
  }
}
