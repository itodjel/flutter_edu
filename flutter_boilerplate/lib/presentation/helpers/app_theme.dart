import 'package:flutter/material.dart';

class AppThemeData {
  final ThemeData theme;
  final Color snackBarColor;

  const AppThemeData({
    required this.theme,
    required this.snackBarColor,
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
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
        primaryColor: const Color(0xffff9800),
        primaryColorBrightness: Brightness.light,
        primaryColorLight: const Color(0xffffe0b2),
        primaryColorDark: const Color(0xfff57c00),
        //accentColor: const Color(0xffff9800),
        //accentColorBrightness: Brightness.light,
        canvasColor: const Color(0xfffafafa),
        scaffoldBackgroundColor: const Color(0xfffafafa),
        bottomAppBarColor: const Color(0xffffffff),
        cardColor: const Color(0xffffffff),
        dividerColor: const Color(0x1f000000),
        highlightColor: const Color(0x66bcbcbc),
        splashColor: const Color(0x66c8c8c8),
        selectedRowColor: const Color(0xfff5f5f5),
        unselectedWidgetColor: const Color(0x8a000000),
        disabledColor: const Color(0x61000000),
        // buttonColor: const Color(0xffe0e0e0),
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
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          button: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        primaryTextTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          button: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        // accentTextTheme: const TextTheme(
        //   headline1: TextStyle(
        //     color: Color(0x8a000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   headline2: TextStyle(
        //     color: Color(0x8a000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   headline3: TextStyle(
        //     color: Color(0x8a000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   headline4: TextStyle(
        //     color: Color(0x8a000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   headline5: TextStyle(
        //     color: Color(0xdd000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   headline6: TextStyle(
        //     color: Color(0xdd000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   subtitle1: TextStyle(
        //     color: Color(0xdd000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   bodyText1: TextStyle(
        //     color: Color(0xdd000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   bodyText2: TextStyle(
        //     color: Color(0xdd000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   caption: TextStyle(
        //     color: Color(0x8a000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   button: TextStyle(
        //     color: Color(0xdd000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   subtitle2: TextStyle(
        //     color: Color(0xff000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        //   overline: TextStyle(
        //     color: Color(0xff000000),
        //     fontSize: null,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //   ),
        // ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          helperStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          hintStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorMaxLines: null,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          isDense: false,
          contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
          isCollapsed: false,
          prefixStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          suffixStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          counterStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          filled: false,
          fillColor: Color(0x00000000),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
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
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
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
        // accentIconTheme: const IconThemeData(
        //   color: Color(0xff000000),
        //   opacity: 1,
        //   size: 24,
        // ),
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
  final WidgetBuilder builder;
  final AppThemeData appTheme;

  const AppTheme({
    required this.builder,
    required this.appTheme,
    this.child,
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
