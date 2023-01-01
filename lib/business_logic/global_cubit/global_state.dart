// ignore_for_file: prefer_typing_uninitialized_variables

part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitialStates extends GlobalState {}

class LoadingGlobalStates extends GlobalState {}

class SuccessGlobalStates extends GlobalState {
  late final HomeModel homeModel;
  SuccessGlobalStates({required this.homeModel});
}

class ErrorGlobalStates extends GlobalState {
  late final error;
  ErrorGlobalStates({required this.error});
}

class ChangeViewGlobalStates extends GlobalState {}

