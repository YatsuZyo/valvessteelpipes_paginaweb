import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'map_embed.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  static const String _address =
      'AV FUERZAS ARMADAS CC CENTRUM, GALPON Nº 14 BARCELONA EDO ANZOÁTEGUI';
  static const String _mapsUrl = 'https://maps.app.goo.gl/BLNpyQXwKnZbdxMN8';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: const BoxDecoration(gradient: AppTheme.subtleGradient),
      child: Column(
        children: [
          // Título de la sección
          Text('¡CONTÁCTANOS!', style: AppTheme.heading2),
          const SizedBox(height: 16),

          // Subtítulo
          Center(
            child: Text(
              '¡Estamos para ayudarle con sus necesidades de tuberías, válvulas, actuadores y conexiones de acero al carbono e inoxidable!',
              style: AppTheme.subtitle1.copyWith(color: AppTheme.metallicGray),
            ),
          ),
          const SizedBox(height: 60),

          // Contenido principal
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1100) {
                return _buildWideLayout();
              } else {
                return _buildNarrowLayout();
              }
            },
          ),

          const SizedBox(height: 40),

          // Mapa de Google (Web)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Ubicación',
              style: AppTheme.heading3.copyWith(color: AppTheme.titleGray),
            ),
          ),
          const SizedBox(height: 16),
          GoogleMapEmbed(addressQuery: _address, height: 360, borderRadius: 16),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              children: [
                Text(
                  _address,
                  style: AppTheme.bodyText2.copyWith(color: AppTheme.darkGray),
                ),
                TextButton.icon(
                  onPressed: _openInGoogleMaps,
                  icon: const Icon(Icons.map),
                  label: const Text('Ver en Google Maps'),
                ),
              ],
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
        // Formulario de contacto
        Expanded(flex: 2, child: _buildContactForm()),

        const SizedBox(width: 60),

        // Información de contacto
        Expanded(flex: 1, child: _buildContactInfo()),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      children: [
        _buildContactForm(),
        const SizedBox(height: 40),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildContactForm() {
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Envíanos un Mensaje',
                style: AppTheme.heading3.copyWith(color: AppTheme.titleGray),
              ),
              const SizedBox(height: 24),

              // Nombre
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Completo *',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico *',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu email';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}',
                  ).hasMatch(value)) {
                    return 'Por favor ingresa un email válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Teléfono
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // Mensaje
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Mensaje *',
                  prefixIcon: Icon(Icons.message),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu mensaje';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Botón de envío
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentBlue,
                    foregroundColor: AppTheme.pureWhite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: AppTheme.buttonText.copyWith(fontSize: 16),
                  ),
                  child:
                      _isSubmitting
                          ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppTheme.pureWhite,
                              ),
                            ),
                          )
                          : const Text('Enviar Mensaje'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Información de Contacto',
          style: AppTheme.heading3.copyWith(color: AppTheme.titleGray),
        ),
        const SizedBox(height: 24),

        // Dirección
        _buildContactItem(
          icon: Icons.location_on,
          title: 'Dirección',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _address,
                style: AppTheme.bodyText2.copyWith(
                  color: AppTheme.metallicGray,
                ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _openInGoogleMaps,
                icon: const Icon(Icons.map),
                label: const Text('Ver en Google Maps'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Teléfonos
        _buildContactItem(
          icon: Icons.phone,
          title: 'Teléfonos',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPhoneLink('+58 414 205 8090'),
              const SizedBox(height: 8),
              _buildPhoneLink('+58 412 922 4402'),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Correos electrónicos
        _buildContactItem(
          icon: Icons.email,
          title: 'Correos Electrónicos',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEmailLink('gerenciageneral@mafmvalves.com'),
              const SizedBox(height: 8),
              _buildEmailLink('negocios@mafmvalves.com'),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Instagram
        _buildContactItem(
          icon: Icons.camera_alt,
          title: 'Redes Sociales',
          content: _buildSocialLink(
            '@mafmvalves',
            () => _launchInstagram(),
            customImage: 'assets/images/brands/instagramlogo.png',
          ),
        ),

        const SizedBox(height: 24),

        // Horario de atención
        _buildContactItem(
          icon: Icons.access_time,
          title: 'Horario de Atención',
          content: Text(
            'Lunes a Viernes: 8:00 AM - 6:00 PM\nSábados: 8:00 AM - 12:00 PM',
            style: AppTheme.bodyText2.copyWith(color: AppTheme.metallicGray),
          ),
        ),

        const SizedBox(height: 32),

        // Botones de acción rápida
        _buildQuickActionButton(
          icon: Icons.chat,
          label: 'WhatsApp',
          onTap: () => _launchWhatsApp(),
          color: const Color(0xFF25D366),
        ),

        const SizedBox(height: 16),

        _buildQuickActionButton(
          icon: Icons.phone,
          label: 'Llamar Ahora',
          onTap: () => _launchPhone(),
          color: AppTheme.accentBlue,
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required Widget content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.accentBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppTheme.accentBlue, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTheme.subtitle2.copyWith(
                  color: AppTheme.primaryBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              content,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneLink(String phone) {
    return InkWell(
      onTap: () => _launchPhoneNumber(phone),
      child: Text(
        phone,
        style: AppTheme.bodyText2.copyWith(
          color: AppTheme.accentBlue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildEmailLink(String email) {
    return InkWell(
      onTap: () => _launchEmail(email),
      child: Text(
        email,
        style: AppTheme.bodyText2.copyWith(
          color: AppTheme.accentBlue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildSocialLink(
    String text,
    VoidCallback onTap, {
    String? customImage,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (customImage != null) ...[
            Image.asset(customImage, height: 16, width: 16),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: AppTheme.bodyText2.copyWith(
              color: AppTheme.accentBlue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: AppTheme.pureWhite,
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: AppTheme.buttonText,
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simular envío del formulario
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isSubmitting = false;
      });

      // Mostrar mensaje de éxito
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              '¡Mensaje enviado con éxito! Nos pondremos en contacto contigo pronto.',
            ),
            backgroundColor: AppTheme.accentBlue,
          ),
        );

        // Limpiar formulario
        _formKey.currentState!.reset();
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _messageController.clear();
      }
    }
  }

  Future<void> _openInGoogleMaps() async {
    final url = _mapsUrl;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchWhatsApp() async {
    final url =
        'https://wa.me/584142058090?text=Hola,%20me%20interesa%20conocer%20más%20sobre%20sus%20servicios%20de%20válvulas%20y%20tuberías.';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Future<void> _launchPhone() async {
    final url = 'tel:+584142058090';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Future<void> _launchPhoneNumber(String phone) async {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d+]'), '');
    final url = 'tel:$cleanPhone';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Future<void> _launchEmail(String email) async {
    final url = 'mailto:$email';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Future<void> _launchInstagram() async {
    final url = 'https://www.instagram.com/mafmvalves/?hl=es-la';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
