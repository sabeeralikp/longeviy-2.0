import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  final ScrollController scrollController;
  const Timeline({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline>
    with AutomaticKeepAliveClientMixin {
  bool keepAlive = false;

  @override
  void initState() {
    super.initState();
    doAsyncStuff();
  }

  Future doAsyncStuff() async {
    keepAlive = true;
    updateKeepAlive();
    // Keeping alive...

    await Future.delayed(const Duration(seconds: 60));

    keepAlive = false;
    updateKeepAlive();
    // Can be disposed whenever now.
  }

  @override
  bool get wantKeepAlive => keepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      controller: widget.scrollController,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text('$index'),
        );
      }),
      itemCount: 100,
    );
  }
}
