import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlts/widget_home/my_home_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyLoginPageState();
}

class MyLoginPageState extends State<MyLoginPage> {
  // Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: WebView(
      initialUrl:
          'https://id.vnpt.com.vn/cas/login?service=http://qlts.vnerp.vn/web/loginapp?response_type=token&client_id=False&redirect_uri=http%3A%2F%2Fqlts.vnerp.vn%2Fauth_oauth%2Fsignin&scope=False&state=%7B%22d%22%3A+%22vnpt_qlts%22%2C+%22p%22%3A+4%2C+%22r%22%3A+%22http%253A%252F%252Fqlts.vnerp.vn%252Fweb%22%7D',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
        // _controller.complete(controller);
        _controller = controller;
      },
      gestureNavigationEnabled: true,
      onPageFinished: (_) {
        readJS();
      },
    )));
  }

  void readJS() async {
    String html = await _controller.evaluateJavascript(
        "window.document.getElementsByTagName('body')[0].outerHTML;");
    String data = html
        .substring(html.indexOf('{'), html.indexOf('}') + 1)
        .replaceAll("\\", "");
    print('****************\n\n\n$data\n\n\n******************');
    if (data.contains('{"ErrorCode": "200"')) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyHomePage(data: data)));
    }
  }

// void getUrl() async {
//   // CircularProgressIndicator();
//   String url = await _controller.currentUrl();
//   if (url.contains(
//       'response_type=token&ticket')) {
//     print("******************** End True ******************");
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => MyHomePage()));
//   }else{
//     print("******************** End False ****************** $url");
//
//   }
// }

}
