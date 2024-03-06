import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../cubits/login/login_cubit.dart';
import '../../../utils/constants/app_colors.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Page'),
      ),
      body: Column(
        children: [
          Pinput(
            length: 6,
            controller: cubit.verifyController,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            onPressed: () => cubit.verify(context),
            child: const Text('Verify'),
          ),
        ],
      ),
    );
  }
}
