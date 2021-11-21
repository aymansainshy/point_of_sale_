import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 2,
        child: Container(
          width: 400,
          height: 40,
          color: Colors.orange,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Pay with cash Credit",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
