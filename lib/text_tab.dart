import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is a text post', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Share.share('Check out this text post:\n https://demodeeplink.com/text'),
            child: Text('Share'),
          ),
        ],
      ),
    );
  }
}
