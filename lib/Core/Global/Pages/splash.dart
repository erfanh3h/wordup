import 'package:flutter/material.dart';
import 'package:wordup/Core/Global/Widgets/global_loading.dart';

import '../../Base/base_view.dart';
import '../Controllers/global_controller.dart';

class SplashPage extends BaseView<GlobalController> {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          GlobalLoadingWidget(),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}
