import 'package:flutter/material.dart';

class RecentSales extends StatelessWidget {
  const RecentSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Sales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DataTable(
              columns: const [
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Reference')),
                DataColumn(label: Text('Customer')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Total')),
                DataColumn(label: Text('Paid')),
                DataColumn(label: Text('Balance')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('2023-05-01')),
                  DataCell(Text('SALE/001')),
                  DataCell(Text('John Doe')),
                  DataCell(Text('Completed')),
                  DataCell(Text('₹ 1000.00')),
                  DataCell(Text('₹ 1000.00')),
                  DataCell(Text('₹ 0.00')),
                ]),
                // Add more rows as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}

