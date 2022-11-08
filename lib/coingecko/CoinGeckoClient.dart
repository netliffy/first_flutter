import 'dart:convert';

import 'package:first_flutter/coingecko/CoinsMarketUrl.dart';
import 'package:first_flutter/network/HttpManager.dart';
import 'package:first_flutter/coingecko/CoinMarketModel.dart';
import 'package:first_flutter/coingecko/CoinsTrendingUrl.dart';
import 'package:first_flutter/coingecko/CoinTrendingModel.dart';

class CoinGeckoClient {
  final String BASE_URL = 'https://api.coingecko.com/api/v3/';

  Future<List<CoinMarketModel>> getTopCoinsMarkets() async {
    String url = BASE_URL + CoinsMarketUrl().toString();
    //print(url);
    HttpManager http = HttpManager();
    String response = await http.get(url);
    List<CoinMarketModel> coins = [];
    final parsed = jsonDecode(response);
    //print(response);
    if (parsed != null) {
      parsed.forEach((v) {
        coins.add(CoinMarketModel.fromJson(v));
      });
    }
    return coins;
  }

  Future<List<CoinTrendingModel>> getTrendingCoins() async {
    String url = BASE_URL + CoinsTrendingUrl().toString();
    //print(url);
    HttpManager http = HttpManager();
    String response = await http.get(url);
    List<CoinTrendingModel> coins = [];
    final parsed = jsonDecode(response);

    ///print(response);
    if (parsed != null) {
      final coin_map = parsed['coins'];
      //print("index ");
      //print(coin_map.length);
      coin_map.forEach((v) {
        coins.add(CoinTrendingModel.fromJson(v['item']));
      });
    }
    return coins;
  }
}
