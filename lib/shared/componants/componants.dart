import 'dart:ui';

import 'package:app01/layout/mukmin_app/cubit/cubit.dart';
import 'package:app01/layout/mukmin_app/cubit/states.dart';
import 'package:app01/layout/mukmin_app/mukmin_layout.dart';
import 'package:app01/modules/ayat.dart';
import 'package:app01/modules/defalut_bottom_screen.dart';
import 'package:app01/modules/motivasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share/share.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<dynamic> navigateTo({
  required BuildContext context,
  required Widget screen,
  bool leftToRightTransasion = false,
}) {
  if (!leftToRightTransasion)
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  else
    return Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: 300),
            child: screen));
}

Future<dynamic> navigateAndfinish({
  required BuildContext context,
  required Widget screen,
  bool rightToLeftTransasion = false,
}) {
  if (!rightToLeftTransasion)
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  else
    return Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 300),
            child: screen));
}

Widget imageBottomRow({
  required BuildContext context,
  required String sharedImage,
  required VoidCallback favFuction,
  required Color favColor,
}) {
  MukminCubit cubit = MukminCubit.getCubitObj(context);

  return Row(
    children: [
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: favFuction,
        icon: Icon(
          Icons.favorite_outline,
          color: favColor,
          size: 30,
        ),
      ),
      Expanded(
        child: Text(
          'Suka',
          style: TextStyle(color: Colors.white),
        ),
      ),
      IconButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () async {
          try {
            final ByteData bytes = await rootBundle.load('${sharedImage}');
            await WcFlutterShare.share(
                sharePopupTitle: 'Share Image',
                fileName: 'share.png',
                mimeType: 'image/png',
                bytesOfFile: bytes.buffer.asUint8List());
          } catch (e) {
            print('error: $e');
          }
        },
        icon: Image.asset(
          'assets/images/share.png',
          height: 25.0,
          fit: BoxFit.cover,
        ),
      ),
      Text(
        'Kongsi',
        style: TextStyle(color: Colors.white),
      ),
      SizedBox(
        width: 15.0,
      ),
      IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                String dialogContent =
                    'Selawat adalah perkataan jama’ bagi solat yang bermaksud doa atau pujian. Tambahan pula, makna selawat Allah SWT, selawat para malaikat dan juga selawat manusia adalah berbeza di antara satu sama lain. Selawat Allah ialah pujian-Nya di sisi para malaikat yang tinggi. Manakala selawat malaikat pula ialah doa tambahan gandaan pahala dan selawat orang mukmin ialah berdoa memohon supaya Allah SWT melimpahkan rahmat, menambahkan kemuliaan, kehormatan dan kepujian kepada penghulu kita Nabi Muhammad SAW.\n\nZikir dari sudut bahasa bermaksud mengingati. Manakala dari sudut istilah pula, zikir merupakan sesuatu perkara yang dilakukan dengan tujuan mengingati Allah SWT dengan cara-cara yang dibolehkan oleh syarak seperti menerusi ucapan, perbuatan atau dengan hati.';

                return AlertDialog(
                  scrollable: true,
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        'Sumber hadith',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      IconButton(
                        alignment: Alignment.topRight,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          'assets/images/ei_close-o.png',
                          height: 25.0,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        dialogContent,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 11.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final box = context.findRenderObject() as RenderBox?;
                          await Share.share(dialogContent,
                              subject: 'Pergi ke pautan sumber',
                              sharePositionOrigin:
                                  box!.localToGlobal(Offset.zero) & box.size);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor('#524D9F'),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 7,
                          ),
                          margin: EdgeInsets.all(15.0),
                          height: 39.0,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/share.png',
                                height: 25.0,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  'Pergi ke pautan sumber',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  backgroundColor: HexColor('#3A343D'),
                );
              });
        },
        icon: Image.asset(
          'assets/images/more.png',
          height: 25.0,
          fit: BoxFit.cover,
        ),
      ),
      Text(
        'Info Lanjut',
        style: TextStyle(color: Colors.white),
      ),
      SizedBox(
        width: 10.0,
      ),
    ],
  );
}

