import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/users/users_cubit.dart';
import '../../presentation/pages/users/users_page.dart';
import '../../utils/helpers/app_navigator.dart';

class FabModel {
  FabModel({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final void Function() onTap;

  static final List<FabModel> fabs = [
    FabModel(
      icon: Icons.add,
      onTap: () => Navigator.push(
        AppNavigator.instance.context,
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UsersCubit(),
            child: const UsersPage(),
          ),
        ),
      ),
    ),
    FabModel(
      icon: Icons.edit,
      onTap: () => Navigator.push(
        AppNavigator.instance.context,
        MaterialPageRoute(
          builder: (_) => const UsersPage(),
        ),
      ),
    ),
    FabModel(
      icon: Icons.add_call,
      onTap: () => Navigator.push(
        AppNavigator.instance.context,
        MaterialPageRoute(
          builder: (_) => const UsersPage(),
        ),
      ),
    ),
  ];
}
