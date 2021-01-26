import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/BaseVM.dart';
import 'package:provider/provider.dart';

class BaseFragment<T extends BaseVM> extends StatelessWidget {
  final BaseVM model;
  final Widget Function(T model) builder;

  BaseFragment({
    this.builder,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: Consumer<T>(
          builder: (BuildContext context, T value, Widget child) =>
              builder(value)),
    );
  }
}
