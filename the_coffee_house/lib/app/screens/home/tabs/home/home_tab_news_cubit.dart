import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabNewsCubit extends Cubit<int> {
  HomeTabNewsCubit(value) : super(value);

  void pageChange(int index) {
    emit(index);
  }
}
