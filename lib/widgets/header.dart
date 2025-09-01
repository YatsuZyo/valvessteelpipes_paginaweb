import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'mafm_logo.dart';

class Header extends StatefulWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onServicesTap;
  final VoidCallback onIndustriesTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;
  final bool isMenuOpen;
  final VoidCallback onMenuToggle;

  const Header({
    super.key,
    required this.onHomeTap,
    required this.onServicesTap,
    required this.onIndustriesTap,
    required this.onAboutTap,
    required this.onContactTap,
    required this.isMenuOpen,
    required this.onMenuToggle,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTablet =
            constraints.maxWidth <= 1000 && constraints.maxWidth > 600;
        final bool isMobile = constraints.maxWidth <= 600;
        final double logoSize = isMobile ? 120 : (isTablet ? 160 : 220);
        final EdgeInsets horizontalPadding = EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 24,
        );

        return ClipPath(
          clipper: _HeaderClipper(),
          child: Container(
            height: 80,
            padding: horizontalPadding,
            decoration: BoxDecoration(
              color: AppTheme.pureWhite.withOpacity(0.95),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Logo
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: MafmLogo(size: logoSize),
                  ),
                ),

                // Navegación
                Expanded(
                  flex: 4,
                  child:
                      isMobile
                          ? _buildMobileNavigation()
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Navegación normal
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _NavItem(
                                          title: 'Inicio',
                                          onTap: widget.onHomeTap,
                                        ),
                                        _NavItem(
                                          title: 'Productos',
                                          onTap: widget.onServicesTap,
                                        ),
                                        _NavItem(
                                          title: 'Industrias',
                                          onTap: widget.onIndustriesTap,
                                        ),
                                        _NavItem(
                                          title: 'Nosotros',
                                          onTap: widget.onAboutTap,
                                        ),
                                        _NavItem(
                                          title: 'Contacto',
                                          onTap: widget.onContactTap,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                ),

                // Botón de WhatsApp (solo en desktop/tablet)
                if (!isMobile)
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _ContactButton(
                          icon: null,
                          customIcon: 'assets/icons/whatsapp_icon.png',
                          label: '¡Contáctanos!',
                          onTap: () => _launchWhatsApp(),
                          color: const Color(0xFF25D366),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: widget.onMenuToggle,
          icon: Icon(
            widget.isMenuOpen ? Icons.close : Icons.menu,
            color: AppTheme.titleGray,
            size: 24,
          ),
        ),
      ],
    );
  }

  Future<void> _launchWhatsApp() async {
    final url =
        'https://wa.me/584142058090?text=Hola,%20me%20interesa%20conocer%20más%20sobre%20sus%20servicios%20de%20válvulas%20y%20tuberías.';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            style: AppTheme.subtitle2.copyWith(
              color: AppTheme.metallicGray,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final IconData? icon; // Changed to IconData?
  final String? customIcon; // Added customIcon
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _ContactButton({
    this.icon, // Changed to this.icon
    this.customIcon, // Added this.customIcon
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) Icon(icon, color: AppTheme.pureWhite, size: 16),
            if (customIcon != null)
              Image.asset(
                customIcon!,
                height: 14,
                width: 14,
                color: AppTheme.pureWhite,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback al icono de Material si falla el asset personalizado
                  return Icon(
                    Icons.chat_bubble,
                    color: AppTheme.pureWhite,
                    size: 14,
                  );
                },
              ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTheme.caption.copyWith(
                color: AppTheme.pureWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Inicio en la esquina superior izquierda
    path.moveTo(0, 0);

    // Línea superior
    path.lineTo(size.width, 0);

    // Línea derecha hasta el punto de curvatura
    path.lineTo(size.width, size.height * 0.85);

    // Curvatura sutil en la parte inferior derecha
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width * 0.5,
      size.height,
    );

    // Curvatura sutil en la parte inferior izquierda
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      0,
      size.height * 0.85,
    );

    // Línea izquierda hasta el inicio
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _MobileNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MobileNavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        hoverColor: AppTheme.lightBlue.withOpacity(0.1),
        splashColor: AppTheme.accentBlue.withOpacity(0.2),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: AppTheme.accentBlue.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: Text(
            title,
            style: AppTheme.subtitle2.copyWith(
              color: AppTheme.titleGray,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class MobileMenuOverlay extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onClose;
  final VoidCallback onHomeTap;
  final VoidCallback onServicesTap;
  final VoidCallback onIndustriesTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;
  final VoidCallback onWhatsAppTap;

  const MobileMenuOverlay({
    super.key,
    required this.isOpen,
    required this.onClose,
    required this.onHomeTap,
    required this.onServicesTap,
    required this.onIndustriesTap,
    required this.onAboutTap,
    required this.onContactTap,
    required this.onWhatsAppTap,
  });

  @override
  Widget build(BuildContext context) {
    if (!isOpen) return const SizedBox.shrink();

    return Positioned.fill(
      child: Stack(
        children: [
          // Overlay de fondo
          GestureDetector(
            onTap: onClose,
            child: Container(color: AppTheme.primaryBlue.withOpacity(0.4)),
          ),

          // Menú lateral desde la derecha
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: 280,
              decoration: BoxDecoration(
                color: AppTheme.pureWhite.withOpacity(0.95),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryBlue.withOpacity(0.3),
                    blurRadius: 25,
                    offset: const Offset(-8, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header del menú lateral
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppTheme.accentBlue.withOpacity(0.15),
                          AppTheme.lightBlue.withOpacity(0.1),
                        ],
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: AppTheme.accentBlue.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Menú',
                            style: AppTheme.heading3.copyWith(
                              color: AppTheme.primaryBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onClose,
                          icon: Icon(
                            Icons.close,
                            color: AppTheme.primaryBlue,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Opciones del menú
                  Expanded(
                    child: Column(
                      children: [
                        _MobileNavItem(
                          title: 'Inicio',
                          onTap: () {
                            onClose();
                            onHomeTap();
                          },
                        ),
                        _MobileNavItem(
                          title: 'Productos',
                          onTap: () {
                            onClose();
                            onServicesTap();
                          },
                        ),
                        _MobileNavItem(
                          title: 'Industrias',
                          onTap: () {
                            onClose();
                            onIndustriesTap();
                          },
                        ),
                        _MobileNavItem(
                          title: 'Nosotros',
                          onTap: () {
                            onClose();
                            onAboutTap();
                          },
                        ),
                        _MobileNavItem(
                          title: 'Contacto',
                          onTap: () {
                            onClose();
                            onContactTap();
                          },
                        ),

                        // Separador
                        Container(
                          height: 1.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppTheme.accentBlue.withOpacity(0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                        ),

                        // Botón de WhatsApp en el menú lateral
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: _ContactButton(
                            icon: null,
                            customIcon: 'assets/icons/whatsapp_icon.png',
                            label: 'WhatsApp',
                            onTap: () {
                              onClose();
                              onWhatsAppTap();
                            },
                            color: const Color(0xFF25D366),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
