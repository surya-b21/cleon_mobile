// ignore_for_file: must_be_immutable

part of 'shop_bloc.dart';

@immutable
class ShopState {
  Widget currentWidget;

  ShopState({required this.currentWidget});
}

class ShopInitial extends ShopState {
  ShopInitial() : super(currentWidget: const Ss());
}
