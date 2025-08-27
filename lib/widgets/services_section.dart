import 'package:flutter/material.dart';
import 'dart:math' as math;
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
            'NUESTROS PRODUCTOS',
            style: AppTheme.heading2.copyWith(color: AppTheme.primaryBlue),
          ),
          const SizedBox(height: 16),

          // Subtítulo
          Center(
            child: Text(
              'Suministro especializado en válvulas, tuberías y conexiones.',
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
      elevation: 8,
      shadowColor: AppTheme.primaryBlue.withOpacity(0.15),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen o icono del producto
            if (service.imagePaths.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryBlue.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: Image.asset(
                      service.imagePaths.first,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppTheme.lightGray.withOpacity(0.2),
                          child: const Center(
                            child: Icon(Icons.image_not_supported),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            else
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

            // Título del producto
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

            // Galería adicional (si hay más de una imagen)
            if (service.imagePaths.length > 1) ...[
              const SizedBox(height: 12),
              SizedBox(
                height: 72,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // Mostrar miniaturas excluyendo la imagen de portada (index 0)
                  itemCount: math.min(
                    service.imagePaths.length > 1
                        ? service.imagePaths.length - 1
                        : 0,
                    6,
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final path = service.imagePaths[index + 1];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppTheme.lightGray.withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryBlue.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            path,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppTheme.lightGray.withOpacity(0.2),
                                child: const Icon(Icons.broken_image),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 24),
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
                child: const Text('Ver Catálogo'),
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
  final List<String> imagePaths;

  const ServiceData({
    required this.title,
    required this.description,
    required this.icon,
    required this.features,
    this.imagePaths = const [],
  });
}

final List<ServiceData> _services = [
  ServiceData(
    title: 'Válvulas Industriales',
    description:
        'Suministro de válvulas de compuerta, globo, mariposa y bola para aplicaciones industriales críticas.',
    icon: Icons.precision_manufacturing,
    features: [
      'Válvulas de compuerta y globo',
      'Válvulas de mariposa y bola',
      'Presiones hasta 6000 PSI',
      'Temperaturas -196°C a +800°C',
    ],
    imagePaths: [
      'assets/images/products/valvulas_1.png',
      'assets/images/products/valvulas_2.png',
      'assets/images/products/valvulas_3.png',
      'assets/images/products/valvulas_4.png',
      'assets/images/products/valvulas_5.png',
      'assets/images/products/valvulas_6.png',
    ],
  ),
  ServiceData(
    title: 'Tuberías de Acero',
    description:
        'Suministro de tuberías para procesos industriales exigentes con múltiples materiales, conexiones y rangos de presión.',
    icon: Icons.straighten,
    features: [
      'Tipo de tubería: acero al carbono, acero inoxidable, cobre',
      'Presiones: 150 a 10.000 PSI',
      'Conexiones: Butt Weld, Socket Weld, NPT',
      'Diámetros: 1/8" a 30"',
    ],
    imagePaths: [
      'assets/images/products/tuberias_1.png',
      'assets/images/products/tuberias_2.png',
      'assets/images/products/tuberias_3.png',
      'assets/images/products/tuberias_4.png',
      'assets/images/products/tuberias_5.png',
    ],
  ),
  ServiceData(
    title: 'Accesorios y Conexiones',
    description:
        'Codos, tees, reducciones y bridas de alta calidad para sistemas de tuberías.',
    icon: Icons.construction,
    features: [
      'Codos 90° y 45°',
      'Tees y reducciones',
      'Bridas ANSI/ASME',
      'Soldadura y roscado',
    ],
    imagePaths: [
      'assets/images/products/conectores_1.jpg',
      'assets/images/products/conectores_2.png',
      'assets/images/products/conectores_3.png',
      'assets/images/products/conectores_4.png',
      'assets/images/products/conectores_5.png',
      'assets/images/products/conectores_6.png',
    ],
  ),
  ServiceData(
    title: 'Actuadores Hidráulicos y Neumáticos',
    description:
        'Automatización de válvulas con actuadores hidráulicos y neumáticos para control preciso y confiable.',
    icon: Icons.settings,
    features: [
      'Actuadores Rack & Piñón',
      'Actuadores de Yugo Escocés (Scotch Yoke)',
      'Neumáticos',
      'Hidráulicos',
      'Alta presión',
      'Compactos',
      'Actuadores especiales',
    ],
    imagePaths: [
      'assets/images/products/actuadores_1.png',
      'assets/images/products/actuadores_2.png',
      'assets/images/products/actuadores_3.png',
      'assets/images/products/actuadores_4.png',
      'assets/images/products/actuadores_5.png',
      'assets/images/products/actuadores_6.png',
    ],
  ),
];
