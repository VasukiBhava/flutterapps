import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/home_bloc.dart';
import 'models/grid_item_model.dart';
import 'models/home_model.dart';
import 'models/person_item_model.dart';
import 'widgets/grid_item_widget.dart';
import 'widgets/person_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 1123.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        _buildGrid(context),
                        _buildProfile(context),
                        _buildButton(context),
                      ],
                    ),
                  ),
                  SizedBox(height: 31.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.h),
                      child: Text(
                        'lbl_our_specialists'.tr,
                        style: CustomTextStyles.titleMediumGray90001,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildPerson(context),
                  SizedBox(height: 45.v),
                  _buildAddress(context),
                  SizedBox(height: 45.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGrid(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25.h,
          vertical: 38.v,
        ),
        decoration: AppDecoration.fillGreenA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 102.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'lbl_choose_problems'.tr,
                style: CustomTextStyles.titleMediumGray90001,
              ),
            ),
            SizedBox(height: 15.v),
            BlocSelector<HomeBloc, HomeState, HomeModel?>(
              selector: (state) => state.homeModelObj,
              builder: (context, homeModelObj) {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 147.v,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.h,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeModelObj?.gridItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    GirdItemModel model =
                        homeModelObj?.gridItemList[index] ?? GirdItemModel();
                    return GirdItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
            SizedBox(height: 25.v),
            SizedBox(
              height: 10.v,
              child: AnimatedSmoothIndicator(
                activeIndex: 0,
                count: 2,
                effect: ScrollingDotsEffect(
                  activeDotColor: const Color(0X1212121D),
                  dotHeight: 10.v,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: BlocSelector<HomeBloc, HomeState, TextEditingController?>(
        selector: (state) => state.searchController,
        builder: (context, searchController) {
          return CustomTextFormField(
            controller: searchController,
            hintText: 'lbl_search_doctor'.tr,
            suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 11.v, 20.h, 11.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgUserGray90002,
                height: 23.adaptSize,
                width: 23.adaptSize,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 45.v,
            ),
            contentPadding: EdgeInsets.only(
              left: 20.h,
              top: 13.v,
              bottom: 13.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildProfile(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 395.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse7135,
              height: 395.v,
              width: 430.h,
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.h,
                      vertical: 18.v,
                    ),
                    decoration: AppDecoration.fillPrimary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgPexelsPhotoBy,
                          height: 50.adaptSize,
                          width: 50.adaptSize,
                          radius: BorderRadius.circular(
                            25.h,
                          ),
                          margin: EdgeInsets.only(top: 22.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.h,
                            top: 27.v,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'lbl_welcome'.tr,
                                style: CustomTextStyles.bodySmallWhiteA70012,
                              ),
                              SizedBox(height: 1.v),
                              Text(
                                'lbl_misty_simon'.tr,
                                style: CustomTextStyles.titleMediumBold,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.imgCamera,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          margin: EdgeInsets.only(
                            top: 32.v,
                            bottom: 10.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.v),
                  _buildSearch(context),
                  SizedBox(height: 26.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.h),
                      child: Text(
                        'msg_appointment_booking'.tr,
                        style: CustomTextStyles.titleMediumBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, TextEditingController?>(
      selector: (state) => state.nameController,
      builder: (context, nameController) {
        return CustomTextFormField(
          controller: nameController,
          hintText: 'lbl_enter_name'.tr,
          validator: (value) {
            if (!isText(value)) {
              return 'err_msg_please_enter_valid_text'.tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, TextEditingController?>(
      selector: (state) => state.dateController,
      builder: (context, dateController) {
        return CustomTextFormField(
          controller: dateController,
          hintText: 'msg_choose_date_time'.tr,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildChooseProblem(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, TextEditingController?>(
      selector: (state) => state.chooseProblemController,
      builder: (context, chooseProblemController) {
        return CustomTextFormField(
          controller: chooseProblemController,
          hintText: 'lbl_choose_problem'.tr,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildChooseTest(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, TextEditingController?>(
      selector: (state) => state.chooseTestController,
      builder: (context, chooseTestController) {
        return CustomTextFormField(
          controller: chooseTestController,
          hintText: 'lbl_choose_test'.tr,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildChooseConsultation(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, TextEditingController?>(
      selector: (state) => state.chooseConsultationController,
      builder: (context, chooseConsultationController) {
        return CustomTextFormField(
          controller: chooseConsultationController,
          hintText: 'msg_choose_consultation'.tr,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBookAppointment(BuildContext context) {
    return CustomElevatedButton(
      width: 340.h,
      text: 'msg_book_appointment'.tr,
      buttonStyle: CustomButtonStyles.fillPrimary,
      alignment: Alignment.topCenter,
    );
  }

  /// Section Widget
  Widget _buildButton(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: 25.h,
          top: 228.v,
          right: 25.h,
        ),
        padding: EdgeInsets.all(20.h),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildName(context),
            SizedBox(height: 20.v),
            _buildDate(context),
            SizedBox(height: 20.v),
            _buildChooseProblem(context),
            SizedBox(height: 20.v),
            _buildChooseTest(context),
            SizedBox(height: 20.v),
            _buildChooseConsultation(context),
            SizedBox(height: 20.v),
            SizedBox(
              height: 53.v,
              width: 340.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 16.v,
                      width: 305.h,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(
                          152.h,
                        ),
                      ),
                    ),
                  ),
                  _buildBookAppointment(context),
                ],
              ),
            ),
            SizedBox(height: 7.v),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPerson(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 22.h,
        right: 28.h,
      ),
      child: BlocSelector<HomeBloc, HomeState, HomeModel?>(
        selector: (state) => state.homeModelObj,
        builder: (context, homeModelObj) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 243.v,
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 20.h,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeModelObj?.personItemList.length ?? 0,
            itemBuilder: (context, index) {
              PersonItemModel model =
                  homeModelObj?.personItemList[index] ?? PersonItemModel();
              return PersonItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return Container(
      height: 233.v,
      width: double.maxFinite,
      decoration: AppDecoration.fillGray900.copyWith(
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup46,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgObject,
            height: 168.v,
            width: 239.h,
            alignment: Alignment.topRight,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 25.h,
                top: 25.v,
              ),
              child: Text(
                'lbl_address'.tr,
                style: CustomTextStyles.titleMediumBold_1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(
                left: 25.h,
                right: 190.h,
                bottom: 37.v,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 15.v,
              ),
              decoration: AppDecoration.fillBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'lbl_dental_clinic'.tr,
                    style: CustomTextStyles.titleMediumDeepPurpleA100,
                  ),
                  Container(
                    width: 147.h,
                    margin: EdgeInsets.only(right: 27.h),
                    child: Text(
                      'msg_34_harsh_heights'.tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmallWhiteA700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
