import 'package:flutter_boilerplate/_all.dart';
import 'package:permission_handler/permission_handler.dart';

late GlobalKey<NavigatorState> globalNavigatorKey;
// final globalNavigatorKey = GlobalKey<NavigatorState>();

Future<bool> showRequestRationale(Permission permission) async {
  final context = globalNavigatorKey.currentState?.context;
  if (context != null) {
    if (permission.value == Permission.location.value) {
      return await context.navigator.pushNamed(AllowLocationPage.route) as bool;
    } else {
      return await showDefaultRequestRationale(permission);
    }
  }
  return false;
}

Future<bool> showDefaultRequestRationale(Permission permission) async {
  final context = globalNavigatorKey.currentState?.context;
  if (context != null) {
    final theme = context.theme;

    return await showDialog(
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
              const Spacing.verticalM(),
              Text(context.translations.allowThisPermissionInYourAppSettings),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => context.navigator.pop(false),
              child: Text(
                context.translations.cancel.toUpperCase(),
                style: theme.textTheme.button?.copyWith(color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () {
                openAppSettings();
                context.navigator.pop(true);
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
  return false;
}
