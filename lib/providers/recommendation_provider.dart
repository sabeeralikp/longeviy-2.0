import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:longeviy/models/timeline_data.dart';
import 'package:longeviy/packages/apis/recommender.dart';

class RecommendationProvider extends ChangeNotifier {
  RecommendationProvider({
    required this.title,
  }) {
    getInitTimelineData(title);
  }
  final String title;
  List<TimelineDataModel?> timelineData = [];
  String recommendationtitle = 'How Much Exercise Should You Do?';
  updateTimelineData(List<TimelineDataModel?> list) {
    timelineData.addAll(list);
    notifyListeners();
  }

  getInitTimelineData(String title) async {
    timelineData = await getRecommendations(title);
    notifyListeners();
  }

  getTimelineData(String title) async {
    timelineData.addAll(await getRecommendations(title));
    notifyListeners();
  }
}
