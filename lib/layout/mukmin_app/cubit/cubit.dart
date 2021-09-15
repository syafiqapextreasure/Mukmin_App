import 'package:app01/layout/mukmin_app/cubit/states.dart';
import 'package:app01/models/mukmin.dart';
import 'package:app01/shared/componants/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MukminCubit extends Cubit<MukminStates> {
  MukminCubit() : super(MukminInitialState());

  static MukminCubit getCubitObj(context) {
    return BlocProvider.of(context);
  }

  List<String> bottomIcons = [
    'assets/images/1/Vector.png',
    'assets/images/1/Union.png',
    'assets/images/1/quran icon1.png',
    'assets/images/1/quran icon.png',
    'assets/images/2/5.png',
    'assets/images/2/6.png',
    'assets/images/2/7.png',
    'assets/images/2/8.png',
    'assets/images/3/9.png',
    'assets/images/3/10.png',
    'assets/images/3/11.png',
    'assets/images/3/12.png',
    'assets/images/4/13.png',
    'assets/images/4/14.png',
    'assets/images/4/15.png',
    'assets/images/4/16.png',
  ];
  List<String> lables = [
    'Utama',
    'Qiblat',
    'Quran',
    'Hadith',
    'Doa',
    'Artikel',
    'Sumbangan',
    'Masjid/Surau',
    'Kalendar',
    'Zikir',
    'Restoran Halal',
    'Sirah',
    'Motivasi',
    'Sirah',
    'Restoran Halal',
    'Tetapan',
  ];

  String gridIcon = 'assets/images/gridicons_grid.png';
  bool isTwo = false;

  void changeGrid() {
    isTwo = !isTwo;

    gridIcon = isTwo
        ? 'assets/images/bx_bxs-grid-alt.png'
        : 'assets/images/gridicons_grid.png';
    emit(MukminGridChangeState());
  }

  int imageIndex = 0;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  void changeImage(int index) {
    imageIndex = index;
    crossFadeState = crossFadeState == CrossFadeState.showSecond
        ? CrossFadeState.showFirst
        : CrossFadeState.showSecond;
    print(imageIndex);
    emit(MukminImageChangeState());
  }

  List<HadithModel> hadithData = [
    HadithModel(
      image: 'assets/images/Rectangle 395.png',
      title: 'Taubat',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 396.png',
      title: 'Solawat',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 397.png',
      title: 'Al-Quran',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 398.png',
      title: 'Iman',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 399.png',
      title: 'Islam',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 400.png',
      title: 'Solat',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 401.png',
      title: 'Kubur',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 402.png',
      title: 'Syurga',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 403.png',
      title: 'Neraka',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 404.png',
      title: 'Ilmu',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 405.png',
      title: 'Kerja',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 406.png',
      title: 'Dosa Syirik',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 403.png',
      title: 'Neraka',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 404.png',
      title: 'Ilmu',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 405.png',
      title: 'Kerja',
    ),
    HadithModel(
      image: 'assets/images/Rectangle 406.png',
      title: 'Dosa Syirik',
    ),
  ];

  int hadithItemIndex = 0;

  Color favColor = Colors.white;
  void changeFavorite() {
    favColor = favColor == Colors.white ? Colors.red : Colors.white;
    emit(MukminFavoriteChangeState());
  }

  Color favColor_outlined = Colors.white;
  void changeFavoriteOutlined({bool imageLoved = false}) {
    //when Api used.. use imageLoved
    favColor_outlined =
        favColor_outlined == Colors.white ? Colors.red : Colors.white;
    emit(MukminFavoriteChangeState());
  }

  Color menuColor = HexColor('#1A1317');

  void menucolorChange() {
    menuColor = Colors.black;
    emit(MukminMenuColorChangeState());
  }
//

}
