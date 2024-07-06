import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyConverter {
  static const String _exchangeRateApiUrl =
      'https://api.exchangerate-api.com/v4/latest/USD';

  static Future<double> fetchExchangeRate() async {
    try {
      final response = await http.get(Uri.parse(_exchangeRateApiUrl));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse['rates']['IDR'].toDouble(); // Ensure conversion to double
      } else {
        throw Exception('Failed to load exchange rates');
      }
    } catch (e) {
      print('Error fetching exchange rates: $e');
      throw Exception('Failed to load exchange rates');
    }
  }

  static Future<double> convertUsdToIdr(double amountInUsd) async {
    try {
      final exchangeRate = await fetchExchangeRate();
      return amountInUsd * exchangeRate;
    } catch (e) {
      print('Error converting USD to IDR: $e');
      throw Exception('Failed to convert USD to IDR');
    }
  }
}
