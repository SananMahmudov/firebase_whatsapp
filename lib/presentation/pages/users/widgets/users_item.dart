import 'package:flutter/material.dart';

import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../widgets/global_profile_picture.dart';

class UsersItem extends StatelessWidget {
  const UsersItem({
    super.key,
    required this.name,
    this.bio,
    this.profileUrl,
  });

  final String name;
  final String? bio;
  final String? profileUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: AppPaddings.all10,
      leading: GlobalProfilePicture(url: profileUrl),
      title: Text(name, style: AppTextStyles.black16W500),
      subtitle: Text(
        bio ?? 'Hello, world!',
        style: AppTextStyles.grey14W400,
      ),
    );
  }
}
