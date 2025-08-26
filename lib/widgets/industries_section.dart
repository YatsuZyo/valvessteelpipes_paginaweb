import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class IndustriesSection extends StatelessWidget {
  const IndustriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          // Título de la sección
          Text(
            'Industrias que Atendemos',
            style: AppTheme.heading2.copyWith(color: AppTheme.primaryBlue),
          ),
          const SizedBox(height: 16),

          // Subtítulo
          Center(
            child: Text(
              'Soluciones especializadas para sectores industriales críticos',
              style: AppTheme.subtitle1.copyWith(color: AppTheme.metallicGray),
            ),
          ),
          const SizedBox(height: 60),

          // Grid de industrias
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1000) {
                return _buildWideGrid();
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
        Expanded(child: _buildIndustryColumn(_industries.sublist(0, 3))),
        const SizedBox(width: 24),
        Expanded(child: _buildIndustryColumn(_industries.sublist(3, 6))),
        const SizedBox(width: 24),
        Expanded(child: _buildIndustryColumn(_industries.sublist(6, 9))),
      ],
    );
  }

  Widget _buildNarrowGrid() {
    return Column(
      children: [
        _buildIndustryColumn(_industries.sublist(0, 3)),
        const SizedBox(height: 24),
        _buildIndustryColumn(_industries.sublist(3, 6)),
        const SizedBox(height: 24),
        _buildIndustryColumn(_industries.sublist(6, 9)),
      ],
    );
  }

  Widget _buildIndustryColumn(List<IndustryData> industries) {
    return Column(
      children:
          industries.map((industry) => _buildIndustryCard(industry)).toList(),
    );
  }

  Widget _buildIndustryCard(IndustryData industry) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Icono de la industria
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: AppTheme.accentGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(industry.icon, color: AppTheme.pureWhite, size: 24),
              ),
              const SizedBox(width: 16),

              // Contenido
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      industry.name,
                      style: AppTheme.subtitle1.copyWith(
                        color: AppTheme.primaryBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      industry.description,
                      style: AppTheme.bodyText2.copyWith(
                        color: AppTheme.metallicGray,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IndustryData {
  final String name;
  final String description;
  final IconData icon;

  const IndustryData({
    required this.name,
    required this.description,
    required this.icon,
  });
}

final List<IndustryData> _industries = [
  IndustryData(
    name: 'Oil & Gas',
    description:
        'Válvulas y tuberías para plataformas offshore, refinerías y oleoductos.',
    icon: Icons.local_gas_station,
  ),
  IndustryData(
    name: 'Petroquímica',
    description:
        'Soluciones para plantas químicas y procesos de alta temperatura.',
    icon: Icons.science,
  ),
  IndustryData(
    name: 'Generación de Energía',
    description: 'Equipos para centrales térmicas, nucleares y renovables.',
    icon: Icons.electric_bolt,
  ),
  IndustryData(
    name: 'Minería',
    description:
        'Válvulas resistentes para extracción y procesamiento de minerales.',
    icon: Icons.diamond,
  ),
  IndustryData(
    name: 'Agua y Saneamiento',
    description: 'Sistemas para plantas de tratamiento y distribución de agua.',
    icon: Icons.water_drop,
  ),
  IndustryData(
    name: 'Alimentaria',
    description: 'Equipos sanitarios para la industria de alimentos y bebidas.',
    icon: Icons.restaurant,
  ),
  IndustryData(
    name: 'Farmacéutica',
    description: 'Válvulas de alta pureza para procesos farmacéuticos.',
    icon: Icons.medication,
  ),
  IndustryData(
    name: 'Pulpa y Papel',
    description: 'Soluciones para la industria de celulosa y papel.',
    icon: Icons.article,
  ),
  IndustryData(
    name: 'Marítima',
    description: 'Equipos para buques y estructuras marinas.',
    icon: Icons.directions_boat,
  ),
];
