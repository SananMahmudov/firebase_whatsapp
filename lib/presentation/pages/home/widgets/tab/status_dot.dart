import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_colors.dart';

class StatusDot extends StatelessWidget {
  const StatusDot({
    super.key,
    required this.isSeenStatus,
  });

  final bool isSeenStatus;

  @override
  Widget build(BuildContext context) {
    return !isSeenStatus
        ? const SizedBox(
            height: 8,
            width: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
