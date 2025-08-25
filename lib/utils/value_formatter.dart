import 'package:terapis/global_resource.dart';
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

String toCurrency(int price, {String? locale, String? symbol}) {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: locale ?? 'id',
    symbol: symbol ?? 'Rp ',
    decimalDigits: 0,
  );
  return currencyFormatter.format(price);
}

void copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      elevation: 0,
      content: Row(
        children: [
          Icon(Icons.copy, size: 14, color: Colors.white),
          SizedBox(width: 6),
          Text('Berhasil disalin'),
        ],
      ),
    ),
  );
}

void openWhatsApp({required String phoneNumber}) async {
  String url = "https://wa.me/$phoneNumber";
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
