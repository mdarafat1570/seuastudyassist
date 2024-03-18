import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UMSPage extends StatefulWidget {
  @override
  _UMSPageState createState() => _UMSPageState();
}

class _UMSPageState extends State<UMSPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition for Android.
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Welcome to SEU UMS",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          Image.asset(
            "assets/LgoUMS.png",
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 15,
          )
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl:
                'https://ums.seu.edu.bd/sign-in?redirectURL=%2Fdashboard',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            const LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              backgroundColor: Colors.transparent,
            ),
        ],
      ),
    );
  }
}
