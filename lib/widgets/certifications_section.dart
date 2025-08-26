import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
      child: Column(
        children: [
          // Título de la sección
          Text(
            'Certificaciones y Estándares',
            style: AppTheme.heading2.copyWith(color: AppTheme.pureWhite),
          ),
          const SizedBox(height: 16),

          // Subtítulo
          Center(
            child: Text(
              'Cumplimos con los más altos estándares internacionales de calidad',
              style: AppTheme.subtitle1.copyWith(
                color: AppTheme.pureWhite.withOpacity(0.9),
              ),
            ),
          ),
          const SizedBox(height: 60),

          // Grid de certificaciones
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1000) {
                return _buildWideGrid();
              } else {
                return _buildNarrowGrid();
              }
            },
          ),

          const SizedBox(height: 60),

          // Mensaje adicional
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.accentBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.accentBlue.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.verified, color: AppTheme.accentBlue, size: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Todas nuestras válvulas y tuberías cumplen con las especificaciones API, ASME, ASTM y ANSI, garantizando la máxima calidad y seguridad en sus aplicaciones industriales.',
                    style: AppTheme.bodyText1.copyWith(
                      color: AppTheme.pureWhite,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideGrid() {
    return Row(
      children: [
        Expanded(child: _buildCertificationCard(_certifications[0])),
        const SizedBox(width: 24),
        Expanded(child: _buildCertificationCard(_certifications[1])),
        const SizedBox(width: 24),
        Expanded(child: _buildCertificationCard(_certifications[2])),
        const SizedBox(width: 24),
        Expanded(child: _buildCertificationCard(_certifications[3])),
      ],
    );
  }

  Widget _buildNarrowGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[0])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[1])),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[2])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[3])),
          ],
        ),
      ],
    );
  }

  Widget _buildCertificationCard(CertificationData certification) {
    return Container(
      height: 200,
      child: Card(
        elevation: 8,
        color: AppTheme.pureWhite,
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono de la certificación
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.accentBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  certification.icon,
                  color: AppTheme.accentBlue,
                  size: 28,
                ),
              ),
              const SizedBox(height: 16),

              // Título de la certificación
              Center(
                child: Text(
                  certification.name,
                  style: AppTheme.subtitle1.copyWith(
                    color: AppTheme.primaryBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Descripción
              Center(
                child: Text(
                  certification.description,
                  style: AppTheme.bodyText2.copyWith(
                    color: AppTheme.metallicGray,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CertificationData {
  final String name;
  final String description;
  final IconData icon;

  const CertificationData({
    required this.name,
    required this.description,
    required this.icon,
  });
}

final List<CertificationData> _certifications = [
  CertificationData(
    name: 'API 6D',
    description:
        'Estándar para válvulas de compuerta, globo y verificación para servicios de petróleo y gas natural.',
    icon: Icons.verified_user,
  ),
  CertificationData(
    name: 'ASME B16.34',
    description:
        'Estándar para válvulas de acero con bridas, roscadas y soldadas para servicios de alta presión.',
    icon: Icons.security,
  ),
  CertificationData(
    name: 'ASTM A53',
    description:
        'Especificación para tuberías de acero al carbono para servicios de alta temperatura.',
    icon: Icons.science,
  ),
  CertificationData(
    name: 'ANSI B16.5',
    description:
        'Estándar para bridas de acero y aleaciones para servicios de alta presión.',
    icon: Icons.engineering,
  ),
];
