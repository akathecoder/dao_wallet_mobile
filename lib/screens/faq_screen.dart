import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';

class FaqScreen extends StatefulWidget {
  static String id = "faq_page";

  const FaqScreen({super.key});

  final String title = "FAQs";
  @override
  State<FaqScreen> createState() => _FaqState();
}

class _FaqState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Navigator.canPop(context)
                        ? NeuBox(
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        : null,
                  ),
                  Text(
                    widget.title.toUpperCase().split('').join(" "),
                  ),
                  const SizedBox(
                    height: 60,
                    width: 60,
                    // child: NeuBox(child: Icon(Icons.question_mark)),
                  ),
                ],
              ),
            ),

            //  Space
            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const FaqBox();
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqBox extends StatefulWidget {
  const FaqBox({super.key});

  @override
  State<FaqBox> createState() => _FaqBoxState();
}

class _FaqBoxState extends State<FaqBox> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: NeuBox(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    icon: Icon(
                      isOpen ? Icons.expand_less : Icons.expand_more,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: isOpen,
                child: Column(
                  children: const [
                    SizedBox(height: 8),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
