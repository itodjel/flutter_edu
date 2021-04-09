import 'package:flutter/material.dart';

class AppThemeData {
  final ThemeData theme;
  final Color snackBarColor;
  final Gradient iconGradient;
  final Color socialIconColor;
  final Color warningColor;
  final Color accentTextColor;
  final Color successColor;
  final Color secondaryColor;
  final Color dangerColor;
  final Color black5;
  final Color black4;
  final Color black3;
  final Color black2;
  final Color black1;
  final Color breakColor;
  final Color breakColorLight;
  final Color breakColorAccent;

  const AppThemeData({
    required this.theme,
    required this.snackBarColor,
    required this.iconGradient,
    required this.socialIconColor,
    required this.warningColor,
    required this.accentTextColor,
    required this.successColor,
    required this.secondaryColor,
    required this.dangerColor,
    required this.black5,
    required this.black4,
    required this.black3,
    required this.black2,
    required this.black1,
    required this.breakColor,
    required this.breakColorLight,
    required this.breakColorAccent,
  });
}

class _InheritedAppTheme extends InheritedWidget {
  final AppThemeData appThemeData;

  const _InheritedAppTheme({
    required Widget child,
    required this.appThemeData,
  })   : assert(appThemeData != null),
        super(child: child);

  @override
  bool updateShouldNotify(_InheritedAppTheme old) => appThemeData != old.appThemeData;
}

class AppTheme extends StatelessWidget {
  static AppThemeData get light {
    final successColor = Color(0xFF1FC867);
    final secondaryColor = Color(0xFF2A8D54);
    final dangerColor = Color(0xFFFF0000);
    final black5 = Color(0xFFEEEEEE);
    final black4 = Color(0xFFC7C7C7);
    final black3 = Color(0xFF949494);
    final black2 = Color(0xFF626262);
    final black1 = Color(0xFF000000);
    final breakColor = Color(0xFFED9821);
    final breakColorLight = breakColor.withOpacity(0.4);
    final breakColorAccent = Color(0xFFEFBE02);
    final primaryColor = Color(0xFFDD4814);

    final textFieldBorderColor = Color(0xFF949494);
    final textFieldHintColor = Color(0xFF949494);
    final accentTextColor = Color(0xFF2873AB);

    return AppThemeData(
      snackBarColor: Color(0xFF323232),
      socialIconColor: accentTextColor,
      warningColor: Colors.orange,
      accentTextColor: accentTextColor,
      successColor: successColor,
      secondaryColor: secondaryColor,
      dangerColor: dangerColor,
      black5: black5,
      black4: black4,
      black3: black3,
      black2: black2,
      black1: black1,
      breakColor: breakColor,
      breakColorLight: breakColorLight,
      breakColorAccent: breakColorAccent,
      iconGradient: RadialGradient(
        colors: [
          const Color(0xFF1988B5),
          const Color(0xFF4A4494),
        ],
      ),
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: Color(0xFF464996),
        fontFamily: 'Muli',
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Color(0xFF919899),
          selectedIconTheme: IconThemeData(size: 20),
          unselectedIconTheme: IconThemeData(size: 20),
          selectedLabelStyle: TextStyle(fontSize: 12),
          unselectedLabelStyle: TextStyle(fontSize: 12, color: Color(0xFF919899)),
          showUnselectedLabels: true,
        ),
        brightness: Brightness.light,
        errorColor: const Color(0xFFF44336),
        cursorColor: primaryColor,
        textSelectionHandleColor: primaryColor,
        indicatorColor: const Color(0xFFF05063),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryIconTheme: IconThemeData(color: Colors.white),
        primarySwatch: MaterialColor(
          0xFFFFFFFF,
          const <int, Color>{
            50: Color(0xFFFFFFFF),
            100: Color(0xFFFFFFFF),
            200: Color(0xFFFFFFFF),
            300: Color(0xFFFFFFFF),
            400: Color(0xFFFFFFFF),
            500: Color(0xFFFFFFFF),
            600: Color(0xFFFFFFFF),
            700: Color(0xFFFFFFFF),
            800: Color(0xFFFFFFFF),
            900: Color(0xFFFFFFFF),
          },
        ),
        appBarTheme: AppBarTheme(
          color: primaryColor,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            headline3: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white),
            headline5: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white, fontSize: 18),
            subtitle1: TextStyle(color: Colors.white),
            subtitle2: TextStyle(color: Colors.white),
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            caption: TextStyle(color: Colors.white),
            button: TextStyle(color: Colors.white),
            overline: TextStyle(color: Colors.white),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(7),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          fillColor: const Color(0xFFeeeeee),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: textFieldHintColor,
          ),
          labelStyle: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.black26,
          ),
          errorStyle: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(),
          headline2: TextStyle(),
          headline3: TextStyle(),
          headline4: TextStyle(),
          headline5: TextStyle(),
          headline6: TextStyle(),
          subtitle1: TextStyle(),
          subtitle2: TextStyle(),
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
          caption: TextStyle(),
          button: TextStyle(),
          overline: TextStyle(),
        ),
        // primarySwatch:
        primaryColorBrightness: Brightness.light,
        primaryColorLight: Colors.white,
        primaryColorDark: Color(0xFFeeeeee),
        // primaryColorLight:,
        // primaryColorLight:
        // accentColorBrightness:
        // canvasColor:
        // cardColor:
        // dividerColor:
        // focusColor:
        // hoverColor:
        // highlightColor:
        // splashColor:
        // splashFactory:
        // selectedRowColor:
        // unselectedWidgetColor:
        // disabledColor:
        // buttonColor:
        // buttonTheme:
        // toggleButtonsTheme:
        // secondaryHeaderColor:
        // textSelectionColor:
        // textSelectionHandleColor:
        // backgroundColor:
        // dialogBackgroundColor:
        // hintColor:
        // toggleableActiveColor:
        // primaryTextTheme:
        // accentTextTheme:
        // iconTheme:
        // accentIconTheme:
        // sliderTheme:
        // tabBarTheme:
        // tooltipTheme:
        // cardTheme:
        // chipTheme:
        // platform:
        // materialTapTargetSize:
        // applyElevationOverlayColor:
        // pageTransitionsTheme:
        // bottomAppBarTheme:
        // colorScheme:
        // dialogTheme:
        // floatingActionButtonTheme:
        // navigationRailTheme:
        // typography:
        // cupertinoOverrideTheme:
        // snackBarTheme:
        // bottomSheetTheme:
        // popupMenuTheme:
        // bannerTheme:
        // dividerTheme:
        // buttonBarTheme:
      ),
    );
  }

  static AppThemeData get dark {
    return light;
  }

  final Widget? child;
  final WidgetBuilder builder;
  final AppThemeData appTheme;

  const AppTheme({
    this.child,
    required this.builder,
    required this.appTheme,
  });

  @override
  Widget build(BuildContext context) {
    return _InheritedAppTheme(
      appThemeData: appTheme,
      child: child ?? builder(context),
    );
  }

  static AppThemeData of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedAppTheme>())!.appThemeData;
  }
}
