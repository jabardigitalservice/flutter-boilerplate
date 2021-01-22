import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:flutter_boilerplate/constants/dimens.dart';
import 'package:flutter_boilerplate/constants/strings.dart';
import 'package:flutter_boilerplate/cubits/banner/banners_cubit.dart';
import 'package:flutter_boilerplate/models/banner_model.dart';
import 'package:flutter_boilerplate/widgets/empty_data.dart';
import 'package:flutter_boilerplate/widgets/skeleton.dart';
import 'package:jds_design/constants/colors.dart';

class BannerListSlider extends StatefulWidget {
  @override
  _BannerListSliderState createState() => _BannerListSliderState();
}

class _BannerListSliderState extends State<BannerListSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannersCubit, BannersState>(
      builder: (context, state) {
        return state is BannersLoaded
            ? _buildSlider(state.listBanners)
            : state is BannersError
                ? Text(state.error)
                : _buildLoading();
      },
    );
  }

  Widget _buildLoading() {
    return AspectRatio(
      aspectRatio: 21 / 10,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: Dimens.horizontal_padding),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Skeleton(
                    width: MediaQuery.of(context).size.width,
                  ),
                ));
          }),
    );
  }

  Widget _buildSlider(List<BannerModel> listBanners) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        listBanners.isNotEmpty
            ? CarouselSlider(
                options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: listBanners.length > 1 ? true : false,
                  aspectRatio: 21 / 10,
                  viewportFraction: 0.95,
                  autoPlay: listBanners.length > 1 ? true : false,
                  autoPlayInterval: Duration(seconds: 5),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: listBanners.map((BannerModel data) {
                  return Builder(builder: (BuildContext context) {
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                              imageUrl: data.imageUrl ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          topRight: Radius.circular(5.0)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) => Center(
                                  heightFactor: 10.2,
                                  child: CupertinoActivityIndicator()),
                              errorWidget: (context, url, error) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5.0),
                                        topRight: Radius.circular(5.0)),
                                  ),
                                  child: Center(
                                    child: Text('ERROR'),
                                  ))),
                        ),
                      ),
                      onTap: () {
                        if (data.actionUrl != null) {
                          //TODO: Implement click action
                        }
                      },
                    );
                  });
                }).toList(),
              )
            : EmptyData(
                title: Strings.emptyData,
                message: '',
                image: Assets.imageNotFound,
              ),

        /// Indicator
        _buildIndicator(listBanners),
      ],
    );
  }

  Widget _buildIndicator(List<BannerModel> listBanners) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listBanners.map((BannerModel data) {
          int index = listBanners.indexOf(data);
          return _currentIndex == index
              ? Container(
                  width: 24.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30.0),
                      color: JDSColors.green))
              : Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
        }).toList(),
      ),
    );
  }
}
