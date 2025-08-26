import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;

  const HeroSection({super.key, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.primaryBlue, AppTheme.secondaryBlue],
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/Fondos/hero_bg.jpg'),
          fit: BoxFit.cover,
          opacity: 0.22,
        ),
      ),
      child: Stack(
        children: [
          // Patrón de fondo sutil (opcional, puede mantenerse)
          Positioned.fill(child: CustomPaint(painter: _HeroPatternPainter())),

          // Contenido principal
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // Texto principal (ocupa todo el ancho)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título principal (más grande)
                      Text(
                        'Válvulas y Tuberías\nde Acero de Alta\nCalidad',
                        style: AppTheme.heading1.copyWith(
                          color: AppTheme.pureWhite,
                          height: 1.06,
                          fontSize: 64,
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Subtítulo (más grande)
                      Text(
                        'Somos una empresa venezolana líder, especializada en la importación y comercialización de materiales y equipos de alta gama para los sectores más exigentes del país. Nos enorgullece ser un socio estratégico para la industria de Oil & Gas, petroquímica e hidrológica, proporcionando soluciones integrales que garantizan la eficiencia y seguridad en cada proyecto.',
                        style: AppTheme.bodyText1.copyWith(
                          color: AppTheme.pureWhite.withOpacity(0.92),
                          fontSize: 20,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 44),

                      // Botón único: Ver Catálogo (más largo)
                      SizedBox(
                        height: 56,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.pureWhite,
                            side: const BorderSide(
                              color: AppTheme.pureWhite,
                              width: 2,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 18,
                            ),
                            textStyle: AppTheme.buttonText.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          child: const Text('Ver Catálogo'),
                        ),
                      ),

                      // Estadísticas rápidas
                      const SizedBox(height: 60),
                      Wrap(
                        spacing: 40,
                        runSpacing: 16,
                        children: const [
                          _StatItem(
                            number: '15+',
                            label: 'Años de Experiencia',
                          ),
                          _StatItem(
                            number: '500+',
                            label: 'Proyectos Completados',
                          ),
                          _StatItem(number: '24/7', label: 'Soporte Técnico'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: AppTheme.heading2.copyWith(
            color: AppTheme.accentBlue,
            fontSize: 36,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppTheme.bodyText2.copyWith(
            color: AppTheme.pureWhite.withOpacity(0.85),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _HeroPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppTheme.accentBlue.withOpacity(0.05)
          ..strokeWidth = 1;

    for (int i = 0; i < size.width; i += 40) {
      canvas.drawLine(
        Offset(i.toDouble(), 0),
        Offset(i + 40, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
