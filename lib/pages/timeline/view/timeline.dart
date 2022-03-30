import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:longeviy/config/themes/colors.dart';
import 'package:longeviy/config/themes/decorations.dart';
import 'package:longeviy/config/themes/margin_padding_gap.dart';
import 'package:longeviy/models/timeline_data.dart';
import 'package:longeviy/packages/apis/recommender.dart';
import 'package:longeviy/packages/text_formatting/text_formatting.dart';
import 'package:longeviy/providers/recommendation_provider.dart';
import 'package:provider/provider.dart';

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

  Widget getGreeting() {
    int hour = DateTime.now().hour;
    String greeting;
    if (hour < 12) {
      greeting = 'morning';
    } else if (hour < 17) {
      greeting = 'afternoon';
    } else {
      greeting = 'evening';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good $greeting,',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: primaryColor.withOpacity(0.4)),
        ),
        gapYMedium,
        Text(
          user.displayName!.split(' ')[0].toTitleCase(),
          style: Theme.of(context).textTheme.displayLarge!,
        )
      ],
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
          getGreeting(),
          gapYLarge,
          ...Provider.of<RecommendationProvider>(context, listen: true)
              .timelineData
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
      margin: containerBMargin,
      padding: containerAPadding,
      decoration: containerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            timelineData!.title!,
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          gapYMedium,
          Text(
            timelineData!.summary!,
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          gapYLarge,
          gapYMedium,
          Row(
            children: [
              TimelinePostButton(
                onPressed: () {
                  log('message');
                  Provider.of<RecommendationProvider>(context, listen: false)
                      .getTimelineData(timelineData!.title!);
                },
                inActiveIcon: Ionicons.heart_outline,
                activeIcon: Ionicons.heart,
              ),
              gapXMedium,
              TimelinePostButton(
                onPressed: () {},
                inActiveIcon: Ionicons.share_social_outline,
                activeIcon: Ionicons.share_social,
              ),
              gapXMedium,
              TimelinePostButton(
                onPressed: () {},
                inActiveIcon: Ionicons.share_outline,
                activeIcon: Ionicons.share_outline,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TimelinePostButton extends StatefulWidget {
  final Function onPressed;
  final IconData inActiveIcon;
  final IconData activeIcon;
  const TimelinePostButton({
    Key? key,
    required this.onPressed,
    required this.inActiveIcon,
    required this.activeIcon,
  }) : super(key: key);

  @override
  State<TimelinePostButton> createState() => _TimelinePostButtonState();
}

class _TimelinePostButtonState extends State<TimelinePostButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: noPadding,
      visualDensity: noVisualDensity,
      onPressed: () {
        setState(() {
          isPressed = !isPressed;
        });
        widget.onPressed();
      },
      icon: Icon(
        isPressed ? widget.activeIcon : widget.inActiveIcon,
        color: isPressed ? primaryColor : primaryColor.withOpacity(0.4),
      ),
    );
  }
}
