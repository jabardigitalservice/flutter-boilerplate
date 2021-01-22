import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/config/network/dio_client.dart';
import 'package:flutter_boilerplate/models/banner_model.dart';
import 'package:flutter_boilerplate/repositories/banner_repository.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit() : super(BannersInitial());

  void loadBanners() async {
    emit(BannersLoading());
    try {
      List<BannerModel> listBanners = await BannerRepository(DioClient()).getBanners();
      emit(BannersLoaded(listBanners: listBanners));
    } catch (e) {
      emit(BannersError(error: e.toString()));
    }
  }

}
