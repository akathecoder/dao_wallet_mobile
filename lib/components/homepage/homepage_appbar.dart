import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/screens/faq_screen.dart';

class HomepageAppBar extends StatelessWidget {
  const HomepageAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 60,
            width: 60,
            // child: NeuBox(child: Icon(Icons.arrow_back)),
          ),
          Text(
            title.toUpperCase().split('').join(" "),
          ),
          SizedBox(
            height: 60,
            width: 60,
            child: NeuBox(
              child: IconButton(
                // icon: const Icon(Icons.link),
                icon: const Icon(Icons.question_mark),
                onPressed: () {
                  Navigator.pushNamed(context, FaqScreen.id);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
