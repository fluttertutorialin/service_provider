import 'package:flutter/material.dart';

class ClickAnimation extends StatefulWidget {
  final Widget child;
  final Function onTap;

  const ClickAnimation({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClickAnimationState();
}

class _ClickAnimationState extends State<ClickAnimation>
    with TickerProviderStateMixin<ClickAnimation> {
  late AnimationController _controller;
  late Animation<double> _clickAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, value: 1.0, duration: const Duration(milliseconds: 100));
    _clickAnimation = Tween(begin: 1.0, end: 0.95)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.onTap == null) {
            return;
          }
          _controller.forward().then((value) {
            _controller.reverse().then((value) {
              widget.onTap();
            });
          });
        },
        child: ScaleTransition(scale: _clickAnimation, child: widget.child));
  }
}
