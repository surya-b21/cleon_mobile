// ignore_for_file: camel_case_types

part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent {}

class changeToSs extends ShopEvent {}

class changeToTimeBase extends ShopEvent {}

class changeToKuota extends ShopEvent {}

class changeToUnlimited extends ShopEvent {}
