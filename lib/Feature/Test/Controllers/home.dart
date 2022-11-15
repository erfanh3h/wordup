import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wordup/Core/Base/base_controller.dart';

class HomeController extends BaseController {
  final List<String> types = [
    'type1',
    'type2',
    'type3',
    'type4',
    'type5',
    'type6',
    '',
  ];

  final List<int> counts = [1, 2, 3, 4];

  RxList<RxString> typesValues = RxList([RxString('')]);
  RxList<TextEditingController> fieldsValues =
      RxList([TextEditingController()]);
  RxList<int> countsValues = RxList([1]);

  RxInt dataRowCount = RxInt(1);

  addRow() {
    typesValues.add(RxString(''));
    fieldsValues.add(TextEditingController());
    countsValues.add(1);
    dataRowCount.value += 1;
  }

  changeTypeValue(String? value, int index) {
    typesValues[index].value = value ?? '';
  }

  changeCountValue(String? value, int index) {
    countsValues[index] = int.parse(value ?? '1');
  }
}
