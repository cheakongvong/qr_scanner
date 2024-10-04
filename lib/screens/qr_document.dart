import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrDocument extends StatelessWidget {
  const QrDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Document'),
      ),
      // backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('PROFILE'),
                Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFFF9988),
                    ),
                  ),
                  child: QrImageView(
                    data: 'N4V_PR0F1L3:UserId',
                    size: 150,
                    version: QrVersions.auto,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.circle,
                      color: Color(0xFFFF9988),
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      color: Color(0xFFFF9988),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('BOOKED'),
                Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFFF9988),
                    ),
                  ),
                  child: QrImageView(
                    data: 'N4V_B00K3D_PL4C3:PlaceId',
                    size: 150,
                    version: QrVersions.auto,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.circle,
                      color: Color(0xFFFF9988),
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      color: Color(0xFFFF9988),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('PAYMENT'),
                Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFFF9988),
                    ),
                  ),
                  child: QrImageView(
                    data: 'N4V_P4YM3NT:PaymentId',
                    size: 150,
                    version: QrVersions.auto,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.circle,
                      color: Color(0xFFFF9988),
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      color: Color(0xFFFF9988),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
