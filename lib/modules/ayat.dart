import 'package:app01/layout/mukmin_app/cubit/cubit.dart';
import 'package:app01/layout/mukmin_app/cubit/states.dart';
import 'package:app01/shared/componants/componants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AyatScreen extends StatefulWidget {
  @override
  _AyatScreenState createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> with TickerProviderStateMixin {
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  List<String> ayatImages = [
    'assets/images/ayat/image 4.png',
    'assets/images/ayat/image 5.png',
    'assets/images/ayat/image 6.png',
    'assets/images/ayat/image 7.png',
    'assets/images/ayat/image 8.png',
    'assets/images/ayat/image 9.png',
    'assets/images/ayat/image 10.png',
    'assets/images/ayat/image 11.png',
    'assets/images/ayat/image 12.png',
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
            body: SlidingUpPanel(
              minHeight: 64,
              maxHeight: 265,
              color: Colors.black.withOpacity(0.5),
              panel: bottomNavBarWithOpacity(context: context),
              body: detailsBuilderNestedLayersWithOverlay(
                context: context,
                imagesList: ayatImages,
                appBarTitle: 'Ayat Quran Pilihan',
                favColor: cubit.favColor_outlined,
                favFuction: () => cubit.changeFavoriteOutlined(),
                leftPadding: orientation == Orientation.portrait
                    ? width * 0.13
                    : width * 0.3,
              ),
            ),
          ),
        );
      },
    );
  }
}
