import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/crypto_provider.dart';

class CryptoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cryptoProvider = Provider.of<CryptoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Prices in Dollar'),
      ),
      body: cryptoProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: cryptoProvider.cryptos.length,
        itemBuilder: (context, index) {
          final crypto = cryptoProvider.cryptos[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(crypto.name),
              subtitle: Text('\$ ${crypto.priceUsd.toStringAsFixed(0)}'),
            ),
          );
        },
      ),
    );
  }
}
