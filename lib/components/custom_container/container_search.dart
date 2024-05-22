import 'package:english/components/custom_container/custom_search.dart';
import 'package:english/gen/assets.gen.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({
    super.key,
    this.text,
    required Null Function(dynamic searchTerm) onSearch,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      width: 348.w,
      height: 210.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppColor.containerHome,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text!,
                textAlign: TextAlign.start,
                style: AppStyle.containerText,
              ),
              SvgPicture.asset(Assets.images.container),
            ],
          ),
          CustomSearch(hintText: 'apa yang ingin kamu pelajari ?'),
        ],
      ),
    );
  }
}
