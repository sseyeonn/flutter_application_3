import 'package:http/http.dart' as http;
import 'dart:convert';

class Stock {
  late String code;
  late String name;
  late String market;
  late String marketId;
  late String isuCd;
  late int amount;
  late double chagesRatio;
  late String changeCode;
  late int changes;
  late String close;
  late String dept;
  late int high;
  late int low;
  late int marcap;
  late int open;
  late int stocks;
  late int volume;

  Stock({
    required this.code,
    required this.name,
    required this.market,
    required this.marketId,
    required this.isuCd,
    required this.amount,
    required this.chagesRatio,
    required this.changeCode,
    required this.changes,
    required this.close,
    required this.dept,
    required this.high,
    required this.low,
    required this.marcap,
    required this.open,
    required this.volume,
    required this.stocks,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      code: json['Code'] ?? '0',
      name: json['Name'] ?? '0',
      market: json['Market'] ?? '0',
      marketId: json['MarketId'] ?? '0',
      isuCd: json['ISU_CD'] ?? '0',
      amount: json['Amount'] ?? 0,
      chagesRatio: json['ChagesRatio'] ?? 0.0,
      changeCode: json['ChangeCode'] ?? '0',
      changes: json['Changes'] ?? 0,
      close: json['Close'] ?? '0',
      dept: json['Dept'] ?? '0',
      high: json['High'] ?? 0,
      low: json['Low'] ?? 0,
      marcap: json['Marcap'] ?? 0,
      open: json['Open'] ?? 0,
      volume: json['Volume'] ?? 0,
      stocks: json['Stocks'] ?? 0,
    );
  }
}

class StockService {
  Future<List<Stock>> getStocks({int page = 1, int ppv = 20}) async {
    String url =
        'http://223.194.129.136:8070/stock?page=$page&ppv=$ppv'; // 베이스 address

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> body =
          jsonDecode(response.body); // response.body : 웹브라우저 내용, 디코드: 맵형태
      List<dynamic> data = body['data']; // 한 번 더 필터링, 여전히 맵 데이터
      List<Stock> stocks = data
          .map((dynamic item) => Stock.fromJson(item))
          .toList(); // dynamic item : 맵 데이터, Stock.fromJson(item) : Stock 클래스로 변환
      return stocks;
    } else {
      throw Exception('Failes to load stocks');
    }
  }
}
