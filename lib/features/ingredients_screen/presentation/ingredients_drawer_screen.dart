import 'package:flutter/material.dart';

class IngredientsDrawer extends StatelessWidget {
  const IngredientsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, color: Colors.pink),
                  ),
                ],
              ),
            ),

            Divider(height: 1),

            // Category Item
            ListTile(
              title: Text(
                'Без рубрики',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('(1)', style: TextStyle(color: Colors.grey[700])),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {
                // Navigate or do something
              },
            ),
            Divider(
              color: Colors.blueAccent,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
          ],
        ),
      ),
    );
  }
}
