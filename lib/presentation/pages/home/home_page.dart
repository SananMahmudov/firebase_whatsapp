import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/home/home_cubit.dart';
import '../../../data/models/fab_model.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/views/chats/chats_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => _homeCubit.getIndex(_tabController.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(tabController: _tabController),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatsView(),
          Icon(Icons.e_mobiledata),
          Icon(Icons.abc),
        ],
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _homeCubit.indexNotifier,
        builder: (context, i, _) {
          final fab = FabModel.fabs[i];
          return FloatingActionButton(
            onPressed: fab.onTap,
            child: Icon(fab.icon),
          );
        },
      ),
    );
  }
}
