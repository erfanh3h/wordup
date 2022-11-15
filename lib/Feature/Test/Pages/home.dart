import 'package:flutter/material.dart';
import 'package:wordup/Feature/Test/Controllers/home.dart';
import 'package:wordup/Feature/Test/Widgets/row_item.dart';

import '../../../Core/Base/base_view.dart';

class HomePage extends BaseView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return ListView(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => RowItem(
            controller: controller,
            index: index,
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 20,
            color: Colors.black,
            thickness: .1,
          ),
          itemCount: controller.dataRowCount.value,
        ),
      ],
    );
  }

  @override
  Widget? floatingActionButton() {
    return FloatingActionButton.small(
      onPressed: controller.addRow,
      child: const Icon(
        Icons.add,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
