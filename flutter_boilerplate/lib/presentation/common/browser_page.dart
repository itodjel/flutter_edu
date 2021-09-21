import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_boilerplate/_all.dart';

class BrowserPage extends StatefulWidget {
  final String url;
  final String? sessionId;
  final String? publishableKey;
  final void Function(BuildContext context)? onStripePaymentSuccess;
  final void Function(BuildContext context)? onStripePaymentError;
  final void Function()? dispose;

  const BrowserPage({
    Key? key,
    required this.url,
    this.sessionId,
    this.publishableKey,
    this.onStripePaymentSuccess,
    this.onStripePaymentError,
    this.dispose,
  }) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  @override
  void dispose() {
    if (widget.dispose != null) {
      widget.dispose!();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  widget.url,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
