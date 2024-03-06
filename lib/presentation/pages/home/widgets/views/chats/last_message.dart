import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_sizedboxs.dart';
import '../../../../../../utils/constants/app_text_styles.dart';
import '../../../../../widgets/message_status_icon.dart';

class LastMessage extends StatelessWidget {
  const LastMessage({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MessageStatusIcon(),
        AppSizedboxs.w4,
        Text(
          message ?? 'Hello, world!',
          style: AppTextStyles.grey14W400,
        ),
      ],
    );
  }
}
