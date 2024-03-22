import 'bloc/security_policy_bloc.dart';
import 'models/security_policy_model.dart';
import 'package:flutter/material.dart';
import 'package:isssApps/core/app_export.dart';
import 'package:isssApps/core/utils/validation_functions.dart';
import 'package:isssApps/widgets/app_bar/custom_app_bar.dart';
import 'package:isssApps/widgets/custom_button.dart';
import 'package:isssApps/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SecurityPolicyScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SecurityPolicyBloc>(
        create: (context) => SecurityPolicyBloc(
            SecurityPolicyState(securityPolicyModelObj: SecurityPolicyModel()))
          ..add(SecurityPolicyInitialEvent()),
        child: SecurityPolicyScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(53),
                leadingWidth: 40,
                leading: CustomImageView(
                    svgPath: ImageConstant.imgArrowleft,
                    height: getSize(24),
                    width: getSize(24),
                    margin: getMargin(left: 16, top: 12, bottom: 17),
                    onTap: () {
                      onTapImgArrowleft(context);
                    }),
                centerTitle: true,
                title: Text("lbl_login".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroySemiBold24)),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 23, right: 16, bottom: 23),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("msg_username_or_email".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroyMedium16),
                          BlocSelector<SecurityPolicyBloc, SecurityPolicyState,
                                  TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                    focusNode: FocusNode(),
                                    controller: emailController,
                                    hintText: "msg_michellerock_gmail_com".tr,
                                    margin: getMargin(top: 8),
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "Please enter valid email";
                                      }
                                      return null;
                                    });
                              }),
                          Padding(
                              padding: getPadding(top: 19),
                              child: Text("lbl_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray900)),
                          BlocBuilder<SecurityPolicyBloc, SecurityPolicyState>(
                              builder: (context, state) {
                            return CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: state.group10198Controller,
                                hintText: "lbl_enter_password".tr,
                                margin: getMargin(top: 7),
                                padding: TextFormFieldPadding.PaddingT12,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      context.read<SecurityPolicyBloc>().add(
                                          ChangePasswordVisibilityEvent(
                                              value: !state.isShowPassword));
                                    },
                                    child: Container(
                                        margin: getMargin(all: 12),
                                        child: CustomImageView(
                                            svgPath: state.isShowPassword
                                                ? ImageConstant.imgEye
                                                : ImageConstant.imgEye))),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(44)),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "Please enter valid password";
                                  }
                                  return null;
                                },
                                isObscureText: state.isShowPassword);
                          }),
                          Padding(
                              padding: getPadding(top: 20),
                              child: Text("msg_sequrity_question".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray900)),
                          Container(
                              margin: getMargin(top: 6),
                              padding: getPadding(all: 10),
                              decoration: AppDecoration.outlineBluegray100
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder6),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: getPadding(
                                            left: 2, top: 3, bottom: 1),
                                        child: Text(
                                            "msg_what_was_your_first".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtGilroyMedium16Bluegray200)),
                                    CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowdownBlueGray600,
                                        height: getSize(24),
                                        width: getSize(24))
                                  ])),
                          Padding(
                              padding: getPadding(top: 19),
                              child: Text("lbl_answer".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          BlocSelector<SecurityPolicyBloc, SecurityPolicyState,
                                  TextEditingController?>(
                              selector: (state) =>
                                  state.group10198OneController,
                              builder: (context, group10198OneController) {
                                return CustomTextFormField(
                                    focusNode: FocusNode(),
                                    controller: group10198OneController,
                                    hintText: "lbl_pluto".tr,
                                    margin: getMargin(top: 7),
                                    textInputAction: TextInputAction.done);
                              }),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "lbl_sign_in".tr,
                              margin: getMargin(top: 24, bottom: 5))
                        ])))));
  }

  onTapImgArrowleft(BuildContext context) {
    NavigatorService.goBack();
  }
}
