import 'package:bloc/bloc.dart';
import 'package:cleon_mobile/views/shop/kuota.dart';
import 'package:cleon_mobile/views/shop/ss.dart';
import 'package:cleon_mobile/views/shop/timebase.dart';
import 'package:cleon_mobile/views/shop/unlimited.dart';
import 'package:flutter/cupertino.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitial()) {
    on<changeToSs>((event, emit) =>
        emit(ShopState(currentWidget: state.currentWidget = const Ss())));
    on<changeToTimeBase>((event, emit) =>
        emit(ShopState(currentWidget: state.currentWidget = const TimeBase())));
    on<changeToKuota>((event, emit) =>
        emit(ShopState(currentWidget: state.currentWidget = const Kuota())));
    on<changeToUnlimited>((event, emit) => emit(
        ShopState(currentWidget: state.currentWidget = const Unlimited())));
  }
}
