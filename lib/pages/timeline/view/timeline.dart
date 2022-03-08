import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:longeviy/config/themes/colors.dart';
import 'package:longeviy/models/timeline_data.dart';
import 'package:longeviy/packages/apis/recommender.dart';

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
  List<TimelineDataModel?> _timelineData = [];

  @override
  void initState() {
    super.initState();
    doAsyncStuff();
    getTimelineData('How Much Exercise Should You Do?');
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

  getTimelineData(String title) async {
    _timelineData = await getRecommendations(title);
    log(_timelineData.toString());
    setState(() {});
  }

  @override
  bool get wantKeepAlive => keepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      controller: widget.scrollController,
      children: [
        ..._timelineData
            .map((e) => TimelinePostContainer(
                  timelineData: e,
                ))
            .toList()
      ],
    );
  }
}

class TimelinePostContainer extends StatelessWidget {
  final TimelineDataModel? timelineData;
  const TimelinePostContainer({
    Key? key,
    this.timelineData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteAccent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(4, 4),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(timelineData!.title!),
          Text(timelineData!.summary!),
        ],
      ),
    );
  }
}
