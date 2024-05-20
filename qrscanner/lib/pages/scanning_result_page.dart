import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanningResultPage extends StatelessWidget {
  const ScanningResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Center(child: Text("NAOPAKO FEST", style: TextStyle(fontWeight: FontWeight.bold))),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            
            Text("RESULT", 
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      )
    );
  }
}