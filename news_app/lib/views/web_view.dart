import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebView extends StatelessWidget {
  const WebView({super.key,  this.url});

  final String? url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white54,
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.orangeAccent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Details",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: WebViewPlus(
        initialUrl: url,
      ),
    );
  }
}
