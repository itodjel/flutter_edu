import 'package:flutter_boilerplate/_all.dart';
import 'package:permission_handler/permission_handler.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

void showRequestRationale(Permission permission) {
  final context = globalNavigatorKey.currentState!.context;
  final theme = context.theme;

  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text(context.translations.permissionRequired),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(() {
              if (permission == Permission.storage) {
                return context.translations.applicationNeedsPermissionForPhonesStorage;
              }

              return context.translations.applicationNeedsPermissionToPerformRequestedOperation;
            }()),
            const Spacing.v_m(),
            Text(context.translations.allowThisPermissionInYourAppSettings),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.navigator.pop(),
            child: Text(
              context.translations.cancel.toUpperCase(),
              style: theme.textTheme.button?.copyWith(color: Colors.green),
            ),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              context.pop();
            },
            child: Text(
              context.translations.ok,
              style: theme.textTheme.button?.copyWith(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
