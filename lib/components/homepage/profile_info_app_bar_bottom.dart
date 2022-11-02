import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';

PreferredSize profileInfoAppBarBottom({
  required BuildContext context,
}) {
  // TODO: use address from provider
  String address = "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f";

  return PreferredSize(
    preferredSize: const Size.fromHeight(200),
    child: Container(
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.center,
      height: 200,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBlockie(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                size: 128,
                data: address.toLowerCase(),
              ),
              Container(
                width: 128,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: TextButton(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(text: address),
                    ).then(
                      (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Wallet address copied to clipboard"),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    elevation: 0,
                  ),
                  child: const Text(
                    "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Sparsh Agarwal",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Lead Developer",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white70,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
