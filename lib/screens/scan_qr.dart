import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_profile/screens/book_places.dart';
import 'package:qr_profile/screens/payment_screen.dart';

import 'profile_screen.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  MobileScannerController cameraController = MobileScannerController();

  void onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;

    for (final barcode in barcodes) {
      if (barcode.rawValue != null) {
        final String code = barcode.rawValue!;
        debugPrint('QR Code Detected: $code');

        cameraController.stop();

        final List<String> parts = code.split(":");

        if (parts.first == 'N4V_PR0F1L3' && parts.length > 1) {
          final String userId = parts.last;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(userId: userId),
            ),
          ).then((_) {
            cameraController.start();
          });
        } else if (parts.first == 'N4V_B00K3D_PL4C3' && parts.length > 1) {
          final String placeId = parts.last;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookPlaces(placeId: placeId),
            ),
          ).then((_) {
            cameraController.start();
          });
        } else if (parts.first == 'N4V_P4YM3NT' && parts.length > 1) {
          final String paymentId = parts.last;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentScreen(paymentId: paymentId),
            ),
          ).then((_) {
            cameraController.start();
          });
        } else {
          debugPrint('Unrecognized QR Code format.');
          cameraController.start();
        }
        break;
      } else {
        debugPrint('No valid QR Code found.');
        cameraController.start();
      }
    }
  }

  // void _showScannedData(String code) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Scanned Data'),
  //         content: Text('The scanned code is: $code'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            scanWindow: Rect.fromCenter(
              center: MediaQuery.of(context).size.center(Offset.zero),
              width: 200,
              height: 200,
            ),
            onDetect: onDetect,
            fit: BoxFit.contain,
            errorBuilder: (context, error, child) {
              return Center(
                child: Text(
                  'Error: ${error.toString()}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            },
            controller: cameraController,
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFFF9988), width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
