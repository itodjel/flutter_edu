import 'package:dio/dio.dart';

extension ResponseExtension on Response<dynamic> {
  dynamic get result => data != null ? data['result'] : null;
  dynamic get results => result['results'];
  dynamic get items => result != null ? result['items'] : null;
  bool get hasResult => result != null;
}
