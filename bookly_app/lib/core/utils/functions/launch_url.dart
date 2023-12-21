import 'package:url_launcher/url_launcher.dart';

import 'custom_snac_bar.dart';

Future<void> launchCustomURL(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnacBar(context, 'Cannot Launch $url');
    }
  }
}
