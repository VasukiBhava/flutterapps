
import 'package:flutter/material.dart';
import 'package:isssApps/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isssApps/data/data_sources/remote/artworks.dart';
import 'package:isssApps/domain/repository/artWork_repo.dart';
import 'package:isssApps/presentation/artwork_screen/bloc/artwork_bloc.dart';
import 'package:isssApps/presentation/artwork_screen/bloc/artwork_state.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class ArtWorkPage extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ArtWorkBloc>(
      create: (context) => ArtWorkBloc(repository: ArtWorkRepository(dataSource: ArtWorkRepositoryDataSource())),
      child: ArtWorkPage(),
    );
  }
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
    BlocProvider(
        create: (context) => ArtWorkBloc(repository: ArtWorkRepository(dataSource: ArtWorkRepositoryDataSource())),
        child: ArtWorkView(),
      ),]),))
    );
  }

  onTapImgArrowleft(BuildContext context) {
    NavigatorService.goBack();
  }
}

class ArtWorkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtWorkBloc, ArtWorkState>(
      builder: (context, state) {
        if (state is ArtWorkLoaded) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ArtWorkLoaded) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<int>(
                  value: state.values.isNotEmpty ? state.values.first['id'] : null,
                  items: state.values.map((value) {
                    return DropdownMenuItem<int>(
                      value: value['id'],
                      child: Text(value['title']),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    print('Selected value: $newValue');
                  },
                  decoration: InputDecoration(
                    labelText: 'Dropdown',
                    border: OutlineInputBorder(),
                  ),
                ),
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
          );
        } else if (state is ArtWorkError) {
          return Center(child: Text('Failed to load dropdown values.'));
        } else {
          return Center(child: Text('Initial State'));
        }
      },
    );
  }
}
