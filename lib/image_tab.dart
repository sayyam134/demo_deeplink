import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ImageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', width: 300, height: 300),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Share.share('Check out this image:\n https://demodeeplink.com/image'),
            child: Text('Share'),
          ),
        ],
      ),
    );
  }
}
