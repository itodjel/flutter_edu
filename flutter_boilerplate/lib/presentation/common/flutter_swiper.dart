import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_boilerplate/_all.dart';

class FlutterSwiper extends StatefulWidget {
  final int index;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final void Function(int)? onIndexChanged;
  final bool showControls;
  final bool showIndicators;
  final bool showCloseButton;
  final bool loop;
  final double? height;
  final Color? indicatorColor;
  final Color? indicatorBorderColor;

  const FlutterSwiper({
    this.index = 0,
    this.itemCount = 0,
    required this.itemBuilder,
    this.onIndexChanged,
    this.showControls = true,
    this.showIndicators = true,
    this.showCloseButton = true,
    this.loop = true,
    this.height,
    this.indicatorColor,
    this.indicatorBorderColor,
  });

  @override
  _FlutterSwiperState createState() => _FlutterSwiperState();
}

class _FlutterSwiperState extends State<FlutterSwiper> {
  var _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;

    setOrientationRotation();
  }

  @override
  void dispose() {
    setOrientationPortrait();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasMoreItems = widget.itemCount > 1;
    final items = <Widget>[];

    for (var i = 0; i < widget.itemCount; i++) {
      items.add(widget.itemBuilder(context, i));
    }

    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: context.theme.scaffoldBackgroundColor,
              child: CarouselSlider(
                items: items,
                carouselController: _carouselController,
                options: CarouselOptions(
                  viewportFraction: 1,
                  enableInfiniteScroll: widget.loop,
                  height: widget.height ?? context.screenHeight,
                  initialPage: widget.index,
                  onPageChanged: (index, _) {
                    if (widget.showIndicators) {
                      setState(() => _currentIndex = index);
                    }
                  },
                ),
              ),
            ),
            if (widget.showControls && hasMoreItems)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Button(
                  onTap: () => _carouselController.previousPage(),
                  child: Icon(AppIcons.chevronLeft, size: 40, color: context.theme.primaryColor),
                ),
              ),
            if (widget.showControls && hasMoreItems)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Button(
                  onTap: () => _carouselController.nextPage(),
                  child: Icon(AppIcons.chevronRight, size: 40, color: context.theme.primaryColor),
                ),
              ),
            if (widget.showCloseButton)
              Positioned(
                top: 0,
                right: 0,
                child: Button(
                  onTap: () => context.navigator.pop(),
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Icon(AppIcons.close, color: context.appTheme.neutral3),
                ),
              ),
            if (widget.showIndicators && hasMoreItems)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 20,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.itemCount,
                      (index) => Dot(
                        isActive: index == _currentIndex,
                        color: widget.indicatorColor,
                        borderColor: widget.indicatorBorderColor,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
