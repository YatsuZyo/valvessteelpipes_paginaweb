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
              '¡Nuestros productos cumplen con los más altos estándares de calidad internacionales!',
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
                    'Todas nuestros productos cumplen con los más altos estándares internacionales incluyendo API, ASTM, ASME, ANSI, DIN, ATEX, NACE, CE e ISO, garantizando la máxima calidad, seguridad y conformidad en sus aplicaciones industriales.',
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
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[0])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[1])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[2])),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[3])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[4])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[5])),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[6])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[7])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[8])),
          ],
        ),
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
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[4])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[5])),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[6])),
            const SizedBox(width: 24),
            Expanded(child: _buildCertificationCard(_certifications[7])),
          ],
        ),
        const SizedBox(height: 24),
        Center(
          child: SizedBox(
            width: 250, // Ancho fijo para la última tarjeta en tablet
            child: _buildCertificationCard(_certifications[8]),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[0])),
            const SizedBox(width: 16),
            Expanded(child: _buildCertificationCard(_certifications[1])),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[2])),
            const SizedBox(width: 16),
            Expanded(child: _buildCertificationCard(_certifications[3])),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[4])),
            const SizedBox(width: 16),
            Expanded(child: _buildCertificationCard(_certifications[5])),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildCertificationCard(_certifications[6])),
            const SizedBox(width: 16),
            Expanded(child: _buildCertificationCard(_certifications[7])),
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            width: 200, // Ancho fijo para la última tarjeta
            child: _buildCertificationCard(_certifications[8]),
          ),
        ),
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
  // Certificaciones principales (generales)
  CertificationData(
    name: 'API',
    description:
        'American Petroleum Institute - Estándares para equipos y materiales del sector petrolero y gasífero.',
    icon: Icons.local_gas_station,
  ),
  CertificationData(
    name: 'ASTM',
    description:
        'American Society for Testing and Materials - Estándares para materiales y métodos de prueba.',
    icon: Icons.science,
  ),
  CertificationData(
    name: 'ASME',
    description:
        'American Society of Mechanical Engineers - Códigos y estándares para equipos de presión.',
    icon: Icons.engineering,
  ),
  CertificationData(
    name: 'ANSI',
    description:
        'American National Standards Institute - Estándares nacionales para productos y servicios.',
    icon: Icons.verified_user,
  ),
  CertificationData(
    name: 'DIN',
    description:
        'Deutsches Institut für Normung - Estándares alemanes para productos industriales.',
    icon: Icons.precision_manufacturing,
  ),
  CertificationData(
    name: 'ATEX',
    description:
        'Atmosphères Explosibles - Directiva europea para equipos en atmósferas explosivas.',
    icon: Icons.security,
  ),
  CertificationData(
    name: 'NACE',
    description:
        'National Association of Corrosion Engineers - Estándares para control de corrosión.',
    icon: Icons.shield,
  ),
  CertificationData(
    name: 'CE',
    description:
        'Conformité Européenne - Marcado de conformidad para productos en el mercado europeo.',
    icon: Icons.check_circle,
  ),
  CertificationData(
    name: 'ISO',
    description:
        'International Organization for Standardization - Estándares internacionales de calidad.',
    icon: Icons.public,
  ),
];
