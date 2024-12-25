import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
// import 'package:fruits/features/order_tracking/presentation/views/widgets/order_tracking_view_body.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key});

  static const String routeName = 'OrderTrackingView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('تتبع الطلب'),
      ),
      body: SizedBox(),
    );
  }
}
