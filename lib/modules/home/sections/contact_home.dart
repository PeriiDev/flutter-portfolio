import 'package:flutter/material.dart';
import 'package:flutter_portfolio/global/utils/app_assets.dart';
import 'package:flutter_portfolio/global/utils/responsive.dart';
import 'package:flutter_portfolio/global/widgets/effects/e_hover_text_underline.dart';
import 'package:flutter_portfolio/global/widgets/effects/e_on_hover_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactHome extends StatelessWidget {
  final bool isRender;
  final ScrollController scrollController;

  const ContactHome({
    super.key,
    required this.scrollController,
    required this.isRender,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final sContactTitle = TextStyle(
        fontSize: Responsive.isMobile(context)
            ? 34
            : Responsive.isTablet(context)
                ? 46
                : 60,
        color: Colors.white,
        fontFamily: 'Poppi',
        shadows: const [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 10)]);
    final pixels = scrollController.position.pixels;

    return AnimatedOpacity(
      opacity: !isRender
          ? pixels > 800
              ? 1
              : 0
          : 1,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        padding: const EdgeInsets.only(top: 200, bottom: 50, left: 20, right: 20),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact me',
              style: sContactTitle,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 6.5),
              child: const Divider(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 6.5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: const [
                    Text(
                      ' * Email: ',
                      style: TextStyle(fontSize: 26, color: Colors.white, fontFamily: 'Robr'),
                    ),
                    EmailContact(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  SocialMediaIcon(icon: FontAwesomeIcons.twitter, onTap: () => _launchTwitter()),
                  const SizedBox(width: 50),
                  SocialMediaIcon(icon: FontAwesomeIcons.github, onTap: () => _launchGithub()),
                  const SizedBox(width: 50),
                  SocialMediaIcon(icon: FontAwesomeIcons.linkedin, onTap: () => _launchLinkedin()),
                ],
              ),
            ),
            const SizedBox(height: 200),
            const Align(
              alignment: Alignment.center,
              child: Text(
                '©  Developed by Pedro Navarro',
                style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Robr'),
              ),
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'in Flutter',
                style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Robr'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailContact extends StatelessWidget {
  const EmailContact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? const SelectionArea(
            child: Text('navarroc.pedroa@gmail.com',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Robl',
                )),
          )
        : EHoverTextUnderline(
            builder: ((isHovered) {
              return SelectionArea(
                child: Text('navarroc.pedroa@gmail.com',
                    style: TextStyle(
                      decoration: (!isHovered) ? null : TextDecoration.underline,
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Robl',
                    )),
              );
            }),
          );
  }
}

Future<void> _launchGithub() async {
  if (!await launchUrl(Uri.parse(AppAssets.githubUrl))) {
    throw 'Could not launch ';
  }
}

Future<void> _launchLinkedin() async {
  if (!await launchUrl(Uri.parse(AppAssets.linkedinUrl))) {
    throw 'Could not launch ';
  }
}

Future<void> _launchTwitter() async {
  if (!await launchUrl(Uri.parse(AppAssets.twitterUrl))) {
    throw 'Could not launch ';
  }
}

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;

  const SocialMediaIcon({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Responsive.isMobile(context)
          ? Icon(icon,
              color: Colors.white,
              size: Responsive.isMobile(context)
                  ? 50
                  : Responsive.isTablet(context)
                      ? 75
                      : 100)
          : EOnHoverIcons(
              builder: (isHovered) => Icon(icon,
                  color: Colors.white,
                  size: Responsive.isMobile(context)
                      ? 50
                      : Responsive.isTablet(context)
                          ? 75
                          : 100),
            ),
    );
  }
}
