import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Center(child: Text("NAOPAKO FEST", style: TextStyle(fontWeight: FontWeight.bold))),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text("Postavi QR kod tako da ga vidi kamera.", 
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Skeniranje će početi automatski.", 
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54
                  )
                )
              ],
            )),

            Expanded(
              flex: 4,
              child: MobileScanner(
                controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.noDuplicates
                ),
                onDetect: (capture){
                  print(capture);
                }
              ),
            ),

            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text("31.8.2024.",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14
                  ),
                )
              )
            ),
            
          ],
        )
      )
      
    );
  }
}