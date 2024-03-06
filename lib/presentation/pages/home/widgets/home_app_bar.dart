import 'package:firebase_wp/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/configs.dart';
import 'tab/custom_tab.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.tabController,
  });

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      shadowColor: Colors.grey,
      elevation: 4,
      title: const Text(Configs.appName),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
      bottom: TabBar(
        controller: tabController,
        dividerColor: Colors.transparent,
        tabs: const [
          CustomTab.chats(number: 0),
          CustomTab.status(isSeenStatus: false),
          CustomTab.calls(number: 0),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + AppSizes.tabBarHeight);
}
