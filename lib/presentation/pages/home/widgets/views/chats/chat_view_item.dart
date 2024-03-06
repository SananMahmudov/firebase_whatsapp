import 'package:firebase_wp/utils/constants/app_paddings.dart';
import 'package:firebase_wp/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/global_profile_picture.dart';
import 'last_message.dart';
import 'trailing_items.dart';

class ChatViewItem extends StatelessWidget {
  const ChatViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: AppPaddings.all12,
      dense: true,
      leading: GlobalProfilePicture(),
      title: Text('Flutter', style: AppTextStyles.black16W500),
      subtitle: LastMessage(),
      trailing: TrailingItems(
        time: '12:12',
        messageCount: 0,
      ),
    );
  }
}
