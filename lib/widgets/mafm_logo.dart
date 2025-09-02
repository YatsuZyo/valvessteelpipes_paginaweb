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
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        'assets/images/logomafmicono.png',
        width: size - 16,
        height: size - 16,
        fit: BoxFit.contain,
      ),
    );
  }
}
