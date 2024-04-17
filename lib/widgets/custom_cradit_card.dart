import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:home_food_delivery/widgets/custom_button.dart';

class CustomCraditCard extends StatefulWidget {
  const CustomCraditCard(
      {super.key, required this.formKey, required this.autovalidateMode});

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  @override
  State<CustomCraditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCraditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardBgColor: Colors.red,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
            autovalidateMode: widget.autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (craditCardModel) {
              cardHolderName = craditCardModel.cardHolderName;
              expiryDate = craditCardModel.expiryDate;
              cvvCode = craditCardModel.cvvCode;
              cardNumber = craditCardModel.cardNumber;
              showBackView = craditCardModel.isCvvFocused;
              setState(() {});
            },
            formKey: widget.formKey),
      ],
    );
  }
}
