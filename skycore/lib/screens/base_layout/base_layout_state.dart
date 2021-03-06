import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycore/base/base_bloc.dart';
import 'package:skycore/base/base_bloc_state.dart';
import 'package:skycore/blocs/app/app_bloc.dart';
import 'package:skycore/blocs/app/app_state.dart';
import 'package:skycore/blocs/notify/notify_app_bloc.dart';
import 'package:skycore/constants/global.dart';
import 'package:skycore/screens/base_layout/base_state.dart';
import 'package:skycore/styles/app_theme.dart';
import 'package:skycore/styles/styles.dart';
import 'package:skycore/views/errors/empty_view.dart';
import 'package:skycore/views/errors/network_connection_error.dart';
import 'package:skycore/widgets/progress/content_loading_indicator.dart';

abstract class BaseLayoutState<Sf extends StatefulWidget,
    B extends BaseBloc<St>, St extends BaseBlocState> extends BaseState<Sf> {
  B? bloc;
  St? get state => bloc?.state;
  bool get isLoading => state?.isLoading == true;
  bool get isContentEmpty => bloc?.isContentEmpty == true;

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  bool get isSupportRefresh => false;
  double get appBarLayoutElevation => ELEVATION_APP_BAR;
  bool get isInternetConnected => true;

  late ThemeData theme;

  ///for refreshing
  Completer<void>? refreshCompleter;
  String get title => '';
  String get getEmptyContentMsg => "";

  AppBloc? get appBloc => BlocProvider.of<AppBloc>(context);
  AppState? get appState => appBloc?.state;
  AppTheme? get appTheme => appState?.appTheme;

  NotifyAppBloc get notifyAppBloc => BlocProvider.of<NotifyAppBloc>(context);

  @override
  void initState() {
    super.initState();
    if (isSupportRefresh) {
      refreshCompleter = Completer<void>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildBase(context);
  }

  Widget buildBase(BuildContext context) {
    if (bloc != null) {
      return BlocBuilder(
        bloc: bloc,
        builder: onBlocBuilder,
        buildWhen: onBlocCondition,
      );
    }
    return buildBaseLayout(context);
  }

  Widget onBlocBuilder(BuildContext context, St _state) {
    return buildBaseLayout(context);
  }

  Widget buildBaseLayout(BuildContext context) {
    buildTheme(context);
    Widget content = isSupportRefresh
        ? RefreshIndicator(
            key: refreshKey,
            onRefresh: onRefresh,
            child: buildBaseContent(context),
          )
        : buildBaseContent(context);
    return Theme(
      data: theme,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: bloc != null
            ? BlocListener(
                bloc: bloc,
                listener: onStateChanged,
                child: content,
              )
            : content,
      ),
    );
  }

  ThemeData buildTheme(BuildContext context) {
    theme = Theme.of(context);
    return theme;
  }

  List<Widget> buildHeaderActions(BuildContext context) {
    return [];
  }

  Widget buildTitle(BuildContext context) {
    return Text(
      title,
      style: TextStyles.title1,
    );
  }

  Widget? buildLeadingWidget(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 20.0,
      ),
      onPressed: () => onLeadingPressed(context),
    );
  }

  AppBar? buildAppBar(BuildContext context) {
    return AppBar(
      actions: buildHeaderActions(context),
      title: buildTitle(context),
      brightness: theme.brightness,
      leading: buildLeadingWidget(context),
      elevation: appBarLayoutElevation,
      backgroundColor: theme.backgroundColor,
      actionsIconTheme: IconThemeData(color: theme.colorScheme.onBackground),
      iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
      textTheme: theme.textTheme,
      titleSpacing: 0.0,
      centerTitle: true,
    );
  }

  Widget buildBaseContent(BuildContext context) {
    if (isLoading) {
      return buildLoading(context);
    }
    if (isContentEmpty) {
      if (isInternetConnected == false) {
        return buildNetworkConnectionError(context);
      }
      return buildEmptyView(context);
    }
    return buildContent(context);
  }

  Widget buildLoading(BuildContext context) {
    return Center(child: ContentLoadingIndicator());
  }

  Widget buildNetworkConnectionError(BuildContext context) {
    return NetworkConnectionError(
      onPressed: () {},
    );
  }

  Widget buildEmptyView(BuildContext context) {
    return Center(
      child: EmptyView(message: getEmptyContentMsg),
    );
  }

  Widget buildContent(BuildContext context) => Container();

  bool onBlocCondition(St prev, St current) {
    if (prev.refreshing == true && current.refreshing == false) {
      refreshCompleter?.complete();
      refreshCompleter = Completer();
    }
    return true;
  }

  onLeadingPressed(BuildContext context) => Navigator.of(context).pop();
  onStateChanged(BuildContext context, St _state) {}

  @mustCallSuper
  Future<void> onRefresh() async {
    refreshData();
    return refreshCompleter?.future;
  }

  refreshData() {
    bloc?.refreshData();
  }
}
