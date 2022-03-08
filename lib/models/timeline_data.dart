class TimelineDataModel {
  int? index;
  String? title;
  String? summary;

  TimelineDataModel({this.index, this.title, this.summary});

  TimelineDataModel.fromJson(Map<String, dynamic> json) {
    index = json['index'].toInt();
    title = json['Title'].toString();
    summary = json['Summary'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['Title'] = title;
    data['Summary'] = summary;
    return data;
  }

  static List<TimelineDataModel> listFromJson(List<dynamic> list) {
    List<TimelineDataModel> rows =
        list.map((i) => TimelineDataModel.fromJson(i)).toList();
    return rows;
  }
}
