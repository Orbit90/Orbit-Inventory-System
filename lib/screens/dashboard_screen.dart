import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/recent_sales.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final List<Map<String, dynamic>> cardData = [
                {'title': 'Sales', 'value': '₹ 0.00', 'color': Colors.blue, 'icon': Icons.shopping_cart},
                {'title': 'Revenue', 'value': '₹ 0.00', 'color': Colors.green, 'icon': Icons.attach_money},
                {'title': 'Profit', 'value': '₹ 0.00', 'color': Colors.orange, 'icon': Icons.trending_up},
              ];
              return DashboardCard(
                title: cardData[index]['title'] as String,
                value: cardData[index]['value'] as String,
                color: cardData[index]['color'] as Color,
                icon: cardData[index]['icon'] as IconData,
              );
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Recent Sales',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const RecentSales(),
        ],
      ),
    );
  }
}

