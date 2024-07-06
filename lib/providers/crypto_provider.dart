import 'package:flutter/foundation.dart';
import '../models/crypto_model.dart';
import '../services/api_service.dart';
import '../utils/currency_converter.dart';

class CryptoProvider with ChangeNotifier {
  List<Crypto> _cryptos = [];
  bool _isLoading = false;

  List<Crypto> get cryptos => _cryptos;
  bool get isLoading => _isLoading;

  CryptoProvider() {
    fetchCryptos();
  }

  Future<void> fetchCryptos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cryptos = await ApiService().fetchCryptos();
      for (var crypto in _cryptos) {
        crypto.priceUsd = await CurrencyConverter.convertUsdToIdr(crypto.priceUsd);
      }
    } catch (error) {
      print(error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
