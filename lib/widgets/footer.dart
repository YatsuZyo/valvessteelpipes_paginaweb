import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'mafm_logo.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
      child: Column(
        children: [
          // Contenido principal del footer
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return _buildWideLayout();
              } else {
                return _buildNarrowLayout();
              }
            },
          ),

          const SizedBox(height: 40),

          // Línea divisoria
          Container(height: 1, color: AppTheme.accentBlue.withOpacity(0.3)),

          const SizedBox(height: 30),

          // Derechos de autor y enlaces legales
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '© 2025 MAFM VALVES & STEEL PIPES C.A. Todos los derechos reservados. RIF: J-408267160 ',
                        style: AppTheme.caption.copyWith(
                          color: AppTheme.pureWhite.withOpacity(0.7),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Política de Privacidad',
                            style: AppTheme.caption.copyWith(
                              color: AppTheme.pureWhite.withOpacity(0.7),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Términos de Servicio',
                            style: AppTheme.caption.copyWith(
                              color: AppTheme.pureWhite.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '© 2025 MAFM VALVES & STEEL PIPES C.A. Todos los derechos reservados. RIF: J-408267160 ',
                      style: AppTheme.caption.copyWith(
                        color: AppTheme.pureWhite.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Política de Privacidad',
                            style: AppTheme.caption.copyWith(
                              color: AppTheme.pureWhite.withOpacity(0.7),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Términos de Servicio',
                            style: AppTheme.caption.copyWith(
                              color: AppTheme.pureWhite.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),

          const SizedBox(height: 20),

          // Crédito de desarrollo
          Center(
            child: Text(
              'Developed by @dev.zyo',
              style: AppTheme.caption.copyWith(
                color: AppTheme.pureWhite.withOpacity(0.5),
                fontSize: 10,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Información de la empresa
        Expanded(flex: 2, child: _buildCompanyInfo()),

        const SizedBox(width: 40),

        // Enlaces rápidos
        Expanded(flex: 1, child: _buildQuickLinks()),

        const SizedBox(width: 40),

        // Servicios
        Expanded(flex: 1, child: _buildServicesLinks()),

        const SizedBox(width: 40),

        // Contacto
        Expanded(flex: 1, child: _buildContactInfo()),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 500) {
          return Column(
            children: [
              _buildCompanyInfo(),
              const SizedBox(height: 40),

              Row(
                children: [
                  Expanded(child: _buildQuickLinks()),
                  const SizedBox(width: 20),
                  Expanded(child: _buildServicesLinks()),
                ],
              ),
              const SizedBox(height: 40),
              _buildContactInfo(),
            ],
          );
        } else {
          return Column(
            children: [
              _buildCompanyInfo(),
              const SizedBox(height: 40),
              _buildQuickLinks(),
              const SizedBox(height: 40),
              _buildServicesLinks(),
              const SizedBox(height: 40),
              _buildContactInfo(),
            ],
          );
        }
      },
    );
  }

  Widget _buildCompanyInfo() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isVeryNarrow = constraints.maxWidth <= 400;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo y nombre
            if (isVeryNarrow)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MafmImageOnly(size: 40),
                  const SizedBox(height: 12),
                  Text(
                    'MAFM',
                    style: AppTheme.heading3.copyWith(
                      color: AppTheme.accentBlue,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'VALVES & STEEL PIPES C.A.',
                    style: AppTheme.caption.copyWith(
                      color: AppTheme.pureWhite.withOpacity(0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            else
              Row(
                children: [
                  MafmImageOnly(size: 40),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MAFM',
                        style: AppTheme.heading3.copyWith(
                          color: AppTheme.accentBlue,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'VALVES & STEEL PIPES C.A.',
                        style: AppTheme.caption.copyWith(
                          color: AppTheme.pureWhite.withOpacity(0.7),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            const SizedBox(height: 20),

            // Descripción
            Text(
              'Especialistas en válvulas industriales y tuberías de acero de la más alta calidad para las industrias más exigentes del mercado.',
              style: AppTheme.bodyText2.copyWith(
                color: AppTheme.pureWhite.withOpacity(0.8),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            // Redes sociales
            if (isVeryNarrow)
              Column(
                children: [
                  _buildSocialIcon(Icons.camera_alt, () {}, 'Instagram'),
                  const SizedBox(height: 12),
                  _buildSocialIcon(Icons.business, () {}, 'LinkedIn'),
                  const SizedBox(height: 12),
                  _buildSocialIcon(Icons.email, () {}, 'Email'),
                ],
              )
            else
              Row(
                children: [
                  _buildSocialIcon(Icons.camera_alt, () {}, 'Instagram'),
                  const SizedBox(width: 16),
                  _buildSocialIcon(Icons.business, () {}, 'LinkedIn'),
                  const SizedBox(width: 16),
                  _buildSocialIcon(Icons.email, () {}, 'Email'),
                ],
              ),
          ],
        );
      },
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enlaces Rápidos',
          style: AppTheme.subtitle2.copyWith(
            color: AppTheme.pureWhite,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),

        _buildFooterLink('Inicio', () {}),
        _buildFooterLink('Servicios', () {}),
        _buildFooterLink('Industrias', () {}),
        _buildFooterLink('Nosotros', () {}),
        _buildFooterLink('Contacto', () {}),
      ],
    );
  }

  Widget _buildServicesLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Servicios',
          style: AppTheme.subtitle2.copyWith(
            color: AppTheme.pureWhite,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),

        _buildFooterLink('Válvulas Industriales', () {}),
        _buildFooterLink('Tuberías de Acero', () {}),
        _buildFooterLink('Accesorios', () {}),
        _buildFooterLink('Servicios de Ingeniería', () {}),
        _buildFooterLink('Mantenimiento', () {}),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contacto',
          style: AppTheme.subtitle2.copyWith(
            color: AppTheme.pureWhite,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),

        _buildContactItem(Icons.phone, '+58 414 205 8090'),
        _buildContactItem(Icons.phone, '+58 412 922 4402'),
        _buildContactItem(Icons.camera_alt, '@mafmvalves'),
        _buildContactItem(Icons.access_time, 'Lun-Vie: 8AM-6PM'),
      ],
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: AppTheme.bodyText2.copyWith(
            color: AppTheme.pureWhite.withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.accentBlue, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTheme.bodyText2.copyWith(
                color: AppTheme.pureWhite.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap, String tooltip) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppTheme.accentBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppTheme.accentBlue.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Icon(icon, color: AppTheme.accentBlue, size: 18),
      ),
    );
  }
}
