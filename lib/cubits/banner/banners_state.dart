part of 'banners_cubit.dart';

abstract class BannersState extends Equatable {
  const BannersState([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [];
}

class BannersInitial extends BannersState {
}

class BannersLoading extends BannersState {
}

class BannersLoaded extends BannersState {
  final List<BannerModel> listBanners;

  const BannersLoaded({@required this.listBanners});

  @override
  List<Object> get props => [listBanners];
}

class BannersError extends BannersState {
  final String error;

  const BannersError({@required this.error});

  @override
  List<Object> get props => [error];
}
