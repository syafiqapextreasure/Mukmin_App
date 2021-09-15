import 'package:app01/layout/mukmin_app/cubit/cubit.dart';
import 'package:app01/layout/mukmin_app/cubit/states.dart';
import 'package:app01/shared/componants/componants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:share/share.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class MotivasiScreen extends StatefulWidget {
  @override
  _MotivasiScreenState createState() => _MotivasiScreenState();
}

class _MotivasiScreenState extends State<MotivasiScreen>
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

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceInOut,
  );
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MukminCubit, MukminStates>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        MukminCubit cubit = MukminCubit.getCubitObj(context);
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;

        return OrientationBuilder(builder: (context, orientation) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: SlidingUpPanel(
              minHeight: 64,
              maxHeight: 265,
              color: Colors.black.withOpacity(0.5),
              panel: bottomNavBarWithOpacity(context: context),
              body: NestedScrollView(
                physics: NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, isScolled) {
                  return [
                    SliverAppBar(
                      floating: false,
                      expandedHeight: width * 0.267,
                      bottom: PreferredSize(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(bottom: 11.0),
                                  onPressed: () {
                                    cubit.changeGrid();
                                    print(cubit.isTwo);
                                  },
                                  icon: Image.asset(
                                    cubit.gridIcon,
                                    height: 23.0,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: width * 0.06,
                                    top: 5.0,
                                  ),
                                  child: Text(
                                    "Motivasi & Inspirasi",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 7.0, right: 15.0),
                                  child: IconButton(
                                      alignment: Alignment.bottomRight,
                                      onPressed: () {
                                        cubit.changeFavorite();
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 23.0,
                                        color: cubit.favColor,
                                      )),
                                ),
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
                body: Padding(
                  padding: EdgeInsets.zero,
                  child: ParallaxStack(
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
                                  '${ayatImages[cubit.imageIndex]}',
                                  fit: BoxFit.cover,

                                  // width: width,
                                ),
                                secondChild: Image.asset(
                                  '${ayatImages[cubit.imageIndex]}',
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
                                sharedImage: ayatImages[cubit.imageIndex],
                                favColor: cubit.favColor,
                                favFuction: () {
                                  cubit.changeFavorite();
                                },
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
                              child: ScaleTransition(
                                scale: animation,
                                child: GridView.count(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: cubit.isTwo ? 2 : 3,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 1 / 1,
                                  children: List.generate(
                                    ayatImages.length,
                                    (index) => InkWell(
                                      child: Image.asset(
                                        '${ayatImages[index]}',
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
