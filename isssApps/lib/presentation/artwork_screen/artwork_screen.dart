import 'package:flutter/material.dart';
import 'package:isssApps/core/app_export.dart';
import 'package:isssApps/data/data_sources/remote/artworks.dart';
import 'package:isssApps/domain/repository/artWork_repo.dart';
import 'package:isssApps/presentation/artwork_screen/bloc/artwork_bloc.dart';
import 'package:isssApps/presentation/artwork_screen/bloc/artwork_event.dart';
import 'package:isssApps/presentation/artwork_screen/bloc/artwork_state.dart';
import 'package:isssApps/presentation/artwork_screen/models/artwork_model.dart';
import 'package:isssApps/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';

class ArtWorkPage extends StatelessWidget {
  static Widget builder(BuildContext context) {
    // context.read<ArtWorkBloc>().add(ArtWorkInitializeEvent());

    return BlocProvider<ArtWorkBloc>(
      create: (context) => ArtWorkBloc(
          ArtWorkState(artWorkModelObj: ArtWorkStateModel()),
          ArtWorkRepository(dataSource: ArtWorkRepositoryDataSource()))
        ..add(ArtWorkInitializeEvent()),
      child: ArtWorkPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ArtWorkView();
  }
}

class ArtWorkView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.gray50,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            height: getVerticalSize(53),
            leadingWidth: 40,
            centerTitle: true,
            title: Text("lbl_art_work_from".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtGilroySemiBold24)),
        body: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 16, top: 23, right: 16, bottom: 23),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(left: 10, top: 15, right: 10),
                      child: Text("msg_art_work_title".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium16),
                    ),
                    BlocSelector<ArtWorkBloc, ArtWorkState, ArtWorkStateModel?>(
                        selector: (state) => state.artWorkModelObj,
                        builder: (context, artWorkModelObj) {
                          return CustomDropDown(
                              focusNode: FocusNode(),
                              icon: Container(
                                  margin: getMargin(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorConstant.blueGray400,
                                          width: getHorizontalSize(1),
                                          strokeAlign: strokeAlignCenter)),
                                  child: Text("")),
                              hintText: "msg_art_works_title".tr,
                              margin: getMargin(top: 6, left: 10, right: 10),
                              items: artWorkModelObj!.dropdownItemList,
                              onChanged: (value) {
                                context
                                    .read<ArtWorkBloc>()
                                    .add(ChangeDropDownEvent(value: value));
                                // context
                                //     .read<ArtWorkBloc>()
                                //     .add(fetchArtWorkEvent(value: value));
                              });
                        }),

                    Padding(
                      padding: getPadding(left: 10, top: 15, right: 10),
                      child: Text("msg_artist_title".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium16),
                    ),
                    BlocSelector<ArtWorkBloc, ArtWorkState,
                            TextEditingController?>(
                        selector: (state) => state.nameController,
                        builder: (context, nameController) {
                          return CustomTextFormField(
                            readonly: false,
                            controller: nameController,
                            focusNode: FocusNode(),
                            hintText: "msg_artist_title".tr,
                            margin: getMargin(top: 6, left: 10, right: 10),
                          );
                        }),
                    Padding(
                      padding: getPadding(left: 10, top: 15, right: 10),
                      child: Text("msg_artist_title".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium16),
                    ),
                    BlocSelector<ArtWorkBloc, ArtWorkState,
                            TextEditingController?>(
                        selector: (state) => state.linkController,
                        builder: (context, linkController) {
                          return CustomTextFormField(
                            readonly: false,
                            controller: linkController,
                            focusNode: FocusNode(),
                            hintText: "msg_artist_title".tr,
                            margin: getMargin(top: 6, left: 10, right: 10),
                          );
                        }),
                    Padding(
                      padding: getPadding(left: 10, top: 15, right: 10),
                      child: Text("msg_artist_title".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium16),
                    ),
                    BlocSelector<ArtWorkBloc, ArtWorkState,
                            TextEditingController?>(
                        selector: (state) => state.groupController,
                        builder: (context, groupController) {
                          return CustomTextFormField(
                            readonly: false,
                            controller: groupController,
                            focusNode: FocusNode(),
                            hintText: "msg_artist_title".tr,
                            margin: getMargin(top: 6, left: 10, right: 10),
                          );
                        }),

                    Padding(
                      padding: getPadding(left: 10, top: 15, right: 10),
                      child: Text("msg_artist_title".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium16),
                    ),
                    BlocSelector<ArtWorkBloc, ArtWorkState,
                            TextEditingController?>(
                        selector: (state) => state.valueController,
                        builder: (context, valueController) {
                          return CustomTextFormField(
                            readonly: false,
                            controller: valueController,
                            focusNode: FocusNode(),
                            hintText: "msg_artist_title".tr,
                            margin: getMargin(top: 6, left: 10, right: 10),
                          );
                        }),

                    // } else if (state is ArtWorkError) {
                    //   return Center(
                    //       child: Text('Failed to load dropdown values.'));
                    // } else {
                    //   return Center(child: Text('Initial State'));
                    // }
                  ]),
            )));
  }

  onTapImgArrowleft(BuildContext context) {
    NavigatorService.goBack();
  }
}
