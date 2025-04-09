import 'package:flutter/material.dart';

class HealthInformationPage extends StatelessWidget {
  const HealthInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('معلومات صحية'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'السكري والتهاب المفاصل الروماتويدي ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('الأدوية'),
                  _buildMedicationRow('الأنسولين', '10 وحدات', 'مرتين يوميًا'),
                  _buildMedicationRow('ميتفورمين', '500 ملغ', 'مرتين يوميًا'),
                  _buildMedicationRow('الأسبرين', '81 ملغ', 'مرة واحدة يوميًا'),
                  _buildMedicationRow('بريدنيزولون', '5 ملغ', 'مرة واحدة يوميًا'),
                  _buildMedicationRow('إنالابريل', '10 ملغ', 'مرة واحدة يوميًا'),
                  const SizedBox(height: 20),
                  _buildSectionTitle('التوصيات'),
                  _buildRecommendationItem('مراقبة مستويات السكر في الدم بانتظام'),
                  _buildRecommendationItem('اتباع نظام غذائي منخفض السكر'),
                  _buildRecommendationItem('ممارسة الرياضة بانتظام'),
                  _buildRecommendationItem('مراقبة علامات العدوى'),
                  _buildRecommendationItem('تجنب الإجهاد'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildMedicationRow(
    String name,
    String dosage,
    String frequency,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text('$dosage - $frequency'),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(String recommendation) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            size: 16,
            color: Colors.green,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(recommendation),
          ),
        ],
      ),
    );
  }
}