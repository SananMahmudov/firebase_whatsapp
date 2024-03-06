import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);

  void getIndex(int index) {
    indexNotifier.value = index;
  }

  @override
  Future<void> close() {
    indexNotifier.dispose();
    return super.close();
  }
}
