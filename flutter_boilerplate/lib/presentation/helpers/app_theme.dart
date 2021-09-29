import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/_all.dart';

class AppThemeData {
  final ThemeData theme;
  final Color snackBarColor;
  final Color neutral1;
  final Color neutral2;
  final Color neutral3;
  final Color neutral4;
  final Color neutral5;
  final Color grey1;
  final Color grey2;
  final Color grey3;
  final EdgeInsetsGeometry pageContentPadding;
  final Color success;
  final Color danger;
  final Color warning;
  final Color borderColor;

  const AppThemeData({
    required this.theme,
    required this.snackBarColor,
    required this.neutral1,
    required this.neutral2,
    required this.neutral3,
    required this.neutral4,
    required this.neutral5,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.pageContentPadding,
    required this.success,
    required this.danger,
    required this.warning,
    required this.borderColor,
  });
}

class _InheritedAppTheme extends InheritedWidget {
  final AppThemeData appThemeData;

  const _InheritedAppTheme({
    required Widget child,
    required this.appThemeData,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_InheritedAppTheme old) => appThemeData != old.appThemeData;
}

class AppTheme extends StatelessWidget {
  static AppThemeData get light {
    return AppThemeData(
      snackBarColor: const Color(0xFF323232),
      neutral1: const Color(0x33000000),
      neutral2: const Color(0x66000000),
      neutral3: const Color(0x99000000),
      neutral4: const Color(0xBB000000),
      neutral5: const Color(0xFF000000),
      grey1: const Color(0xFFEEEEEE),
      grey2: const Color(0xFFCCCCCC),
      grey3: const Color(0xFFA6A6A6),
      pageContentPadding: const EdgeInsets.symmetric(horizontal: 20),
      success: const Color(0xFF00ae40),
      danger: Colors.red,
      warning: Colors.orange,
      borderColor: const Color(0xFFCCCCCC),
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFFFFFFFF,
          {
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
        brightness: Brightness.light,
        primaryColor: const Color(0xFFE90C00),
        primaryColorBrightness: Brightness.light,
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.white,
        colorScheme: const ColorScheme(
          primary: Colors.white,
          primaryVariant: Colors.white,
          secondary: Color(0xFF0b569c),
          secondaryVariant: Colors.white,
          surface: Colors.white,
          background: Colors.white,
          error: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFF1D1D1D),
          onBackground: Colors.white,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
        canvasColor: const Color(0xfffafafa),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF1D1D1D)),
          actionsIconTheme: IconThemeData(color: Color(0xFF1D1D1D), size: 16),
          elevation: 0,
          toolbarTextStyle: TextStyle(
            color: Color(0xFFE01A1A),
            fontFamily: AppFonts.mavenProRegular,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarColor: const Color(0xffffffff),
        cardColor: const Color(0xffffffff),
        dividerColor: const Color(0x1f000000),
        highlightColor: const Color(0x66bcbcbc),
        splashColor: const Color(0x66c8c8c8),
        selectedRowColor: const Color(0xfff5f5f5),
        unselectedWidgetColor: const Color(0x8a000000),
        disabledColor: const Color(0x61000000),
        toggleableActiveColor: const Color(0xfffb8c00),
        secondaryHeaderColor: const Color(0xfffff3e0),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color(0xffffcc80),
          cursorColor: Color(0xff4285f4),
          selectionHandleColor: Color(0xffffb74d),
        ),
        backgroundColor: const Color(0xffffcc80),
        dialogBackgroundColor: const Color(0xffffffff),
        indicatorColor: const Color(0xffff9800),
        hintColor: const Color(0x8a000000),
        errorColor: const Color(0xffd32f2f),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFFe01a1a),
          selectedIconTheme: IconThemeData(size: 22, color: Color(0xFFe01a1a)),
          selectedLabelStyle: TextStyle(
            fontSize: 10,
            color: Color(0xFFe01a1a),
            fontFamily: AppFonts.mavenProMedium,
          ),
          unselectedItemColor: Colors.black38,
          unselectedIconTheme: IconThemeData(size: 22, color: Color(0xFFCCCCCC)),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            color: Colors.black38,
            fontFamily: AppFonts.mavenProMedium,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
          minWidth: 88,
          height: 36,
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff000000),
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          alignedDropdown: false,
          buttonColor: Color(0xffe0e0e0),
          disabledColor: Color(0x61000000),
          highlightColor: Color(0x29000000),
          splashColor: Color(0x1f000000),
          focusColor: Color(0x1f000000),
          hoverColor: Color(0x0a000000),
          colorScheme: ColorScheme(
            primary: Color(0xffff9800),
            primaryVariant: Color(0xfff57c00),
            secondary: Color(0xffff9800),
            secondaryVariant: Color(0xfff57c00),
            surface: Color(0xffffffff),
            background: Color(0xffffcc80),
            error: Color(0xffd32f2f),
            onPrimary: Color(0xff000000),
            onSecondary: Color(0xff000000),
            onSurface: Color(0xff000000),
            onBackground: Color(0xff000000),
            onError: Color(0xffffffff),
            brightness: Brightness.light,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(const Color(0xFFe01a1a)),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(const Color(0xFFe01a1a)),
          side: const BorderSide(color: Color(0x33000000), width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline2: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline3: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline4: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline5: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline6: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          subtitle1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          bodyText1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          bodyText2: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          button: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          subtitle2: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          overline: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
        ),
        primaryTextTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline2: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline3: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline4: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline5: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          headline6: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          subtitle1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          bodyText1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          bodyText2: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          button: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          subtitle2: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          overline: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          helperStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          hintStyle: TextStyle(
            color: Color(0xFFCCCCCC),
            fontSize: null,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          errorMaxLines: null,
          isDense: false,
          contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
          isCollapsed: false,
          prefixStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          suffixStyle: TextStyle(
            color: Color(0xFFCCCCCC),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          counterStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.mavenProRegular,
          ),
          filled: false,
          fillColor: Color(0x00000000),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFCCCCCC),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFCCCCCC),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xdd000000),
          opacity: 1,
          size: 24,
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0xff000000),
          opacity: 1,
          size: 24,
        ),
        sliderTheme: const SliderThemeData(
          activeTrackColor: null,
          inactiveTrackColor: null,
          disabledActiveTrackColor: null,
          disabledInactiveTrackColor: null,
          activeTickMarkColor: null,
          inactiveTickMarkColor: null,
          disabledActiveTickMarkColor: null,
          disabledInactiveTickMarkColor: null,
          thumbColor: null,
          disabledThumbColor: null,
          thumbShape: null,
          overlayColor: null,
          valueIndicatorColor: null,
          valueIndicatorShape: null,
          showValueIndicator: null,
          valueIndicatorTextStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Color(0xdd000000),
          unselectedLabelColor: Color(0xb2000000),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: Color(0x1f000000),
          brightness: Brightness.light,
          deleteIconColor: Color(0xde000000),
          disabledColor: Color(0x0c000000),
          labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
          labelStyle: TextStyle(
            color: Color(0xde000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
          secondaryLabelStyle: TextStyle(
            color: Color(0x3d000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          secondarySelectedColor: Color(0x3dff9800),
          selectedColor: Color(0x3d000000),
          shape: StadiumBorder(
              side: BorderSide(
            color: Color(0xff000000),
            width: 0,
            style: BorderStyle.none,
          )),
        ),
        dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff000000),
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        )),
      ),
    );
  }

  static AppThemeData get dark {
    return light;
  }

  final Widget? child;
  final WidgetBuilder? builder;
  final AppThemeData appTheme;

  const AppTheme({
    this.child,
    this.builder,
    required this.appTheme,
  }) : assert(child != null || builder != null);

  @override
  Widget build(BuildContext context) {
    return _InheritedAppTheme(
      appThemeData: appTheme,
      child: child ?? builder!(context),
    );
  }

  static AppThemeData of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedAppTheme>())!.appThemeData;
  }
}
