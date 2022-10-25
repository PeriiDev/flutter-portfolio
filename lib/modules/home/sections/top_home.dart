part of '../home.dart';

class TopHomePage extends StatelessWidget {
  const TopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      //height: 1100,
      //decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 223, 22, 8))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: Responsive.isMobile(context)
                      ? 60
                      : Responsive.isTablet(context)
                          ? 100
                          : Responsive.high1320(context)
                              ? 200
                              : 125,
                  right: 60,
                  top: 25),
              //decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: Column(
                mainAxisAlignment: Responsive.isMobile(context)
                    ? MainAxisAlignment.center
                    : Responsive.isTablet(context)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _MAvatar(), //TODO only display in mobile
                  const SizedBox(height: 0), //Todo delete???
                  Text(AppText.hi, style: TopHomeStyle.styleMyNameIs),
                  Responsive.isMobile(context)
                      ? Text(AppText.name, style: TopHomeStyle.style(context))
                      : EHoverFollowCursorText(builder: (isHovered) {
                          return EHoverSpecial(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(AppText.name, style: TopHomeStyle.style(context)));
                        }),
                  const SizedBox(height: 25),
                  Text('Full-stack developer from Andalucía, Spain', style: TopHomeStyle.sDefault(context)),
                  const SizedBox(height: 10),
                  Text('Need a full custom website or mobile app?', style: TopHomeStyle.sDefault(context)),
                  const SizedBox(height: 20),
                  Wrap(
                    children: [
                      const Icon(Icons.account_box_outlined, color: Colors.white, size: 35),
                      const SizedBox(width: 12),
                      Text('ABOUT ME ', style: TopHomeStyle.sAboutMeTitle)
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(AppText.aboutMeDescription, style: TopHomeStyle.sAboutMe),
                  const SizedBox(height: 20),
                  const Text(
                    'Technologies I have worked with',
                    style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontFamily: 'Robr'),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: const [
                      _ButtonPersonalFeature(icon: Icons.flutter_dash, text: 'Flutter'),
                      _ButtonPersonalFeature(icon: FontAwesomeIcons.react, text: 'React'),
                      _ButtonPersonalFeature(icon: FontAwesomeIcons.nodeJs, text: 'Node Js'),
                      _ButtonPersonalFeature(icon: FontAwesomeIcons.js, text: 'Javascript'),
                      _ButtonPersonalFeature(icon: FontAwesomeIcons.java, text: 'Java'),
                    ],
                  )
                  //const CustomOnHoverButton(child: ButtonStartedHome()),//Todo boton started delete??
                  //const SizedBox(height: 20),
                  /*RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'data',
                      style: styleBase,
                    ),
                  )*/
                ],
              ),
            ),
          ),
          const _WAvatar(),
        ],
      ),
    );
  }
}

class _ButtonPersonalFeature extends StatelessWidget {
  final String text;
  final IconData icon;

  const _ButtonPersonalFeature({
    Key? key,
    this.text = '',
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: 130,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontFamily: 'Robr'),
          )
        ],
      ),
    );
  }
}

class _MAvatar extends StatelessWidget {
  const _MAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Responsive.high1320(context))
        ? Container() //ED
        : Align(
            alignment: Alignment.center,
            child: Container(
                height: Responsive.isMobile(context) ? 400 : 600,
                //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: Responsive.isMobile(context) ? 325 : 500,
                      height: Responsive.isMobile(context) ? 200 : 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 182, 255, 205),
                            Color.fromARGB(255, 75, 146, 117),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: Responsive.isMobile(context) ? 0 : 0,
                      child: Image.asset(
                        Responsive.isMobile(context) ? 'assets/${AppAssets.avatar}' : AppAssets.avatar,
                        height: Responsive.isMobile(context) ? 300 : 500,
                      ),
                    ),
                  ],
                )),
          );
  }
}

class _WAvatar extends StatelessWidget {
  const _WAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (!Responsive.high1320(context))
        ? Container()
        : Expanded(
            child: Container(
                height: 600,
                /*decoration: BoxDecoration(
                  //color: Colors.red,
                  border: Border.all(
                      color: Colors.red,
                      ),
                ),*/
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 500,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 182, 255, 205),
                            Color.fromARGB(255, 75, 146, 117),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        AppAssets.avatar,
                        height: 500,
                      ),
                    ),
                  ],
                ) /*Center(
                child: CustomOnHoverButton(
                  child: Image.asset(
                    AppAssets.avatarPerson2,
                  ) /*CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 45, 155, 83),
                    child: Image.asset(
                      AppAssets.avatarPerson2,
                    ),
                    radius: 250,
                    /* backgroundImage: AssetImage(
                      AppAssets.avatarPerson2,
                    ),*/
                  )*/
                  ,
                ),
              ),*/
                ),
          );
  }
}
