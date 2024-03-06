import 'package:firebase_wp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/app_texts.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBar({
    super.key,
    required this.userCount,
    this.onSearch,
    this.onMore,
  });

  final int userCount;
  final void Function()? onSearch;
  final void Function()? onMore;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.users,
            style: AppTextStyles.black16W500.copyWith(color: AppColors.white),
          ),
          Text(
            '$userCount users',
            style: AppTextStyles.grey12W400.copyWith(color: AppColors.white),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onSearch,
          icon: const Icon(
            Icons.search,
            color: AppColors.white,
          ),
        ),
        IconButton(
          onPressed: onMore,
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
