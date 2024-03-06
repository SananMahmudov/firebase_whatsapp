import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/users/users_cubit.dart';
import '../../../utils/constants/app_sizedboxs.dart';
import '../../widgets/global_loading.dart';
import 'widgets/user_app_bar.dart';
import 'widgets/users_item.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    return StreamBuilder(
      stream: cubit.getUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: GlobalLoading(),
          );
        }
        final docs = snapshot.data?.docs;
        return Scaffold(
          appBar: UserAppBar(userCount: docs?.length ?? 0),
          body: ListView.separated(
            itemCount: docs?.length ?? 0,
            separatorBuilder: (_, __) => AppSizedboxs.h6,
            itemBuilder: (_, i) {
              final document = docs![i].data();
              return UsersItem(
                name: document['name'],
                profileUrl: document['profilePicture'],
                bio: document['phone'],
              );
            },
          ),
        );
      },
    );
  }
}
