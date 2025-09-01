import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;

  const HeroSection({super.key, required this.onContactTap});

  Future<void> _launchCatalog() async {
    final url =
        'https://drive.google.com/file/d/16bN5Ln2gQgF8yfNQJ8B6zY6L-HSd1YfO/view?usp=sharing';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTablet =
            constraints.maxWidth <= 1000 && constraints.maxWidth > 600;
        final bool isMobile = constraints.maxWidth <= 600;

        final double titleSize = isMobile ? 28 : (isTablet ? 40 : 52);
        final double bodySize = isMobile ? 14 : (isTablet ? 16 : 20);
        final double statsGap = isMobile ? 28 : 60;
        final EdgeInsets contentPadding = EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 24,
        );

        return Container(
          height: isMobile ? 520 : 600,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppTheme.primaryBlue, AppTheme.secondaryBlue],
            ),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/Fondos/Imagen stock de valvulas (1).png',
              ),
              fit: BoxFit.cover,
              opacity: 0.22,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(painter: _HeroPatternPainter()),
              ),
              Container(
                padding: contentPadding,
                child:
                    isMobile
                        ? _MobileContent(
                          titleSize: titleSize,
                          bodySize: bodySize,
                          statsGap: statsGap,
                          onCatalogTap: _launchCatalog,
                        )
                        : Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'VÁLVULAS, TUBERÍAS Y CONEXIONES DE ACERO AL CARBONO \nE INOXIDABLE CON ALTA CALIDAD CERTIFICADA.',
                                    style: AppTheme.heading1.copyWith(
                                      color: AppTheme.pureWhite,
                                      height: 1.06,
                                      fontSize: titleSize,
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  Text(
                                    '"Somos una empresa venezolana líder, especializada en la importación y comercialización de materiales y equipos de alta gama para los sectores más exigentes del país. Nos enorgullece ser un suplidor estratégico para la industria de Oil & Gas, petroquímica e hidrológica, proporcionando soluciones integrales que garantizan la eficiencia y seguridad en cada proyecto o proceso productivo."',
                                    style: AppTheme.bodyText1.copyWith(
                                      color: AppTheme.pureWhite.withOpacity(
                                        0.92,
                                      ),
                                      fontSize: bodySize,
                                      height: 1.6,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  SizedBox(
                                    height: 52,
                                    child: OutlinedButton(
                                      onPressed: _launchCatalog,
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
                                  SizedBox(height: statsGap),
                                  Row(
                                    children: const [
                                      _StatItem(
                                        number: '9+',
                                        label: 'Años de Experiencia',
                                        icon: Icons.work_history,
                                      ),
                                      SizedBox(width: 40),
                                      /*_StatItem(
                                        number: '500+',
                                        label: 'Proyectos Completados',
                                      ),*/
                                      _StatItem(
                                        number: '24/7',
                                        label: 'Atención',
                                        icon: Icons.support_agent,
                                      ),
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
      },
    );
  }
}

class _MobileContent extends StatelessWidget {
  final double titleSize;
  final double bodySize;
  final double statsGap;
  final VoidCallback onCatalogTap;

  const _MobileContent({
    required this.titleSize,
    required this.bodySize,
    required this.statsGap,
    required this.onCatalogTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VÁLVULAS, TUBERÍAS Y CONEXIONES DE ACERO AL CARBONO E INOXIDABLE CON ALTA CALIDAD CERTIFICADA.',
          style: AppTheme.heading1.copyWith(
            color: AppTheme.pureWhite,
            height: 1.06,
            fontSize: titleSize,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '"Somos una empresa venezolana líder, especializada en la importación y comercialización de materiales y equipos de alta gama para los sectores más exigentes del país. Nos enorgullece ser un suplidor estratégico para la industria de Oil & Gas, petroquímica e hidrológica, proporcionando soluciones integrales que garantizan la eficiencia y seguridad en cada proyecto."',
          style: AppTheme.bodyText1.copyWith(
            color: AppTheme.pureWhite.withOpacity(0.92),
            fontSize: bodySize,
            height: 1.55,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            onPressed: onCatalogTap,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.pureWhite,
              side: const BorderSide(color: AppTheme.pureWhite, width: 2),
              textStyle: AppTheme.buttonText.copyWith(fontSize: 16),
            ),
            child: const Text('Ver Catálogo'),
          ),
        ),
        SizedBox(height: statsGap),
        Row(
          children: const [
            _StatItem(
              number: '9+',
              label: 'Años de Experiencia',
              icon: Icons.work_history,
            ),
            SizedBox(width: 24),
            //_StatItem(number: '500+', label: 'Proyectos Completados'),
            _StatItem(
              number: '24/7',
              label: 'Atención',
              icon: Icons.support_agent,
            ),
          ],
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatItem({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.accentBlue, size: 24),
        const SizedBox(width: 8),
        Column(
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
