import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class VideoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 150,
            color: Colors.black,
            child: Center(child: Text('Video Placeholder', style: TextStyle(color: Colors.white))),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Share.share('Check out this video placeholder'),
            child: Text('Share'),
          ),
        ],
      ),
    );
  }
}
