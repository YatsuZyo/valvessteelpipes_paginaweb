import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: const BoxDecoration(gradient: AppTheme.subtleGradient),
      child: Column(
        children: [
          // Título de la sección
          Text(
            'Nuestros Servicios',
            style: AppTheme.heading2.copyWith(color: AppTheme.primaryBlue),
          ),
          const SizedBox(height: 16),

          // Subtítulo
          Center(
            child: Text(
              '¡Soluciones integrales en válvulas y tuberías de acero para industrias exigentes!',
              style: AppTheme.subtitle1.copyWith(color: AppTheme.metallicGray),
            ),
          ),
          const SizedBox(height: 60),

          // Grid de servicios
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1200) {
                return _buildWideGrid();
              } else if (constraints.maxWidth > 800) {
                return _buildMediumGrid();
              } else {
                return _buildNarrowGrid();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWideGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildServiceCard(_services[0])),
        const SizedBox(width: 24),
        Expanded(child: _buildServiceCard(_services[1])),
        const SizedBox(width: 24),
        Expanded(child: _buildServiceCard(_services[2])),
        const SizedBox(width: 24),
        Expanded(child: _buildServiceCard(_services[3])),
      ],
    );
  }

  Widget _buildMediumGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildServiceCard(_services[0])),
            const SizedBox(width: 24),
            Expanded(child: _buildServiceCard(_services[1])),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _buildServiceCard(_services[2])),
            const SizedBox(width: 24),
            Expanded(child: _buildServiceCard(_services[3])),
          ],
        ),
      ],
    );
  }

  Widget _buildNarrowGrid() {
    return Column(
      children: [
        _buildServiceCard(_services[0]),
        const SizedBox(height: 24),
        _buildServiceCard(_services[1]),
        const SizedBox(height: 24),
        _buildServiceCard(_services[2]),
        const SizedBox(height: 24),
        _buildServiceCard(_services[3]),
      ],
    );
  }

  Widget _buildServiceCard(ServiceData service) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono del servicio
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: AppTheme.accentGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(service.icon, color: AppTheme.pureWhite, size: 28),
            ),
            const SizedBox(height: 20),

            // Título del servicio
            Text(
              service.title,
              style: AppTheme.heading3.copyWith(
                color: AppTheme.primaryBlue,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 12),

            // Descripción
            Text(
              service.description,
              style: AppTheme.bodyText1.copyWith(
                color: AppTheme.metallicGray,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),

            // Características
            ...service.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppTheme.accentBlue,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: AppTheme.bodyText2.copyWith(
                          color: AppTheme.darkGray,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Botón de acción
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.accentBlue,
                  side: const BorderSide(color: AppTheme.accentBlue),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Saber Más'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceData {
  final String title;
  final String description;
  final IconData icon;
  final List<String> features;

  const ServiceData({
    required this.title,
    required this.description,
    required this.icon,
    required this.features,
  });
}

final List<ServiceData> _services = [
  ServiceData(
    title: 'Válvulas Industriales',
    description:
        'Fabricación y distribución de válvulas de compuerta, globo, mariposa y bola para aplicaciones industriales críticas.',
    icon: Icons.precision_manufacturing,
    features: [
      'Válvulas de compuerta y globo',
      'Válvulas de mariposa y bola',
      'Presiones hasta 6000 PSI',
      'Temperaturas -196°C a +800°C',
    ],
  ),
  ServiceData(
    title: 'Tuberías de Acero',
    description:
        'Tuberías de acero inoxidable, carbono y aleaciones especiales para sistemas de alta presión y corrosión.',
    icon: Icons.straighten,
    features: [
      'Acero inoxidable 304/316',
      'Acero carbono ASTM A53',
      'Aleaciones especiales',
      'Diámetros 1/2" a 48"',
    ],
  ),
  ServiceData(
    title: 'Accesorios y Conexiones',
    description:
        'Codos, tees, reducciones y bridas de alta calidad para completar sus sistemas de tuberías.',
    icon: Icons.construction,
    features: [
      'Codos 90° y 45°',
      'Tees y reducciones',
      'Bridas ANSI/ASME',
      'Soldadura y roscado',
    ],
  ),
  ServiceData(
    title: 'Servicios de Ingeniería',
    description:
        'Diseño, cálculo y asesoría técnica especializada para proyectos complejos de válvulas y tuberías.',
    icon: Icons.engineering,
    features: [
      'Cálculos de presión',
      'Diseño de sistemas',
      'Asesoría técnica',
      'Certificaciones API/ASME',
    ],
  ),
];
