import 'package:http/http.dart' as http;
import 'dart:convert';

class Stock {
  late String code;
  late String name;
  late String market;
  late String marketId;
  late String isuCd;
  late String amount;
  late String chagesRati;
  late String changeCode;
  late String changes;
  late String close;
  late String dept;
  late String high;
  late String low;
  late String marcap;
  late String open;
  late String volume;

  Stock({
    required this.code,
    required this.name,
    required this.market,
    required this.marketId,
    required this.isuCd,
    required this.amount,
    required this.chagesRati,
    required this.changeCode,
    required this.changes,
    required this.close,
    required this.dept,
    required this.high,
    required this.low,
    required this.marcap,
    required this.open,
    required this.volume,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      code: json['Code'] ?? '',
      name: json['Name'] ?? '',
      market: json['Market'] ?? '',
      marketId: json['MarketId'] ?? '',
      isuCd: json['ISU_CD'] ?? '',
      amount: json['Amount'].toString(),
      chagesRati: json['ChagesRatio'].toString(),
      changeCode: json['ChangeCode'] ?? '',
      changes: json['Changes'].toString(),
      close: json['Close'] ?? '',
      dept: json['Dept'] ?? '',
      high: json['High'].toString(),
      low: json['Low'].toString(),
      marcap: json['Marcap'].toString(),
      open: json['Open'].toString(),
      volume: json['Volume'].toString(),
    );
  }
}

//  "Amount": 598284999400,
//     "ChagesRatio": -0.12,
//     "ChangeCode": "2",
//     "Changes": -100,
//     "Close": "81700",
//     "Code": "005930",
//     "Dept": "",
//     "High": 82300,
//     "ISU_CD": "KR7005930003",
//     "Low": 81000,
//     "Marcap": 487731234335000,
//     "Market": "KOSPI",
//     "MarketId": "STK",
//     "Name": "\uc0bc\uc131\uc804\uc790",
//     "Open": 82300,
//     "Stocks": 5969782550,
//     "Volume": 7335448

class StockService {
  Future<List<Stock>> getStocks({int page = 1, int ppv = 20}) async {
    String url =
        'http://223.194.129.136:8070/stocks?page=$page&ppv=$ppv'; // 베이스 address

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Stock> stocks =
          body.map((dynamic item) => Stock.fromJson(item)).toList();
      return stocks;
    } else {
      throw 'Failes to load stocks';
    }
  }
}
