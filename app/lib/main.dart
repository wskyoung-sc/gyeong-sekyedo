import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const SekyedoApp());

class SekyedoApp extends StatelessWidget {
  const SekyedoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '경씨 세계도',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFB8321F),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: const SekyedoPage(),
    );
  }
}

class SekyedoPage extends StatefulWidget {
  const SekyedoPage({super.key});

  @override
  State<SekyedoPage> createState() => _SekyedoPageState();
}

class _SekyedoPageState extends State<SekyedoPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFFFFFF))
      ..loadFlutterAsset('assets/index.html');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (await _controller.canGoBack()) {
          await _controller.goBack();
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: SafeArea(child: WebViewWidget(controller: _controller)),
      ),
    );
  }
}
