import 'package:app01/layout/mukmin_app/cubit/cubit.dart';
import 'package:app01/layout/mukmin_app/cubit/states.dart';
import 'package:app01/layout/mukmin_app/mukmin_layout.dart';
import 'package:app01/shared/componants/componants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  List<String> hadithImages = [
    'assets/images/hadeth_detail/image 4.png',
    'assets/images/hadeth_detail/image 5.png',
    'assets/images/hadeth_detail/image 6.png',
    'assets/images/hadeth_detail/image 7.png',
    'assets/images/hadeth_detail/image 8.png',
    'assets/images/hadeth_detail/image 9.png',
    'assets/images/hadeth_detail/image 10.png',
    'assets/images/hadeth_detail/image 11.png',
    'assets/images/hadeth_detail/image 12.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MukminCubit, MukminStates>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        MukminCubit cubit = MukminCubit.getCubitObj(context);
        double width = MediaQuery.of(context).size.width;

        return OrientationBuilder(
          builder: (context, orientation) => Scaffold(
            extendBodyBehindAppBar: true,
            body: detailsBuilderNestedLayersWithOverlay(
              context: context,
              imagesList: hadithImages,
              appBarTitle: '${cubit.hadithData[cubit.hadithItemIndex].title}',
              leadingIcon: Icons.arrow_back_ios_new_rounded,
              leadingFun: () {
                Navigator.pop(context);
              },
              favColor: cubit.favColor_outlined,
              favFuction: () => cubit.changeFavoriteOutlined(),
              leftPadding: orientation == Orientation.portrait
                  ? width * 0.28
                  : width * 0.4,
            ),
          ),
        );
      },
    );
  }
}
