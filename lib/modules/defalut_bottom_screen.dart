import 'package:app01/layout/mukmin_app/cubit/cubit.dart';
import 'package:app01/layout/mukmin_app/cubit/states.dart';
import 'package:app01/shared/componants/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Default extends StatefulWidget {
  String screenTitle = '';
  Default(this.screenTitle);

  @override
  _DefaultState createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
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
              body: CustomScrollView(
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
                          padding: EdgeInsets.only(top: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  // left: width * 0.4,
                                  // right: width * 0.4,
                                  top: 5.0,
                                ),
                                child: Text(
                                  '${widget.screenTitle}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    backgroundColor: Colors.transparent,
                    leading: Icon(null),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
