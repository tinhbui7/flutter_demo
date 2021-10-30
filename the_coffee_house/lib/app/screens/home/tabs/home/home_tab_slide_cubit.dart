import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabSlideCubit extends Cubit<int> {
  HomeTabSlideCubit(value) : super(value);

  void pageChange(int index) {
    emit(index);
  }
}
