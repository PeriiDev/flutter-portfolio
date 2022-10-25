import 'package:flutter/material.dart';

class EffectWaveBox extends StatelessWidget {
  const EffectWaveBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 600,
      child: CustomPaint(
        painter: WaveCP(),
      ),
    );
  }
}

class EffectWaveBoxTwo extends StatelessWidget {
  const EffectWaveBoxTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 800,
        height: 600,
        // color: Colors.blue,
        child: CustomPaint(
          painter: WaveTwoCP(),
        ),
      ),
    );
  }
}

class WaveCP extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(0, 55),
      radius: 180,
    );

    //Aplicar un gradient
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 5, 152, 5),
        Color.fromARGB(255, 47, 238, 114),
        Color.fromARGB(255, 3, 118, 70),
      ],
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    //final paint = Paint(); //Creo mi lapiz

    //Propiedades del lapiz
    //Cuando uso un SHADER se ignora el color del lapiz
    paint.color = const Color.fromARGB(255, 68, 255, 146);
    paint.style = PaintingStyle.fill; // .fill -> rellena .stroke ->linea
    paint.strokeWidth = 5;

    final path = Path();

    //Dibujar
    //path.moveTo(0, 0); // Default pos is (0, 0), move is not neccesary
    path.lineTo(0, size.height);
    //Dos primeros parametros son el punto del eje de la curvatura
    //Dos ultimos parametros son el destino del lapiz
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.95, size.width * 0.35, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.45, size.width * 0.6, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.2, size.width * 0.88, 0);
    //path.quadraticBezierTo(size.width * 0.25, size.height * 1, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class WaveTwoCP extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(0, 55),
      radius: 180,
    );

    //Aplicar un gradient
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 4, 125, 4),
        Color.fromARGB(255, 43, 212, 102),
        Color.fromARGB(255, 3, 96, 57),
      ],
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    //final paint = Paint(); //Creo mi lapiz

    //Propiedades del lapiz
    //Cuando uso un SHADER se ignora el color del lapiz
    paint.color = const Color.fromARGB(255, 68, 255, 146);
    paint.style = PaintingStyle.fill; // .fill -> rellena .stroke ->linea
    paint.strokeWidth = 5;

    final path = Path();

    //Dibujar
    path.moveTo(size.width, size.height); // Default pos is (0, 0), move is not neccesary
    path.lineTo(0, size.height);
    //Dos primeros parametros son el punto del eje de la curvatura
    //Dos ultimos parametros son el destino del lapiz
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.5, size.width, size.height * 0.75);
    //path.lineTo(size.width, 0);
    //path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
