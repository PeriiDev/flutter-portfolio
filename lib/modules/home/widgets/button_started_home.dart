import 'package:flutter_portfolio/exports.dart';

const styleButon = TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Robr');

class ButtonStartedHome extends StatelessWidget {
  const ButtonStartedHome({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: null,
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 17, 133, 1),
          padding: const EdgeInsets.all(20),
          shadowColor: Colors.black,
          elevation: 30,
        ),
        child: const Text('GET STARTED', style: styleButon));
  }
}
