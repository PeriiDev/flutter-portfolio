import 'package:flutter_portfolio/exports.dart';
import 'package:flutter_portfolio/global/widgets/custom_box.dart';
import 'package:flutter_portfolio/global/widgets/effects/e_hover_text.dart';
import 'package:url_launcher/url_launcher.dart';

class TopNavbar extends StatelessWidget {
  final bool visibleNavbar;

  const TopNavbar({super.key, required this.visibleNavbar});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Robr');

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: visibleNavbar ? 70 : 0,
      child: CustomBox(
        height: 70,
        //borderColor: Colors.red,
        //borderWidth: 3,
        paddingHorizontal: 25,
        child: Row(
          children: [
            //Icon(Icons.email, color: Colors.white), //TODO MODIFICAR ICONO
            Expanded(child: Container()),
            //CustomOnHoverText(builder: (isHovered) => const Text('HOME', style: style)),
            //const SizedBox(width: 30),
            GestureDetector(
                onTap: () => launchUrl(Uri.parse(AppAssets.youtubeUrl)),
                child: EHoverText(builder: (isHovered) => const Text('YOUTUBE', style: style))),
            const SizedBox(width: 30),
            const _ButtonHireMe()
          ],
        ),
      ),
    );
  }
}

class _ButtonHireMe extends StatelessWidget {
  const _ButtonHireMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EHoverButton(
      child: TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.all(16),
            elevation: 30,
            shadowColor: Colors.black,
          ),
          child: const Text('HIRE ME',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Robr',
              ))),
    );
  }
}
