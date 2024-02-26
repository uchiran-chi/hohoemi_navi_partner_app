import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeReader extends StatefulWidget {
  final void Function(String protectedId) onQRViewCreated;

  const QRCodeReader({Key? key, required this.onQRViewCreated})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCodeReaderState();
}

class _QRCodeReaderState extends State<QRCodeReader> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 4, child: _buildQrView(context, widget.onQRViewCreated)),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            width: double.infinity,
            color: Colors.black, // ここで背景色を設定します
            child: Text(
              '会員証に記載のQRコードをかざしてください。',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  // QRコードを読み取る枠の部分
  Widget _buildQrView(
      BuildContext context, void Function(String protectedId) onQRViewCreated) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller

    return QRView(
      key: qrKey,
      onQRViewCreated: (controller) {
        setState(() {
          this.controller = controller;
        });
        controller.scannedDataStream.listen((scanData) {
          setState(() {
            if (result?.code == scanData.code) {
              return;
            }

            result = scanData;
            onQRViewCreated(result?.code ?? "");
          });
        });
      },
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
