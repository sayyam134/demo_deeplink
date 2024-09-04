import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ImageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://via.placeholder.com/150', width: 150, height: 150),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Share.share('Check out this image: https://via.placeholder.com/150'),
            child: Text('Share'),
          ),
        ],
      ),
    );
  }
}
