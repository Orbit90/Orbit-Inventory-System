import 'package:flutter/material.dart';
import '../widgets/report_card.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reports',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final List<Map<String, dynamic>> reportData = [
                {'title': 'Sales Report', 'description': 'View detailed sales data', 'icon': Icons.bar_chart},
                {'title': 'Inventory Report', 'description': 'Check stock levels and product movement', 'icon': Icons.inventory},
                {'title': 'Financial Report', 'description': 'Analyze revenue and expenses', 'icon': Icons.attach_money},
                {'title': 'Customer Report', 'description': 'Understand customer behavior', 'icon': Icons.people},
                {'title': 'Supplier Report', 'description': 'Track supplier performance', 'icon': Icons.local_shipping},
                {'title': 'Tax Report', 'description': 'Manage tax obligations', 'icon': Icons.receipt_long},
              ];
              return ReportCard(
                title: reportData[index]['title'] as String,
                description: reportData[index]['description'] as String,
                icon: reportData[index]['icon'] as IconData,
              );
            },
          ),
        ],
      ),
    );
  }
}

