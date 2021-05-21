import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';

abstract class BaseDialogState<
    Sf extends StatefulWidget,
    B extends BaseBloc<St>,
    St extends BaseBlocState> extends BaseLayoutState<Sf, B, St> {
  @override
  AppBar? buildAppBar(BuildContext context) => null;

  @override
  Widget buildContent(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          buildDialogContent(context),
          Positioned(
            right: 10,
            top: 11,
            child: IconButton(
              icon: Icon(Icons.cancel_rounded),
              iconSize: 33,
              color: theme.selectedRowColor,
              onPressed: actionButton,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDialogContent(BuildContext context);

  VoidCallback? actionButton();
}
