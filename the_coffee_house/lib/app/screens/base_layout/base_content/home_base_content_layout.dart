import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';

abstract class HomeBaseContentLayoutState<Sf extends StatefulWidget,
        B extends BaseBloc<St>, St extends BaseBlocState>
    extends BaseLayoutState<Sf, B, St> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  @override
  AppBar? buildAppBar(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return super.buildBase(context);
  }
}
