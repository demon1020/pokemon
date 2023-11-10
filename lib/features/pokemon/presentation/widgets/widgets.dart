
import 'package:flutter/material.dart';

import '../../../../core/common/res/styles.dart';

class AppWidget{
  static Widget buildEvenRow({required String placeHolder, required String value}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            placeHolder,
            style: AppStyle.titleTextStyleMedium(),
          ),
          Text(
            value,
            style: AppStyle.titleTextStyleMedium(),
          ),
        ],
      ),
    );
  }

  static Wrap buildWrapFromMap(Map map) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: map.entries.map((entry) {
        return Card(
          color: Colors.primaries[entry.value % 10].withOpacity(0.5),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            padding: const EdgeInsets.all(5),
            child: Text(
              '${entry.key} : ${entry.value}',
              style: AppStyle.bodyTextStyle(),
            ),
          ),
        );
      }).toList(),
    );
  }

  static Wrap buildWrap(dynamic item) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(
        item.length,
            (index) => Card(
          color: Colors.primaries[index % 10].withOpacity(0.5),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            padding: const EdgeInsets.all(5),
            child: Text(
              item[index],
              style: AppStyle.bodyTextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}

