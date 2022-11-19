import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';

class LoadingScreenWithCircularProgressIndicator extends StatelessWidget {
  const LoadingScreenWithCircularProgressIndicator({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                title.toUpperCase().split('').join(" "),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: NeuBox(
                      shape: BoxShape.circle,
                      child: CircularProgressIndicator(
                        color: Colors.white70,
                        strokeWidth: 6.0,
                      ),
                    ),
                  ),
                  Text(
                    text.toUpperCase().split('').join(" "),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
