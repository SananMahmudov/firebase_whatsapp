import 'package:flutter/material.dart';

import '../../../../../widgets/global_divider.dart';
import 'chat_view_item.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (_, __) => const GlobalDivider(),
      itemBuilder: (_, i) => const ChatViewItem(),
    );
  }
}
