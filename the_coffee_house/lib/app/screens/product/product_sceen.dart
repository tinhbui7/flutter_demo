import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/product/product_bloc.dart';
import 'package:the_coffee_house/app/screens/product/product_state.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends BaseLayoutState<ProductScreen,
    ProductScreenBloc, ProductScreenState> {
  _ProductScreenState() {
    bloc = ProductScreenBloc();
    bloc?.fetchData();
  }

  @override
  String get title => 'Product Screen';

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Flutter Product',
            style: theme.textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
