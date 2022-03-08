import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:longeviy/providers/nav_bar_state_provider.dart';
import 'package:provider/provider.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final Duration duration;
  const ScrollToHideWidget(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 500),
      required this.scrollController})
      : super(key: key);

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;
  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(listen);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      if (isVisible) {
        setState(() {
          Provider.of<NavBarStateProvider>(context, listen: false)
              .setNavState(false);
        });
      }
    } else {
      if (!isVisible) {
        setState(() {
          Provider.of<NavBarStateProvider>(context, listen: false)
              .setNavState(true);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    isVisible =
        Provider.of<NavBarStateProvider>(context, listen: false).isVisible;
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? 66 : 0,
      curve: Curves.easeInOut,
      child: Wrap(children: [widget.child]),
    );
  }
}
