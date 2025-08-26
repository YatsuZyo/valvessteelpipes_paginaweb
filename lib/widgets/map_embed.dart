import 'dart:ui' as ui;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'dart:html';

// Widget que embebe un mapa de Google Maps usando un iframe (Web).
class GoogleMapEmbed extends StatefulWidget {
  final String addressQuery; // Texto de búsqueda/dirección
  final double height;
  final double borderRadius;

  const GoogleMapEmbed({
    super.key,
    required this.addressQuery,
    this.height = 320,
    this.borderRadius = 12,
  });

  @override
  State<GoogleMapEmbed> createState() => _GoogleMapEmbedState();
}

class _GoogleMapEmbedState extends State<GoogleMapEmbed> {
  late final String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType =
        'google-map-embed-${widget.addressQuery.hashCode}-${widget.height.toInt()}';

    if (kIsWeb) {
      // Registra un factory único para este iframe
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
        final encoded = Uri.encodeComponent(widget.addressQuery);
        final url = 'https://www.google.com/maps?q=$encoded&output=embed';
        final iframe =
            IFrameElement()
              ..src = url
              ..style.border = '0'
              ..allowFullscreen = true
              ..style.width = '100%'
              ..style.height = '100%';
        return iframe;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      // Fallback simple en no-web: un contenedor con texto
      return Container(
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F3F5),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: const Text('Mapa disponible en la versión Web'),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: SizedBox(
        height: widget.height,
        width: double.infinity,
        child: HtmlElementView(viewType: _viewType),
      ),
    );
  }
}

// Necesario para IFrameElement en Web
// ignore: avoid_web_libraries_in_flutter
