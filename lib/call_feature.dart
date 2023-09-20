import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // call with dial pad
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MakeACall extends StatelessWidget {
  Future<void> _makePhoneCall(String contact, bool direct) async {
    if (direct == true) {
      bool? res = await FlutterPhoneDirectCaller.callNumber(contact);
    } else {
      String telScheme = 'tel:$contact';

      if (await canLaunchUrl(Uri.parse(telScheme))) {
        await launchUrl(Uri.parse(telScheme));
      } else {
        throw 'Could not launch $telScheme';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 130),
          child: Card(
            elevation: 55,
            child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    Text("Emergency Call",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 35))
                  ],
                )),
          )),
      onTap: () => _makePhoneCall('18005990019', true),
    );
  }
}