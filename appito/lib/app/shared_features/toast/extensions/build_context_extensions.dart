import 'package:appito/_all.dart';

extension IToastBuildContextX on BuildContext {
  IToast get toast => services.get<IToast>();
}
