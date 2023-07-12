import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:yolo/models/customer_model.dart';

class QrScreen extends ConsumerWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Customer customerData = GetIt.I<Customer>();
    return Scaffold(
      body: Center(
          child: SizedBox(
              height: 250,
              width: 250,
              child: QrImageView(
                  data:
                      '{"name":"${customerData.customer?.name}", "mobileNo":"${customerData.customer?.mobile}", "cardId":"${customerData.cards?[0].id}"}'))),
    );
  }
}
