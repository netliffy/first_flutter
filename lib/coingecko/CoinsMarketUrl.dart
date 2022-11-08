class CoinsMarketUrl {
  String path = 'coins/markets',
      vs_currency = 'usd',
      category = 'cryptocurrency',
      order = 'market_cap_desc',
      price_change_percentage = '24h';
  int per_page = 5, page = 1;
  bool sparkline = false;

  @override
  String toString() {
    // TODO: implement toString
    return "${path}?vs_currency=${vs_currency}&category=${category}&order=${order}&price_change_percentage=${price_change_percentage}&per_page=${per_page}&page=${page}&sparkline=${sparkline}";
  }
}
