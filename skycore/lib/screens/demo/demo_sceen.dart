import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skycore/screens/base_layout/base_layout_state.dart';
import 'package:domain/entities/demo_entity.dart';

import 'demo_bloc.dart';
import 'demo_state.dart';

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState
    extends BaseLayoutState<DemoScreen, DemoScreenBloc, DemoScreenState> {
  _DemoScreenState() {
    bloc = DemoScreenBloc();
    bloc?.fetchData();
  }

  bool get checked => state?.checked == true;
  List<DemoEntity>? get demos => state?.demos;

  @override
  String get title => 'Demo Screen';

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Column(
        children: [
          if (demos?.isNotEmpty == true)
            ...(demos?.map((e) => Text(e.name ?? '')).toList() ?? []),
          Checkbox(
            value: checked,
            onChanged: (value) {
              bloc?.checkedChange(!checked);
            },
          ),
        ],
      ),
    );
  }
}
