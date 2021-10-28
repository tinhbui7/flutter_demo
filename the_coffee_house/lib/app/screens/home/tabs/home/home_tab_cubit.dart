import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabCubit extends Cubit<int> {
  HomeTabCubit(value) : super(value);

  void pageChange(int index) {
    emit(index);
  }
}
