import 'package:flutter/material.dart';
import 'package:hajj/screens/health_info_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HealthInfoWidget extends StatelessWidget {
  const HealthInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildInfoItem(
                  context,
                  'QR Code',
                  QrImageView(
                    data: 'This is a dummy QR code',
                    version: QrVersions.auto,
                    size: 120,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildInfoItem(
                  context,
                  'Health Information',
                  const Icon(Icons.health_and_safety, size: 60, color: Colors.white),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HealthInformationPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    String label,
    Widget content, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade900, // Consistent color
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            // ADDED: Center the content horizontally
            Center(child: content),
            // UPDATED: Use collection-if for conditional SizedBox and Text
            if (label != 'QR Code') ...[
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
