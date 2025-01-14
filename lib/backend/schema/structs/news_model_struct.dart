// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsModelStruct extends BaseStruct {
  NewsModelStruct({
    String? time,
    String? title,
    String? date,
  })  : _time = time,
        _title = title,
        _date = date;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;
  bool hasTime() => _time != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  static NewsModelStruct fromMap(Map<String, dynamic> data) => NewsModelStruct(
        time: data['time'] as String?,
        title: data['title'] as String?,
        date: data['date'] as String?,
      );

  static NewsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? NewsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'title': _title,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewsModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsModelStruct(
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewsModelStruct &&
        time == other.time &&
        title == other.title &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([time, title, date]);
}

NewsModelStruct createNewsModelStruct({
  String? time,
  String? title,
  String? date,
}) =>
    NewsModelStruct(
      time: time,
      title: title,
      date: date,
    );
