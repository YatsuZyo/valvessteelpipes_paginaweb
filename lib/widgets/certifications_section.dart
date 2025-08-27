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
            'CERTIFICACIONES Y ESTÁNDARES',
            style: AppTheme.heading2.copyWith(color: AppTheme.pureWhite),
          ),
          const SizedBox(height: 16),

          // Subtítulo
          Center(
            child: Text(
              '¡Cumplimos con los más altos estándares internacionales de calidad!',
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
              } else if (constraints.maxWidth > 600) {
                return _buildNarrowGrid();
              } else {
                return _buildMobileGrid(); // Nuevo grid para móviles
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
                    'Todas nuestras válvulas y tuberías cumplen con las especificaciones API-15L, ASTM-A234, A-105, ASTM-A53, ASTM A350LF2, ASTM A33 GRADO 6, ASME B36.10, ASTM-A182 GRADO 5/9, ASTM-A249/A269/A312/A304/316/316L/321/ALLOY 20, garantizando la máxima calidad y seguridad en sus aplicaciones industriales.',
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

  Widget _buildMobileGrid() {
    return Column(
      children: [
        _buildCertificationCard(_certifications[0]),
        const SizedBox(height: 16),
        _buildCertificationCard(_certifications[1]),
        const SizedBox(height: 16),
        _buildCertificationCard(_certifications[2]),
        const SizedBox(height: 16),
        _buildCertificationCard(_certifications[3]),
      ],
    );
  }

  Widget _buildCertificationCard(CertificationData certification) {
    return Card(
      elevation: 8,
      color: AppTheme.pureWhite,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),

            // Descripción
            Center(
              child: Text(
                certification.description,
                style: AppTheme.bodyText2.copyWith(
                  color: AppTheme.metallicGray,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
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
    name: 'API-15L',
    description:
        'Estándar para tuberías de acero al carbono para servicios de transporte de petróleo y gas natural.',
    icon: Icons.straighten,
  ),
  CertificationData(
    name: 'ASTM-A234',
    description:
        'Especificación para accesorios de acero al carbono y aleado para servicios de alta temperatura.',
    icon: Icons.precision_manufacturing,
  ),
  CertificationData(
    name: 'A-105',
    description:
        'Especificación para accesorios de acero al carbono para servicios de alta temperatura y presión.',
    icon: Icons.construction,
  ),
  CertificationData(
    name: 'ASME B36.10',
    description:
        'Estándar para dimensiones de tuberías de acero al carbono y aleado para servicios industriales.',
    icon: Icons.engineering,
  ),
];
