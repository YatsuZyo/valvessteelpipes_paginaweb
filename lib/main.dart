import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme/app_theme.dart';
import 'widgets/header.dart';
import 'widgets/hero_section.dart';
import 'widgets/services_section.dart';
import 'widgets/industries_section.dart';
import 'widgets/certifications_section.dart';
import 'widgets/about_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAFM VALVES & STEEL C.A.',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _industriesKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  bool _isMenuOpen = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _closeMenu() {
    setState(() {
      _isMenuOpen = false;
    });
  }

  Future<void> _launchWhatsApp() async {
    final url =
        'https://wa.me/584142058090?text=Hola,%20me%20interesa%20conocer%20más%20sobre%20sus%20servicios%20de%20válvulas%20y%20tuberías.';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Header fijo
              SliverPersistentHeader(
                pinned: true,
                delegate: HeaderDelegate(
                  child: Header(
                    onHomeTap: _scrollToTop,
                    onServicesTap: () => _scrollToSection(_servicesKey),
                    onIndustriesTap: () => _scrollToSection(_industriesKey),
                    onAboutTap: () => _scrollToSection(_aboutKey),
                    onContactTap: () => _scrollToSection(_contactKey),
                    isMenuOpen: _isMenuOpen,
                    onMenuToggle: _toggleMenu,
                  ),
                ),
              ),

              // Hero Section
              SliverToBoxAdapter(
                child: HeroSection(
                  onContactTap: () => _scrollToSection(_contactKey),
                ),
              ),

              // Servicios
              SliverToBoxAdapter(
                key: _servicesKey,
                child: const ServicesSection(),
              ),

              // Industrias
              SliverToBoxAdapter(
                key: _industriesKey,
                child: const IndustriesSection(),
              ),

              // Certificaciones
              const SliverToBoxAdapter(child: CertificationsSection()),

              // Nosotros
              SliverToBoxAdapter(key: _aboutKey, child: const AboutSection()),

              // Contacto
              SliverToBoxAdapter(
                key: _contactKey,
                child: const ContactSection(),
              ),

              // Footer
              const SliverToBoxAdapter(child: Footer()),
            ],
          ),

          // Menú overlay
          MobileMenuOverlay(
            isOpen: _isMenuOpen,
            onClose: _closeMenu,
            onHomeTap: _scrollToTop,
            onServicesTap: () => _scrollToSection(_servicesKey),
            onIndustriesTap: () => _scrollToSection(_industriesKey),
            onAboutTap: () => _scrollToSection(_aboutKey),
            onContactTap: () => _scrollToSection(_contactKey),
            onWhatsAppTap: _launchWhatsApp,
          ),
        ],
      ),
    );
  }
}

// Delegate para el header persistente
class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  HeaderDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: AppTheme.pureWhite.withOpacity(0.95), child: child);
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
