import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:seustudyassist/base/connection_lost_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UMSPage extends StatefulWidget {
  @override
  _UMSPageState createState() => _UMSPageState();
}

class _UMSPageState extends State<UMSPage> {
  bool _isLoading = true;
  bool _isConnected = true;
  late Connectivity _connectivity;

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
    _connectivity = Connectivity();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _isConnected = result != ConnectivityResult.none;
      });
    });
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
      body: _isConnected
          ? Stack(
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
            )
          : ConnectionLostScreen(),
    );
  }
}
