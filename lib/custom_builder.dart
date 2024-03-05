import 'package:flutter/widgets.dart';

class CustomBuilder extends StatelessWidget {
  const CustomBuilder({super.key, required this.builder, required this.child});

  final Widget Function(BuildContext, Widget) builder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return builder.call(context, child);
  }
}

