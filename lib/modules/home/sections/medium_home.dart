import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_portfolio/exports.dart';
import 'package:flutter_portfolio/global/widgets/effects/e_on_hover_card.dart';

import '../../../global/widgets/custom_box.dart';

const styleDescription = TextStyle(fontFamily: 'Robb', fontSize: 40, fontStyle: FontStyle.italic);

class MediumHome extends StatelessWidget {
  final bool isRender;
  final ScrollController scrollController;

  const MediumHome({
    Key? key,
    required this.scrollController,
    required this.isRender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final sWhatIDoWork = TextStyle(
        fontSize: Responsive.isMobile(context)
            ? 34
            : Responsive.isTablet(context)
                ? 46
                : 60,
        color: Colors.white,
        fontFamily: 'Poppi',
        shadows: const [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 10)]);

    final pixels = scrollController.position.pixels;
    //print(isRender);
    //print(pixels);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeIn,
      opacity: (!isRender)
          ? pixels > 190
              ? 1
              : 0
          : 1,
      child: Container(
        padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What I do work?',
              style: sWhatIDoWork,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 6.5),
              child: const Divider(color: Colors.white),
            ),
            Responsive.isMobile(context) ? const SizedBox(height: 30) : const SizedBox(height: 80),
            Responsive.isDesktop(context)
                ? Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      _CardDev(iconImagePath: AppAssets.mobileIcon, description: AppText.mobileDescription),
                      _CardDev(iconImagePath: AppAssets.webIcon, description: AppText.webDescription),
                      _CardDev(iconImagePath: AppAssets.devIcon, description: AppText.devDescription),
                    ],
                  )
                : CarouselSlider(
                  
                    options: CarouselOptions(
                      
                      enableInfiniteScroll: false,
                      //aspectRatio: 16 / 9,
                      viewportFraction: Responsive.isMobile(context) ? 0.8 : 0.7,
                      height: Responsive.isMobile(context) ? 300 : 400,
                    ),

                    items: [
                      _CardDev(iconImagePath: AppAssets.mobileIcon, description: AppText.mobileDescription),
                      _CardDev(iconImagePath: AppAssets.webIcon, description: AppText.webDescription),
                      _CardDev(iconImagePath: AppAssets.devIcon, description: AppText.devDescription),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class _CardDev extends StatelessWidget {
  final String iconImagePath;
  final String description;

  const _CardDev({
    Key? key,
    required this.iconImagePath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Responsive.isMobile(context)
            ? _MCardDev(
                description: description,
                styleDescription: styleDescription,
                iconImagePath: iconImagePath,
                constraints: constraints,
              )
            : _WCardDev(
                description: description,
                styleDescription: styleDescription,
                iconImagePath: iconImagePath,
                constraints: constraints,
              );
      },
    );
  }
}

class _WCardDev extends StatelessWidget {
  final String description;
  final TextStyle styleDescription;
  final String iconImagePath;
  final BoxConstraints constraints;

  const _WCardDev({
    Key? key,
    required this.description,
    required this.styleDescription,
    required this.iconImagePath,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey();
    return EOnHoverCard(
      builder: (isHovered) {
        return CustomBox(
            height: 400,
            width: 400,
            //borderColor: Colors.red,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 300,
                  width: 400,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                    child: (!isHovered)
                        ? Text(description, textAlign: TextAlign.center, style: styleDescription)
                        : AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText(
                                description,
                                textAlign: TextAlign.center,
                                textStyle: styleDescription,
                              ),
                            ],
                            totalRepeatCount: 2,
                          ),
                  ),
                ),
                Positioned(
                  left: -constraints.maxWidth * 0.5,
                  right: -constraints.maxWidth * 0.5,
                  top: 0,
                  // bottom: -constraints.maxHeight * 0.5,
                  child: Image.asset(
                    iconImagePath,
                    height: 150,
                  ),
                ),
              ],
            ));
      },
    );
  }
}

class _MCardDev extends StatelessWidget {
  final String description;
  final TextStyle styleDescription;
  final String iconImagePath;
  final BoxConstraints constraints;

  const _MCardDev({
    Key? key,
    required this.description,
    required this.styleDescription,
    required this.iconImagePath,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      height: Responsive.isMobile(context) ? 250 : 400,
      width: Responsive.isMobile(context) ? 250 : 400,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: Responsive.isMobile(context) ? 200 : 300,
            width: Responsive.isMobile(context) ? 250 : 400,
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Center(
              child: Text(description, textAlign: TextAlign.center, style: styleDescription),
            ),
          ),
          Positioned(
            left: -constraints.maxWidth * 0.5,
            right: -constraints.maxWidth * 0.5,
            top: 50,
            child: Image.asset(
              'assets/$iconImagePath',
              height: 85,
            ),
          ),
        ],
      ),
    );
  }
}
