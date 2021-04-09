import 'package:flutter_boilerplate/all.dart';

extension TextExtensions on Text {
  Text color(Color color) => _getText(TextStyle(color: color));

  //Alignment
  Text get center => _getText(TextStyle(), pTextAlign: TextAlign.center);

  Text height(double height) => _getText(TextStyle(height: height));

  //Weight
  Text get w100 => _getText(TextStyle(fontWeight: FontWeight.w100));
  Text get w200 => _getText(TextStyle(fontWeight: FontWeight.w200));
  Text get w300 => _getText(TextStyle(fontWeight: FontWeight.w300));
  Text get w400 => _getText(TextStyle(fontWeight: FontWeight.w400));
  Text get w500 => _getText(TextStyle(fontWeight: FontWeight.w500));
  Text get w600 => _getText(TextStyle(fontWeight: FontWeight.w600));
  Text get w700 => _getText(TextStyle(fontWeight: FontWeight.w700));
  Text get w800 => _getText(TextStyle(fontWeight: FontWeight.w800));
  Text get w900 => _getText(TextStyle(fontWeight: FontWeight.w900));

  //Sizes
  Text get xxxs => _getText(TextStyle(fontSize: 8));
  Text get xxs => _getText(TextStyle(fontSize: 10));
  Text get xs => _getText(TextStyle(fontSize: 12));
  Text get s => _getText(TextStyle(fontSize: 14));
  Text get m => _getText(TextStyle(fontSize: 16));
  Text get l => _getText(TextStyle(fontSize: 18));
  Text get xl => _getText(TextStyle(fontSize: 20));
  Text get xxl => _getText(TextStyle(fontSize: 22));
  Text get xxxl => _getText(TextStyle(fontSize: 24));

  Text _getText(TextStyle styleOriginal, {TextAlign? pTextAlign}) => Text(
        this.data ?? '',
        style: _copyWithTextStyle(styleOriginal, this.style),
        textAlign: pTextAlign ?? this.textAlign,
        overflow: this.overflow,
        softWrap: this.softWrap,
      );

  TextStyle _copyWithTextStyle(TextStyle styleOriginal, TextStyle? newStyle) {
    return styleOriginal.copyWith(
      inherit: newStyle?.inherit,
      color: newStyle?.color,
      backgroundColor: newStyle?.backgroundColor,
      fontFamily: newStyle?.fontFamily,
      fontFamilyFallback: newStyle?.fontFamilyFallback,
      fontSize: newStyle?.fontSize,
      fontWeight: newStyle?.fontWeight,
      fontStyle: newStyle?.fontStyle,
      letterSpacing: newStyle?.letterSpacing,
      wordSpacing: newStyle?.wordSpacing,
      textBaseline: newStyle?.textBaseline,
      height: newStyle?.height,
      locale: newStyle?.locale,
      foreground: newStyle?.foreground,
      background: newStyle?.background,
      shadows: newStyle?.shadows,
      fontFeatures: newStyle?.fontFeatures,
      decoration: newStyle?.decoration,
      decorationColor: newStyle?.decorationColor,
      decorationStyle: newStyle?.decorationStyle,
      decorationThickness: newStyle?.decorationThickness,
      debugLabel: newStyle?.debugLabel,
    );
  }
}
