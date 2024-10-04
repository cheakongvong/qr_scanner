import 'package:flutter/material.dart';
import 'package:qr_profile/screens/qr_document.dart';
import 'package:qr_profile/screens/scan_qr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('QR'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScanQr(),
                  ),
                );
              },
              child: const Text('Scan QR'),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrDocument(),
                  ),
                );
              },
              child: const Text('QR Document'),
            ),
          ],
        ),
      ),
    );
  }
}
