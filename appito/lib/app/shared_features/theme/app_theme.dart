import 'package:appito/_all.dart';

const _smallTextScaleFactor = 0.90;
const _mediumTextScaleFactor = 0.95;

class AppTheme implements ThemeExtension<AppTheme> {
  final Color successColor;
  final EdgeInsetsGeometry defaultButtonPadding;

  AppTheme({
    required this.successColor,
    required this.defaultButtonPadding,
  });

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? successColor,
    EdgeInsetsGeometry? defaultButtonPadding,
  }) {
    return AppTheme(
      successColor: successColor ?? this.successColor,
      defaultButtonPadding: defaultButtonPadding ?? this.defaultButtonPadding,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(
      successColor: other.successColor,
      defaultButtonPadding: other.defaultButtonPadding,
    );
  }

  @override
  Object get type => AppTheme;
}

class AppITOTheme {
  static ThemeData get large {
    return ThemeData(
      extensions: [
        AppTheme(
          successColor: Colors.green,
          defaultButtonPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
      ],
      colorScheme: ColorScheme.fromSwatch(accentColor: AppITOColors.blue),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: AppITOColors.whiteBackground,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
    );
  }

  static ThemeData get largeDark {
    return large.copyWith(
      brightness: Brightness.dark,
      extensions: [
        AppTheme(
          successColor: Colors.green,
          defaultButtonPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
      ],
    );
  }

  static ThemeData get small {
    return large.copyWith(
      textTheme: _smallTextTheme,
      extensions: [
        AppTheme(
          successColor: Colors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static ThemeData get smallDark {
    return largeDark.copyWith(
      textTheme: _smallTextTheme,
      extensions: [
        AppTheme(
          successColor: Colors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static ThemeData get medium {
    return large.copyWith(
      textTheme: _mediumTextTheme,
      extensions: [
        AppTheme(
          successColor: Colors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static ThemeData get mediumDark {
    return largeDark.copyWith(
      textTheme: _mediumTextTheme,
      extensions: [
        AppTheme(
          successColor: Colors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: AppITOTextStyle.headline1,
      headline2: AppITOTextStyle.headline2,
      headline3: AppITOTextStyle.headline3,
      headline4: AppITOTextStyle.headline4,
      headline5: AppITOTextStyle.headline5,
      headline6: AppITOTextStyle.headline6,
      subtitle1: AppITOTextStyle.subtitle1,
      subtitle2: AppITOTextStyle.subtitle2,
      bodyText1: AppITOTextStyle.bodyText1,
      bodyText2: AppITOTextStyle.bodyText2,
      caption: AppITOTextStyle.caption,
      overline: AppITOTextStyle.overline,
      button: AppITOTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: AppITOTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: AppITOTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: AppITOTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: AppITOTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: AppITOTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: AppITOTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: AppITOTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: AppITOTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: AppITOTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: AppITOTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: AppITOTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: AppITOTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: AppITOTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _mediumTextTheme {
    return TextTheme(
      headline1: AppITOTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _mediumTextScaleFactor,
      ),
      headline2: AppITOTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _mediumTextScaleFactor,
      ),
      headline3: AppITOTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _mediumTextScaleFactor,
      ),
      headline4: AppITOTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _mediumTextScaleFactor,
      ),
      headline5: AppITOTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _mediumTextScaleFactor,
      ),
      headline6: AppITOTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _mediumTextScaleFactor,
      ),
      subtitle1: AppITOTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _mediumTextScaleFactor,
      ),
      subtitle2: AppITOTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _mediumTextScaleFactor,
      ),
      bodyText1: AppITOTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _mediumTextScaleFactor,
      ),
      bodyText2: AppITOTextStyle.bodyText2.copyWith(
        color: Colors.blue,
        fontSize: _textTheme.bodyText2!.fontSize! * _mediumTextScaleFactor,
      ),
      caption: AppITOTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _mediumTextScaleFactor,
      ),
      overline: AppITOTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _mediumTextScaleFactor,
      ),
      button: AppITOTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _mediumTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(color: AppITOColors.blue);
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        primary: AppITOColors.blue,
        minimumSize: const Size(208, 54),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(color: AppITOColors.white, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 16),
        primary: AppITOColors.white,
        minimumSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: AppITOColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: AppITOColors.white),
    );
  }

  static DialogTheme get _dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppITOColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme {
    return const BottomNavigationBarThemeData(
      backgroundColor: AppITOColors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    );
  }

  static TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2.0,
          color: AppITOColors.blue,
        ),
      ),
      labelColor: AppITOColors.blue,
      unselectedLabelColor: AppITOColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 1,
      color: AppITOColors.black25,
    );
  }
}
