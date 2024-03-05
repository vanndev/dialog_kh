import 'package:flutter/widgets.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({
    super.key,
    this.header,
    required this.content,
    this.footer,
    this.isScrollable = false,
    this.scrollController,
  });

  final Widget? header;
  final Widget content;
  final Widget? footer;
  final bool isScrollable;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final scrollView = SingleChildScrollView(
      controller: scrollController,
      child: content,
    );
    final children = [
      Center(child: header ?? const SizedBox()),
      const SizedBox(height: 12),
      isScrollable ? Expanded(child: scrollView) : content,
      const SizedBox(height: 20),
      footer ?? const SizedBox(),
    ];

    return isScrollable ? Column(children: children) : Wrap(children: children);
  }
}
