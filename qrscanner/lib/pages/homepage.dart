import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //tokom testiranja staviti na DetectionSpedd.noDuplicates a kada treba da se exportuje staviti na DetectionSpeed.normal
  MobileScannerController mobScanController = MobileScannerController(detectionSpeed: DetectionSpeed.normal, returnImage: true);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
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
              
              child: Stack(
                children: [
                  MobileScanner(
                  controller: mobScanController, //MobileScannerController(
                    //detectionSpeed: DetectionSpeed.values, // ovo verovatno treba da sklonim
                    //returnImage: true
                  //),
                  
                  onDetect: (capture){
                    final List<Barcode> barcodes = capture.barcodes;
                    final Uint8List? image = capture.image;
                    mobScanController.stop();
                    for(final barcode in barcodes){
                      print('Barcode found! ${barcode.rawValue}');
                    } 
                    if(image != null){
                      showDialog(
                        context: context, 
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Uspešno očitan QR kod: " + (barcodes.first.rawValue ?? ""), style: const TextStyle(fontSize: 20),),
                            content: Image(image: MemoryImage(image)),
                            backgroundColor: Colors.green,
                            actions: [IconButton(onPressed: (){Navigator.of(context).pop(); mobScanController.start();}, icon: Icon(Icons.close))],
                          );
                        }
                      );
                    }
                  }
                ),
                QRScannerOverlay(overlayColor:  Colors.white, borderColor: Colors.deepOrange, scanAreaSize: const Size(300, 450),)
                
                ]
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