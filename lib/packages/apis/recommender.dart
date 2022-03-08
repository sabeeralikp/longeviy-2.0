import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:longeviy/models/timeline_data.dart';

const String baseURL = 'https://longevityrecomemend.herokuapp.com/';

final dio = Dio();

Future<List<TimelineDataModel?>> getRecommendations(String title) async {
  const url = '$baseURL/getrecs/';
  try {
    final response = await dio.get(url, queryParameters: {'title': title});
    if (response.statusCode == 200) {
      return TimelineDataModel.listFromJson(response.data);
    } else {
      log('${response.statusCode} : ${response.data.toString()}');
      throw response.statusCode!;
    }
  } catch (error) {
    log(error.toString());
  }
  return [];
}
