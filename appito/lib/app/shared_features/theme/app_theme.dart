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

class AppitoTheme {
  static ThemeData get large {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      extensions: [
        AppTheme(
          successColor: AppColors.green,
          defaultButtonPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
      ],
      colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.blue),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: AppColors.whiteBackground,
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
      scaffoldBackgroundColor: AppColors.black,
      extensions: [
        AppTheme(
          successColor: AppColors.green,
          defaultButtonPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
      ],
    );
  }

  static ThemeData get small {
    return large.copyWith(
      textTheme: _smallTextTheme,
      scaffoldBackgroundColor: AppColors.white,
      extensions: [
        AppTheme(
          successColor: AppColors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static ThemeData get smallDark {
    return largeDark.copyWith(
      textTheme: _smallTextTheme,
      scaffoldBackgroundColor: AppColors.black,
      extensions: [
        AppTheme(
          successColor: AppColors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static ThemeData get medium {
    return large.copyWith(
      textTheme: _mediumTextTheme,
      scaffoldBackgroundColor: AppColors.white,
      extensions: [
        AppTheme(
          successColor: AppColors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static ThemeData get mediumDark {
    return largeDark.copyWith(
      textTheme: _mediumTextTheme,
      scaffoldBackgroundColor: AppColors.black,
      extensions: [
        AppTheme(
          successColor: AppColors.green,
          defaultButtonPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: AppTextStyle.headline1,
      headline2: AppTextStyle.headline2,
      headline3: AppTextStyle.headline3,
      headline4: AppTextStyle.headline4,
      headline5: AppTextStyle.headline5,
      headline6: AppTextStyle.headline6,
      subtitle1: AppTextStyle.subtitle1,
      subtitle2: AppTextStyle.subtitle2,
      bodyText1: AppTextStyle.bodyText1,
      bodyText2: AppTextStyle.bodyText2,
      caption: AppTextStyle.caption,
      overline: AppTextStyle.overline,
      button: AppTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: AppTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: AppTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: AppTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: AppTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: AppTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: AppTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: AppTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: AppTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: AppTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: AppTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: AppTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: AppTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: AppTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _mediumTextTheme {
    return TextTheme(
      headline1: AppTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _mediumTextScaleFactor,
      ),
      headline2: AppTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _mediumTextScaleFactor,
      ),
      headline3: AppTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _mediumTextScaleFactor,
      ),
      headline4: AppTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _mediumTextScaleFactor,
      ),
      headline5: AppTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _mediumTextScaleFactor,
      ),
      headline6: AppTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _mediumTextScaleFactor,
      ),
      subtitle1: AppTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _mediumTextScaleFactor,
      ),
      subtitle2: AppTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _mediumTextScaleFactor,
      ),
      bodyText1: AppTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _mediumTextScaleFactor,
      ),
      bodyText2: AppTextStyle.bodyText2.copyWith(
        color: AppColors.blue,
        fontSize: _textTheme.bodyText2!.fontSize! * _mediumTextScaleFactor,
      ),
      caption: AppTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _mediumTextScaleFactor,
      ),
      overline: AppTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _mediumTextScaleFactor,
      ),
      button: AppTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _mediumTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(color: AppColors.blue);
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        primary: AppColors.blue,
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
        side: const BorderSide(color: AppColors.white, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 16),
        primary: AppColors.white,
        minimumSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: AppColors.white),
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
      backgroundColor: AppColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme {
    return const BottomNavigationBarThemeData(
      backgroundColor: AppColors.blue,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white70,
    );
  }

  static TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2.0,
          color: AppColors.blue,
        ),
      ),
      labelColor: AppColors.blue,
      unselectedLabelColor: AppColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 1,
      color: AppColors.black25,
    );
  }
}