Widget detailsBuilder({
  required BuildContext context,
  required List<String> imagesList,
  required String appBarTitle,
  IconData? leadingIcon,
  VoidCallback? leadingFun,
  bool showFavorite = false,
  bool twoDGrid = true,
  required VoidCallback favFuction,
  required Color favColor,
}) {
  MukminCubit cubit = MukminCubit.getCubitObj(context);
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.width;

  return OrientationBuilder(
    builder: (context, orientation) => SlidingUpPanel(
      minHeight: 64,
      maxHeight: 265,
      color: Colors.black.withOpacity(0.5),
      panel: bottomNavBarWithOpacity(context: context),
      body: OrientationBuilder(
        builder: (context, orientation) => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 540),
              child: ParallaxStack(
                layers: [
                  GridView.count(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: twoDGrid ? 2 : 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1 / 1,
                    children: List.generate(
                      imagesList.length,
                      (index) => InkWell(
                        child: Image.asset(
                          '${imagesList[index]}',
                          fit: BoxFit.fitWidth,
                        ),
                        onTap: () {
                          cubit.changeImage(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverAppBar(
                  floating: false,
                  expandedHeight: width * 0.267,
                  bottom: PreferredSize(
                    //
                    preferredSize: Size.fromHeight(30.0),
                    child: Text(''),
                  ),
                  flexibleSpace: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      Container(
                        width: width,
                        height: width * 0.267,
                        child: FlexibleSpaceBar(
                          background: Stack(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/Frame1.png',
                                height: double.infinity,
                                width: double.infinity,
                              ),
                              Image.asset(
                                'assets/images/Group.png',
                                height: double.infinity,
                                width: double.infinity,
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  'assets/images/Rectangle 383.png',
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: leadingFun,
                              icon: Icon(
                                leadingIcon,
                                size: 35.0,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: orientation == Orientation.portrait
                                    ? width * 0.32
                                    : width * 0.4,
                                top: 2,
                              ),
                              child: Text(
                                "$appBarTitle",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                                width: 35.0,
                                height: 35.0,
                                color: Colors.transparent,
                                child: showFavorite
                                    ? IconButton(
                                        alignment: Alignment.bottomRight,
                                        onPressed: () {
                                          cubit.changeFavorite();
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          size: 35.0,
                                          color: cubit.favColor,
                                        ),
                                      )
                                    : Text('')),
                          ],
                        ),
                      )
                    ],
                  ),
                  backgroundColor: Colors.transparent,
                  leading: Icon(null),
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                  [
                    AnimatedCrossFade(
                      firstChild: Image.asset(
                        '${imagesList[cubit.imageIndex]}',
                        width: width,
                      ),
                      secondChild: Image.asset(
                        '${imagesList[cubit.imageIndex]}',
                        fit: BoxFit.cover,
                        width: width,
                      ),
                      crossFadeState: cubit.crossFadeState,
                      firstCurve: Curves.bounceInOut,
                      secondCurve: Curves.easeInBack,
                      duration: Duration(milliseconds: 500),
                    ),
                    Container(
                        color: HexColor('#171518'),
                        child: imageBottomRow(
                          context: context,
                          sharedImage: imagesList[cubit.imageIndex],
                          favColor: favColor,
                          favFuction: favFuction,
                        )),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget detailsBuilderNestedLayersWithOverlay({
  required BuildContext context,
  required List<String> imagesList,
  required String appBarTitle,
  IconData? leadingIcon,
  VoidCallback? leadingFun,
  bool showFavorite = false,
  bool twoDGrid = true,
  required VoidCallback favFuction,
  required Color favColor,
  required double leftPadding,
}) {
  MukminCubit cubit = MukminCubit.getCubitObj(context);
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  return OrientationBuilder(
    builder: (context, orientation) => SlidingUpPanel(
      minHeight: 64,
      maxHeight: 265,
      color: Colors.black.withOpacity(0.5),
      panel: bottomNavBarWithOpacity(context: context),
      body: OrientationBuilder(
        builder: (context, orientation) => Stack(
          children: [
            NestedScrollView(
              physics: NeverScrollableScrollPhysics(),
              headerSliverBuilder: (context, isScolled) {
                return [
                  SliverAppBar(
                    floating: false,
                    expandedHeight: width * 0.267,
                    bottom: PreferredSize(
                      //
                      preferredSize: Size.fromHeight(30.0),
                      child: Text(''),
                    ),
                    flexibleSpace: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        Container(
                          width: width,
                          height: width * 0.267,
                          child: FlexibleSpaceBar(
                            //  title: Text("Hadith Pilihan"),
                            background: Stack(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/Frame1.png',
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                                Image.asset(
                                  'assets/images/Group.png',
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                                Opacity(
                                  opacity: 0.5,
                                  child: Image.asset(
                                    'assets/images/Rectangle 383.png',
                                    height: double.infinity,
                                    width: double.infinity,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: leadingFun,
                                icon: Icon(
                                  leadingIcon,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: leftPadding,
                                  top: 2,
                                ),
                                child: Text(
                                  "$appBarTitle",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                  width: 35.0,
                                  height: 35.0,
                                  color: Colors.transparent,
                                  child: showFavorite
                                      ? IconButton(
                                          alignment: Alignment.bottomRight,
                                          onPressed: () {
                                            cubit.changeFavorite();
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            size: 35.0,
                                            color: cubit.favColor,
                                          ),
                                        )
                                      : Text('')),
                            ],
                          ),
                        )
                      ],
                    ),
                    backgroundColor: Colors.transparent,
                    leading: Icon(null),
                  ),
                ];
              },
              body: ParallaxStack(
                layers: [
                  ListView(
                    children: [
                      Container(
                        color: HexColor('#3A343D'),
                        child: Container(
                          height: orientation == Orientation.portrait
                              ? height * 0.531
                              : width, //image covers all screen
                          width: width,
                          child: AnimatedCrossFade(
                            firstChild: Image.asset(
                              '${imagesList[cubit.imageIndex]}',
                              fit: BoxFit.cover,

                              // width: width,
                            ),
                            secondChild: Image.asset(
                              '${imagesList[cubit.imageIndex]}',
                              fit: BoxFit.cover,
                              // width: width,
                            ),
                            crossFadeState: cubit.crossFadeState,
                            firstCurve: Curves.bounceInOut,
                            secondCurve: Curves.easeInBack,
                            duration: Duration(milliseconds: 500),
                          ),
                        ),
                      ),
                      Container(
                          color: HexColor('#171518'),
                          child: imageBottomRow(
                            context: context,
                            sharedImage: imagesList[cubit.imageIndex],
                            favColor: favColor,
                            favFuction: favFuction,
                          )),
                    ],
                  ),
                  ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.61),
                        child: Container(
                          color: HexColor('#3A343D'),
                          child: GridView.count(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: twoDGrid ? 2 : 3,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 1 / 1,
                            children: List.generate(
                              imagesList.length,
                              (index) => InkWell(
                                child: Image.asset(
                                  '${imagesList[index]}',
                                  fit: BoxFit.fitWidth,
                                ),
                                onTap: () {
                                  cubit.changeImage(index);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget bottomNavItemBuilder({
  required String iconPath,
  required String label,
  required BuildContext context,
  Widget? targetScreen,
}) {
  return Expanded(
    flex: 1,
    child: InkWell(
      onTap: () {
        navigateAndfinish(
          context: context,
          screen: targetScreen ?? Default(label),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Column(
          children: [
            Image.asset(iconPath,
                height: 30.0,
                // width: 22.0,
                fit: BoxFit.fitHeight),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget bottomNavBarWithOpacity({
  required BuildContext context,
}) {
  MukminCubit cubit = MukminCubit.getCubitObj(context);
  double height = MediaQuery.of(context).size.height;

  return OrientationBuilder(builder: (context, orientation) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 10,
            // bottom: 20.0,
            right: 0.0,
            left: 0.0,
          ),
          height: 265,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[0],
                    label: cubit.lables[0],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[1],
                    label: cubit.lables[1],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[2],
                    label: cubit.lables[2],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[3],
                    label: cubit.lables[3],
                    context: context,
                    targetScreen: MukminLayout(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[4],
                    label: cubit.lables[4],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[5],
                    label: cubit.lables[5],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[6],
                    label: cubit.lables[6],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[7],
                    label: cubit.lables[7],
                    context: context,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[8],
                    label: cubit.lables[8],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[9],
                    label: cubit.lables[9],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[10],
                    label: cubit.lables[10],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[11],
                    label: cubit.lables[11],
                    context: context,
                    targetScreen: AyatScreen(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[12],
                    label: cubit.lables[12],
                    context: context,
                    targetScreen: MotivasiScreen(),
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[13],
                    label: cubit.lables[13],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[14],
                    label: cubit.lables[14],
                    context: context,
                  ),
                  bottomNavItemBuilder(
                    iconPath: cubit.bottomIcons[15],
                    label: cubit.lables[15],
                    context: context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  });
}
