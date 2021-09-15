import 'package:app01/layout/mukmin_app/cubit/cubit.dart';
import 'package:app01/layout/mukmin_app/cubit/states.dart';
import 'package:app01/modules/ayat.dart';
import 'package:app01/modules/hadeth_detail.dart';
import 'package:app01/shared/componants/componants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MukminLayout extends StatefulWidget {
  @override
  _MukminLayoutState createState() => _MukminLayoutState();
}

class _MukminLayoutState extends State<MukminLayout> {
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MukminCubit, MukminStates>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        //declarations
        MukminCubit cubit = MukminCubit.getCubitObj(context);
        final hadithData = cubit.hadithData;
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        final key1 = GlobalKey();

        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

        return Scaffold(
          extendBodyBehindAppBar: true,
          body: SlidingUpPanel(
            minHeight: 64,
            maxHeight: 265,
            // maxHeight: 265,
            color: Colors.black.withOpacity(0.5),
            panel: bottomNavBarWithOpacity(context: context),
            body: OrientationBuilder(builder: (context, orientation) {
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    floating: false,
                    expandedHeight: width * 0.267,
                    bottom: PreferredSize(
                      // Add this code
                      preferredSize: Size.fromHeight(30.0), // Add this code
                      child: Text(''), // Add this code
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
                        // Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      //  width * 0.32,
                                      orientation == Orientation.portrait
                                          ? width * 0.32
                                          : width * 0.4,
                                  top: 2.0,
                                ),
                                child: Text(
                                  "Hadith Pilihan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 15, bottom: 7.0),
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
                    // FlexibleSpaceBar(
                    //   centerTitle: true,
                    //   title: Padding(
                    //     // padding: const EdgeInsets.fromLTRB(0, 0, 0, 17.0),
                    //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),

                    //     child: Text(
                    //       'Hadith Pilihan',
                    //       textScaleFactor: 1.0,
                    //       style: TextStyle(fontSize: 17.0),
                    //     ),
                    // ),
                    // background:
                    // Stack(
                    //   children: <Widget>[
                    //     Image.asset(
                    //       'assets/images/Frame1.png',
                    //       height: double.infinity,
                    //       width: double.infinity,
                    //     ),
                    //     Image.asset(
                    //       'assets/images/Group.png',
                    //       height: double.infinity,
                    //       width: double.infinity,
                    //     ),
                    //     Opacity(
                    //       opacity: 0.5,
                    //       child: Image.asset(
                    //         'assets/images/Rectangle 383.png',
                    //         height: double.infinity,
                    //         width: double.infinity,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // ),
                    backgroundColor: Colors.transparent,
                    // actions: [
                    //   IconButton(
                    //       // padding: EdgeInsets.fromLTRB(0.0, 25.0, 15.0, 0.0),
                    //       padding: EdgeInsets.fromLTRB(0.0, 30.0, 15.0, 0.0),
                    //       alignment: Alignment.bottomRight,
                    //       onPressed: () {
                    //         cubit.changeFavorite();
                    //       },
                    //       icon: Icon(
                    //         Icons.favorite,
                    //         size: 35.0,
                    //         color: cubit.favColor,
                    //       ))
                    // ],
                    leading: Icon(
                      null,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(15.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 3 : 5,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: 1 / 1.3,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              cubit.hadithItemIndex = index;
                              navigateTo(
                                  context: context,
                                  leftToRightTransasion: true,
                                  screen: DetailScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    '${hadithData[index].image}',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                    '${hadithData[index].title}',
                                    style: TextStyle(
                                      color: HexColor('#A2CC80'),
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: hadithData.length,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
