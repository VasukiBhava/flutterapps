import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/grid_item_model.dart';

// ignore: must_be_immutable
class GirdItemWidget extends StatelessWidget {
  GirdItemWidget(
    this.gridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GirdItemModel gridItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineTeal.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 52.v,
                width: 93.h,
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                decoration: AppDecoration.outlineWhiteA.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: CustomImageView(
                  imagePath: gridItemModelObj.dentalBraces,
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30.h,
                  bottom: 25.v,
                ),
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder13,
                ),
                child: Container(
                  height: 13.adaptSize,
                  width: 13.adaptSize,
                  decoration: BoxDecoration(
                    color: appTheme.cyanA400,
                    borderRadius: BorderRadius.circular(
                      6.h,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: appTheme.cyanA400,
                        spreadRadius: 2.h,
                        blurRadius: 2.h,
                        offset: const Offset(
                          0,
                          0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 17.v),
          Text(
            gridItemModelObj.dentalBraces1!,
            style: CustomTextStyles.titleMediumGray9000118,
          ),
          SizedBox(height: 19.v),
        ],
      ),
    );
  }
}
