import 'package:flutter/cupertino.dart';
import 'package:home_food_delivery/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListView();
}

class _PaymentMethodsListView extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/image/Card.png',
    'assets/image/PayPal.png',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 62,
        child: ListView.builder(
            itemCount: paymentMethodsItems.length,
            shrinkWrap: true,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                      onTap: () {
                        activeIndex = index;
                        setState(() {});
                      },
                      child: PaymentMethodItem(
                        isActive: activeIndex == index,
                        image: paymentMethodsItems[index],
                      )));
            }));
  }
}
