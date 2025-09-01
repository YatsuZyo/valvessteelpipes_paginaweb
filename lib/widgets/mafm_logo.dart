import 'package:flutter/material.dart';

class MafmLogo extends StatelessWidget {
  final double size;

  const MafmLogo({super.key, this.size = 400});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/LOGO MAFM grande.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}

// Logo simplificado - solo la imagen PNG
class MafmSimpleLogo extends StatelessWidget {
  final double size;

  const MafmSimpleLogo({super.key, this.size = 400});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/LOGO MAFM grande.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}

// Logo solo con imagen PNG para casos donde no se necesita texto
class MafmImageOnly extends StatelessWidget {
  final double size;

  const MafmImageOnly({super.key, this.size = 400});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/LOGO MAFM grande.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
