import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class NewsDetailState extends BaseBlocState {
  const NewsDetailState({
    this.isLoading = false,
  });

  final bool isLoading;

  @override
  List<Object> get props {
    return [
      isLoading,
    ];
  }

  NewsDetailState copyWith({
    bool? isLoading,
  }) {
    return NewsDetailState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
