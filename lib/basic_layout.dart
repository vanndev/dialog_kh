import 'package:flutter/widgets.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({
    super.key,
    this.header,
    required this.content,
    this.footer,
    this.scrollController,
  });

  final Widget? header;
  final Widget content;
  final Widget? footer;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Center(child: header ?? const SizedBox()),
        SingleChildScrollView(
          controller: scrollController,
          child: content,
        ),
        footer ?? const SizedBox(),
      ],
    );
  }
}
