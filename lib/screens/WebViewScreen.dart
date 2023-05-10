import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({Key? key,required this.url}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
      ),
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              allowFileAccess: true,
              allowContentAccess: true,
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
            ),
            crossPlatform: InAppWebViewOptions(
              mediaPlaybackRequiresUserGesture: false,
            ),
          ),
        ),
      ),
    );
  }
}
