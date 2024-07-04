import 'package:flutter/material.dart';
import 'package:flutter_application_3/stocks.dart';
import 'package:intl/intl.dart';

class FinanceCard extends StatelessWidget {
  late Stock stock;
  FinanceCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##0');

    return GestureDetector(
      onTap: () {
        print('clicked!!!');
      },
      child: Card(
        // 이 하나의 항목이 리스트뷰에 들어감
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stock.name,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 52, 123, 54),
                          fontWeight: FontWeight.bold),
                    ), // style 해볼 것
                    Text(stock.code),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formatter.format(int.parse(stock.close)),
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      stock.chagesRatio.toString(),
                      style: TextStyle(
                        color: stock.chagesRatio > 0 ? Colors.red : Colors.blue,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(stock.volume.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
