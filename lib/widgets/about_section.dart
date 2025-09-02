import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: const BoxDecoration(gradient: AppTheme.subtleGradient),
      child: Column(
        children: [
          // Título de la sección
          Text('SOBRE NOSOTROS', style: AppTheme.heading2),
          const SizedBox(height: 16),

          // Subtítulo
          Center(
            child: Text(
              '¡Más de 9 años en la comercialización de tuberías, válvulas, actuadores y conexiones de acero al carbono e inoxidable!',
              style: AppTheme.subtitle1.copyWith(color: AppTheme.metallicGray),
            ),
          ),
          const SizedBox(height: 60),

          // Contenido principal
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1000) {
                return _buildWideLayout();
              } else {
                return _buildNarrowLayout();
              }
            },
          ),

          const SizedBox(height: 60),

          // Valores de la empresa
          _buildValuesSection(),
        ],
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Columna izquierda - Información de la empresa
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCompanyInfo(),
              const SizedBox(height: 40),
              _buildMissionVision(),
            ],
          ),
        ),

        const SizedBox(width: 60),

        // Columna derecha - Logo de MAFM
        Expanded(flex: 1, child: _buildCompanyLogo()),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      children: [
        _buildCompanyInfo(),
        const SizedBox(height: 40),
        _buildCompanyLogo(),
        const SizedBox(height: 40),
        _buildMissionVision(),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MAFM VALVES & STEEL PIPES C.A.',
          style: AppTheme.heading3.copyWith(
            color: AppTheme.titleGray,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 16),

        Text(
          'Somos una empresa venezolana líder, especializada en la importación y comercialización de materiales y equipos de alta gama para los sectores más exigentes del país. Nos enorgullece ser un suplidor estratégico para la industria de Oil & Gas, petroquímica e hidrológica, proporcionando soluciones integrales que garantizan la eficiencia y seguridad en cada proyecto de la mano de nuestros mejores profesionales. Desde nuestros inicios en 2016, nos hemos dedicado a proporcionar soluciones integrales para las industrias más exigentes del mercado.',
          style: AppTheme.bodyText1.copyWith(
            color: AppTheme.darkGray,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 24),

        Text(
          'Nuestro compromiso con la excelencia y la innovación nos ha permitido convertirnos en un referente en el sector, ofreciendo productos que cumplen con los más altos estándares internacionales de calidad y seguridad.',
          style: AppTheme.bodyText1.copyWith(
            color: AppTheme.darkGray,
            height: 1.7,
          ),
        ),
      ],
    );
  }

  Widget _buildMissionVision() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Misión
        _buildMissionVisionCard(
          title: 'Misión',
          description:
              'Proporcionar soluciones integrales para los sistemas de transimisión de fluidos suministrando materiales de la más alta calidad certificada contribuyendo al desarrollo eficiente de las industrias venezolanas o extranjeras del sector.',
          icon: Icons.flag,
          color: AppTheme.primaryBlue,
        ),

        const SizedBox(height: 20),

        // Visión
        _buildMissionVisionCard(
          title: 'Visión',
          description:
              'Comercialización y distribución de materiales necesarios para la transimisión de fluidos, tuberías, válvulas y conexiones para consolidar nuestra presencia en el mercado nacional.',
          icon: Icons.visibility,
          color: AppTheme.primaryBlue,
        ),
      ],
    );
  }

  Widget _buildMissionVisionCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.pureWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.subtitle1.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: AppTheme.bodyText2.copyWith(
                    color: AppTheme.metallicGray,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyLogo() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentBlue.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/Fondos/Imagen stock de valvulas (1).png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildValuesSection() {
    return Column(
      children: [
        Text(
          'NUESTROS VALORES',
          style: AppTheme.heading3.copyWith(color: AppTheme.titleGray),
        ),
        const SizedBox(height: 40),

        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return _buildValuesGrid();
            } else {
              return _buildValuesColumn();
            }
          },
        ),
      ],
    );
  }

  Widget _buildValuesGrid() {
    return Row(
      children: [
        Expanded(child: _buildValueCard(_values[0])),
        const SizedBox(width: 24),
        Expanded(child: _buildValueCard(_values[1])),
        const SizedBox(width: 24),
        Expanded(child: _buildValueCard(_values[2])),
        const SizedBox(width: 24),
        Expanded(child: _buildValueCard(_values[3])),
      ],
    );
  }

  Widget _buildValuesColumn() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildValueCard(_values[0])),
            const SizedBox(width: 24),
            Expanded(child: _buildValueCard(_values[1])),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _buildValueCard(_values[2])),
            const SizedBox(width: 24),
            Expanded(child: _buildValueCard(_values[3])),
          ],
        ),
      ],
    );
  }

  Widget _buildValueCard(ValueData value) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(value.icon, color: AppTheme.accentBlue, size: 32),
            const SizedBox(height: 16),
            Center(
              child: Text(
                value.title,
                style: AppTheme.subtitle2.copyWith(
                  color: AppTheme.primaryBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                value.description,
                style: AppTheme.bodyText2.copyWith(
                  color: AppTheme.metallicGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ValueData {
  final String title;
  final String description;
  final IconData icon;

  const ValueData({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<ValueData> _values = [
  ValueData(
    title: 'Calidad',
    description:
        'Compromiso con la excelencia en cada material y producto que comercializamos.',
    icon: Icons.verified,
  ),
  ValueData(
    title: 'Puntualidad',
    description:
        'Cumplir a cabalidad con los tiempos de entrega requeridos y ofrecidos a nuestros clientes.',
    icon: Icons.lightbulb,
  ),
  ValueData(
    title: 'Confiabilidad',
    description:
        'Nos esforzamos en que nuestros materiales sean duraderos y funcionen de manera correcta y consistente a lo largo del tiempo.',
    icon: Icons.handshake,
  ),
  ValueData(
    title: 'Integridad',
    description: 'Actuamos con honestidad y transparencia en todo momento.',
    icon: Icons.favorite,
  ),
];
