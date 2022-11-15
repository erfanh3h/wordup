import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wordup/Core/Global/Widgets/global_input_box.dart';
import 'package:wordup/Core/Resources/app_colors.dart';
import 'package:wordup/Core/Resources/app_spacings.dart';
import 'package:wordup/Feature/Test/Controllers/home.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10.r),
              DropdownButton<String>(
                items: controller.types.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.changeTypeValue(value, index);
                },
                value: controller.typesValues[index].value,
              ),
              Container(
                width: Get.size.width / 2,
                padding: AppSpacings.s10Horizental,
                child: GlobalInputBox(
                  label: 'field',
                  controller: controller.fieldsValues[index],
                ),
              ),
              DropdownButton<String>(
                items: controller.counts.map((int value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.changeCountValue(value, index);
                },
                value: controller.countsValues[index].toString(),
              ),
              SizedBox(width: 10.r),
            ],
          ),
          Visibility(
            visible: controller.typesValues[index].isNotEmpty,
            child: Padding(
              padding: AppSpacings.s5Top,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, ind) => Container(
                  height: 50.r,
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      controller.typesValues[index].value,
                      style: const TextStyle(color: AppColors.grey900),
                    ),
                  ),
                ),
                separatorBuilder: (context, ind) => const SizedBox(
                  height: 5,
                ),
                itemCount: controller.countsValues[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
