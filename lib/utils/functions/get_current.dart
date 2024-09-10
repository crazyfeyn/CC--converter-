import 'package:application/models/currency.dart';
import 'package:application/services/currency_sevices.dart';

class CurrencyFunctions {
  static Future<Currency?> getCurrency(String code) async {
    CurrencyServices currencyServices = CurrencyServices();

    Currency? box = await currencyServices.getCurrency(code);

    if (box != null) {
      return box;
    }
    return null;
  }

  static Future<List<String>> getNameOfCurrencies() async {
    CurrencyServices currencyServices = CurrencyServices();

    List<String> box = [];
    List<Currency> data = await currencyServices.getAllCurrencies();
    for (Currency currency in data) {
      box.add(currency.code ?? '');
    }
    return box;
  }
}