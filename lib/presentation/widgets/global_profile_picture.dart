import 'package:flutter/material.dart';

import '../../utils/constants/app_assets.dart';

class GlobalProfilePicture extends StatelessWidget {
  const GlobalProfilePicture({
    super.key,
    this.url,
    this.onTap,
  });

  final String? url;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        width: 56,
        child: CircleAvatar(
          backgroundImage: url != null
              ? NetworkImage(url!)
              : const AssetImage(AppAssets.defaultProfilePicture)
                  as ImageProvider,
        ),
      ),
    );
  }
}
