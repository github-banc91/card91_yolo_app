import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:yolo/screens/widgets/common_widgets.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Positioned(
            top: 200,
            left: size(context).width / 4,
            child: SizedBox(
              height: 250,
              width: 250,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,
                        width: 4.0,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(0.75),
                          width: size(context).height,
                          strokeAlign: BorderSide.strokeAlignOutside),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 275,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                  color: AppColors.whiteBgColor),
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.expand_less),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        "ScanNpay",
                      );
                    },
                    iconSize: 42,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 20.0, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.greyFont,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 8.0),
                      ),
                    ),
                  ),
                  getSize(height: 10),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: 8,
                      padding: const EdgeInsets.all(15),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "UserInfoScreen",
                              );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  maxRadius: 25,
                                  backgroundImage: NetworkImage(
                                    'https://picsum.photos/250?image=2$i',
                                  ),
                                ),
                                getSize(height: 10),
                                Text(
                                  'John dew',
                                  style:
                                      Poppins.semiBold(AppColors.blackFont).s14,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ), // Add more widgets as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((Barcode scanData) {
      Map<String, dynamic> result = jsonDecode(scanData.code!);
      if (result.containsKey('name') &&
          result.containsKey('mobileNo') &&
          result.containsKey('cardId')) {
        if (result['name'] != null &&
            result['mobileNo'] != null &&
            result['cardId'] != null) {
          Navigator.pushReplacementNamed(context, "UserInfoScreen",
              arguments: result);
        } else {
          showToast('Invalid data', AppColors.redError);
        }
      } else {
        showToast('Invalid Qr', AppColors.redError);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
