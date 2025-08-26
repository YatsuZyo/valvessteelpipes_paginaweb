import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'mafm_logo.dart';

class Header extends StatelessWidget {
  final VoidCallback onServicesTap;
  final VoidCallback onIndustriesTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;

  const Header({
    super.key,
    required this.onServicesTap,
    required this.onIndustriesTap,
    required this.onAboutTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Logo
          Expanded(flex: 2, child: Center(child: MafmLogo(size: 240))),

          // Navegación
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _NavItem(title: 'Inicio', onTap: () {}, isActive: true),
                _NavItem(title: 'Servicios', onTap: onServicesTap),
                _NavItem(title: 'Industrias', onTap: onIndustriesTap),
                _NavItem(title: 'Nosotros', onTap: onAboutTap),
                _NavItem(title: 'Contacto', onTap: onContactTap),
              ],
            ),
          ),

          // Botón de WhatsApp
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _ContactButton(
                  icon: Icons.chat_bubble,
                  label: 'WhatsApp',
                  onTap: () => _launchWhatsApp(),
                  color: const Color(0xFF25D366),
                ),
              ],
            ),
          ),
        ],
      ),
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
  final bool isActive;

  const _NavItem({
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color:
                isActive
                    ? AppTheme.accentBlue.withOpacity(0.1)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: AppTheme.subtitle2.copyWith(
              color: isActive ? AppTheme.accentBlue : AppTheme.metallicGray,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _ContactButton({
    required this.icon,
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
            Icon(icon, color: AppTheme.pureWhite, size: 16),
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
