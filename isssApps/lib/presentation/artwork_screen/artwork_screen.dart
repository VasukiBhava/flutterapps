import 'package:flutter/material.dart';
import 'package:isssApps/core/app_export.dart';
import 'package:isssApps/data/data_sources/remote/artworks.dart';
import 'package:isssApps/domain/repository/artWork_repo.dart';
import 'package:isssApps/presentation/artwork_screen/bloc/artwork_bloc.dart';
import 'package:isssApps/presentation/artwork_screen/bloc/artwork_event.dart';
import 'package:isssApps/presentation/artwork_screen/bloc/artwork_state.dart';
import 'package:isssApps/presentation/artwork_screen/models/artwork_model.dart';

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
              padding: getPadding(left: 16, top: 23, right: 16, bottom: 23),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("msg_art_work_title".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtGilroyMedium16),
                    BlocSelector<ArtWorkBloc, ArtWorkState, ArtWorkStateModel?>(
                        selector: (state) => state.artWorkModelObj,
                        builder: (context, artWorkModelObj) {
                          return CustomDropDown(
                              focusNode: FocusNode(),
                              icon: Container(
                                  margin: getMargin(left: 30, right: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorConstant.blueGray400,
                                          width: getHorizontalSize(1),
                                          strokeAlign: strokeAlignCenter)),
                                  child: Text("")),
                              hintText: "Data",
                              margin: getMargin(top: 8, left: 10, right: 10),
                              items: artWorkModelObj!.dropdownItemList,
                              onChanged: (value) {
                                context
                                    .read<ArtWorkBloc>()
                                    .add(ChangeDropDownEvent(value: value));
                              });
                        }),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Text Field 1',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Text Field 2',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Text Field 3',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Text Field 4',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    )
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
