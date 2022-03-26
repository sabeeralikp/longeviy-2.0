import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:longeviy/config/themes/colors.dart';
import 'package:longeviy/config/themes/margin_padding_gap.dart';
import 'package:longeviy/models/timeline_data.dart';
import 'package:longeviy/packages/apis/recommender.dart';
import 'package:longeviy/packages/text_formatting/text_formatting.dart';

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
  final user = FirebaseAuth.instance.currentUser!;

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

  Text getGreeting() {
    int hour = DateTime.now().hour;
    String greeting;
    if (hour < 12) {
      greeting = 'Morning';
    } else if (hour < 17) {
      greeting = 'Afternoon';
    } else {
      greeting = 'Evening';
    }
    return Text(
      'Good $greeting,',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primaryColor.withOpacity(0.2),
      ),
    );
  }

  @override
  bool get wantKeepAlive => keepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: pageXTPadding,
      child: ListView(
        controller: widget.scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getGreeting(),
              gapYMedium,
              Text(
                user.displayName!.split(' ')[0].toTitleCase(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              )
            ],
          ),
          ..._timelineData
              .map((e) => TimelinePostContainer(
                    timelineData: e,
                  ))
              .toList()
        ],
      ),
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
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteAccent,
        borderRadius: BorderRadius.circular(20),
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
