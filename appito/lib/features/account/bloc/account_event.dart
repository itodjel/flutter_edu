import 'package:appito/_all.dart';

class AccountLoadEvent extends AbstractItemLoadEvent {}

class AccountToggleEvent extends AbstractItemEvent {
  final int? companyId;

  AccountToggleEvent({this.companyId});
}
