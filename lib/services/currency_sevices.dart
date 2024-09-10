import 'dart:convert';
import 'package:application/models/currency.dart';
import 'package:http/http.dart' as http;

class CurrencyServices {
  Future<Currency?> getCurrency(String code) async {
    Uri url = Uri.parse("https://nbu.uz/uz/exchange-rates/json/");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var json in data) {
        Currency currency = Currency.fromJson(json);
        if (currency.code == code) {
          return currency;
        }
      }
    } else {
      throw Exception('error');
    }

    return null;
  }


  Future<List<Currency>> getAllCurrencies() async {
    Uri url = Uri.parse("https://nbu.uz/uz/exchange-rates/json/");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<Currency> loadedCurrencies = [];

    if (response.statusCode == 200) {
      for (var json in data) {
        loadedCurrencies.add(Currency.fromJson(json));
      }
      return loadedCurrencies;
    } else {
      throw Exception('error');
    }
  }
}
