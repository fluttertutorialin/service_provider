import 'package:flutter/material.dart';
import '../../util/extensions.dart';

class EServiceTilWidget extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final double? horizontalPadding;

  const EServiceTilWidget(
      {Key? key,
      this.title,
      this.content,
      this.actions,
      this.horizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 10, vertical: 10),
        decoration: getBoxDecoration(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(child: title!),
            if (actions != null) Wrap(children: actions!)
          ]),
          const Divider(height: 26, thickness: 1.2),
          content!
        ]));
  }
}
