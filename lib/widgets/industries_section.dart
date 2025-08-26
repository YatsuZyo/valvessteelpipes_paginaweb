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
              '¡Soluciones especializadas para sectores industriales críticos!',
              style: AppTheme.subtitle1.copyWith(color: AppTheme.metallicGray),
            ),
          ),
          const SizedBox(height: 60),

          // Grid de industrias
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1000) {
                return _buildWideGrid();
              } else if (constraints.maxWidth > 600) {
                return _buildNarrowGrid();
              } else {
                return _buildMobileGrid();
              }
            },
          ),

          const SizedBox(height: 80),

          // Sección de marcas
          Column(
            children: [
              Text(
                'Marcas que Representamos',
                style: AppTheme.heading2.copyWith(color: AppTheme.primaryBlue),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Trabajamos con las marcas más reconocidas del mercado',
                  style: AppTheme.subtitle1.copyWith(
                    color: AppTheme.metallicGray,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _BrandsCarousel(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWideGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildIndustryCard(_industries[0])),
        const SizedBox(width: 24),
        Expanded(child: _buildIndustryCard(_industries[1])),
        const SizedBox(width: 24),
        Expanded(child: _buildIndustryCard(_industries[2])),
      ],
    );
  }

  Widget _buildNarrowGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildIndustryCard(_industries[0])),
            const SizedBox(width: 24),
            Expanded(child: _buildIndustryCard(_industries[1])),
          ],
        ),
        const SizedBox(height: 24),
        Row(children: [Expanded(child: _buildIndustryCard(_industries[2]))]),
      ],
    );
  }

  Widget _buildMobileGrid() {
    return Column(
      children:
          _industries.map((industry) => _buildIndustryCard(industry)).toList(),
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
        'Soluciones integrales para plataformas offshore, refinerías, oleoductos y estaciones de compresión. Válvulas y tuberías certificadas para operaciones críticas en entornos de alta presión y temperatura.',
    icon: Icons.local_gas_station,
  ),
  IndustryData(
    name: 'Petroquímica',
    description:
        'Equipos especializados para plantas químicas, procesos de craqueo, reformado y síntesis. Válvulas resistentes a la corrosión y tuberías para manejo de productos químicos agresivos.',
    icon: Icons.science,
  ),
  IndustryData(
    name: 'Hidrológicas',
    description:
        'Sistemas completos para plantas de tratamiento de agua, presas, canales de riego y sistemas de distribución. Válvulas de control de flujo y tuberías para infraestructura hidráulica.',
    icon: Icons.water_drop,
  ),
];

class _BrandsCarousel extends StatefulWidget {
  const _BrandsCarousel();

  @override
  State<_BrandsCarousel> createState() => _BrandsCarouselState();
}

class _BrandsCarouselState extends State<_BrandsCarousel>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Auto-scroll cada 3 segundos
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        final int totalPages =
            (_brands.length /
                    (MediaQuery.of(context).size.width <= 600 ? 2 : 4))
                .ceil();

        if (_currentPage < totalPages - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth <= 600;
        final int itemsPerPage = isMobile ? 2 : 4;

        return Column(
          children: [
            SizedBox(
              height: 120,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: (_brands.length / itemsPerPage).ceil(),
                itemBuilder: (context, pageIndex) {
                  final startIndex = pageIndex * itemsPerPage;
                  final endIndex = (startIndex + itemsPerPage).clamp(
                    0,
                    _brands.length,
                  );
                  final pageBrands = _brands.sublist(startIndex, endIndex);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        pageBrands.map((brand) {
                          return Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              height: 80,
                              decoration: BoxDecoration(
                                color: AppTheme.pureWhite,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.primaryBlue.withOpacity(
                                      0.1,
                                    ),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Image.asset(
                                  brand.imagePath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            // Indicadores de página
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                (_brands.length / (constraints.maxWidth <= 600 ? 2 : 4)).ceil(),
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index
                            ? AppTheme.accentBlue
                            : AppTheme.lightGray,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class BrandData {
  final String name;
  final String imagePath;

  const BrandData({required this.name, required this.imagePath});
}

final List<BrandData> _brands = [
  BrandData(
    name: 'Swagelok',
    imagePath: 'assets/images/brands/swagelok-logo__1_-removebg-preview.png',
  ),
  BrandData(
    name: 'Morris Valves',
    imagePath: 'assets/images/brands/morrisvalves_logo-removebg-preview.png',
  ),
  BrandData(
    name: 'ICP Valves',
    imagePath: 'assets/images/brands/icpvalves_logo__1_-removebg-preview.png',
  ),
  BrandData(
    name: 'TTV',
    imagePath: 'assets/images/brands/ttv_logo-removebg-preview.png',
  ),
  BrandData(
    name: 'TOSACA',
    imagePath: 'assets/images/brands/tosaca_logo-removebg-preview.png',
  ),
  BrandData(name: 'HGSP', imagePath: 'assets/images/brands/Hgsp_logo2.png'),
  BrandData(
    name: 'JC Valves',
    imagePath: 'assets/images/brands/jcvalves_logo2.png',
  ),
  BrandData(
    name: 'Actrec',
    imagePath: 'assets/images/brands/actrec_logo-removebg-preview.png',
  ),
  BrandData(
    name: 'Alloy & Stainless',
    imagePath:
        'assets/images/brands/alloy-and-stainless-fasteners-inc-logo-vector__1_-removebg-preview.png',
  ),
];
