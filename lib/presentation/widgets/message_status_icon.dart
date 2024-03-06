import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_colors.dart';

class MessageStatusIcon extends StatelessWidget {
  const MessageStatusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.oneTick,
      height: 12,
      width: 12,
      colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
    );
  }
}
