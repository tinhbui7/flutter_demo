import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/screens/news/new_detail_state.dart';

class NewsDetailBloc extends BaseBloc<NewsDetailState> {
  NewsDetailBloc(
    NewsDetailState initialState,
  ) : super(initialState);

  @override
  String get tag => 'NewsDetailBloc';
}
