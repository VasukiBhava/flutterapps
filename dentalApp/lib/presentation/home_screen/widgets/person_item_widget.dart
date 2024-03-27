import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../models/person_item_model.dart';

// ignore: must_be_immutable
class PersonItemWidget extends StatelessWidget {
  PersonItemWidget(
    this.personItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  PersonItemModel personItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 242.v,
      width: 180.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.all(20.h),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder40,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: personItemModelObj.drTracyAustin,
                    height: 136.v,
                    width: 140.h,
                    radius: BorderRadius.circular(
                      30.h,
                    ),
                  ),
                  SizedBox(height: 11.v),
                  Text(
                    personItemModelObj.drTracyAustin1!,
                    style: CustomTextStyles.labelLargeOnPrimary,
                  ),
                  SizedBox(height: 2.v),
                  Text(
                    personItemModelObj.dentalSpecialist!,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          _buildBook(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBook(BuildContext context) {
    return CustomElevatedButton(
      height: 32.v,
      width: 68.h,
      text: 'lbl_book'.tr,
      buttonTextStyle: theme.textTheme.titleMedium!,
      alignment: Alignment.bottomCenter,
    );
  }
}
