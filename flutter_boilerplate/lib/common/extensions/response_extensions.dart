import 'package:dio/dio.dart';

extension ResponseExtension on Response<dynamic> {
  dynamic get result => this.data != null ? this.data['result'] : null;
  dynamic get results => this.result['results'];
  dynamic get items => result != null ? result['items'] : null;
  bool get hasResult => result != null;
}
