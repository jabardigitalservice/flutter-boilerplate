import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:flutter_boilerplate/constants/dimens.dart';
import 'package:flutter_boilerplate/constants/strings.dart';
import 'package:flutter_boilerplate/cubits/banner/banners_cubit.dart';
import 'package:flutter_boilerplate/screens/home/home_detail_screen.dart';
import 'package:flutter_boilerplate/widgets/banner_list_slider.dart';
import 'package:flutter_boilerplate/widgets/empty_data.dart';

const double _fabDimension = 56.0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: Dimens.vertical_padding),
          children: [
            BlocProvider<BannersCubit>(
              create: (_) => BannersCubit()..loadBanners(),
              child: BannerListSlider(),
            ),
            EmptyData(title: Strings.emptyData,),
          ],
        )
      ),
      floatingActionButton: _floatingButtonOpenContainer(),
    );
  }

  Widget _floatingButtonOpenContainer() {
    return OpenContainer(
      transitionType: _transitionType,
      transitionDuration: const Duration(milliseconds: 700),
      openBuilder: (BuildContext context, VoidCallback _) {
        return HomeDetailScreen();
      },
      closedElevation: 6.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_fabDimension / 2),
        ),
      ),
      closedColor: Theme.of(context).colorScheme.secondary,
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return SizedBox(
          height: _fabDimension,
          width: _fabDimension,
          child: Center(
            child: Icon(
              Icons.people,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        );
      },
    );
  }
}
