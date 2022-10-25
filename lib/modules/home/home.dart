import 'package:flutter_portfolio/exports.dart';

part 'sections/top_home.dart';
part 'style/top_home_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  bool _visibleNavbar = true;
  double pixels = 0;
  bool isRenderMedium = false;
  bool isRenderContact = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final scrollDirection = scrollController.position.userScrollDirection;
      setState(() {
        (scrollDirection == ScrollDirection.reverse) ? _visibleNavbar = false : _visibleNavbar = true;
        pixels = scrollController.position.pixels;
        if (pixels > 190 && !isRenderMedium) {
          isRenderMedium = true;
        }
        if (pixels > 800 && !isRenderContact) {
          isRenderContact = true;
        }
      });
    });
  }

  // void _updateLocation(PointerEvent details) {
  //   print(details.down);
  //   print(details.position.dx);
  //   print(details.position.dy);
  // }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(() {});
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Responsive.isMobile(context) ? const CustomDrawler() : null,
      backgroundColor: const Color(0xFF07111A),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            const EffectWaveBox(),
            const EffectWaveBoxTwo(),
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: <Widget>[
                  const TopHomePage(),
                  const SizedBox(height: 150),
                  MediumHome(scrollController: scrollController, isRender: isRenderMedium),
                  ContactHome(scrollController: scrollController, isRender: isRenderContact),
                  const SizedBox(height: 100),
                ],
              ),
            ),
            Responsive.isMobile(context) ? const MDrawerIcon() : TopNavbar(visibleNavbar: _visibleNavbar),
          ],
        ),
      ),
    );
  }
}

class MDrawerIcon extends StatelessWidget {
  const MDrawerIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(Icons.menu, color: Colors.white, size: 40),
              )
            ],
          ),
        ),
      );
    });
  }
}
